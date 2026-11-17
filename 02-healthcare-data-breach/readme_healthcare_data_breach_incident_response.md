# Incident Response & Compliance Report: Healthcare Data Breach

## Project Overview

This project documents an end-to-end **Incident Response (IR)** and **Database Security Remediation** investigation conducted for a healthcare non-profit organization managing sensitive patient claims data. Acting as an **IT Support & Security Specialist**, the objective was to assess a critical data breach alert, perform forensic log analysis, evaluate compromised Protected Health Information (PHI), contain the attack immediately, and implement long-term access control remediation using **MySQL Workbench**.

## 1. Incident Detection & Business Impact Assessment (BIA)

* **Alert Timestamp:** March 25, 2024 – 10:10 AM
* **Severity Level:** High
* **Target Asset:** `MySQL Server` (`clientdata` database)
* **Trigger Event:** Intrusion Detection System (IDS) detected multiple failed login attempts, indicating potential unauthorized access.
* **Business Impact:**
  * **Operational Disruption:** Temporary access restrictions required across core departments (Customer Service, Program Management, Health Information Systems) to prevent further data exfiltration.
  * **Compliance & Legal Risk:** Exposure of individually identifiable health records (**PHI**), triggering mandatory regulatory breach assessment under healthcare privacy standards (HIPAA) and international data protection frameworks (UK GDPR / EU GDPR Special Category Data).

## 2. Environment Setup & Access Control Baseline

To replicate and investigate the production environment safely:

1. Deployed a local instance of **MySQL Server 8.0** and **MySQL Workbench**.
2. Executed the schema initialization script (`sql/ClientDB-Create.sql`) to reconstruct the `clientdata` database structure.
3. Audited existing database permissions against the organization's security policy matrix (`evidence/SecurityRolesAndAccessNeeds.txt`), verifying role privileges via SQL:

```sql
SHOW GRANTS FOR 'da_role';
```

*Finding:* Confirmed over-permissive privileges (`SELECT, INSERT, UPDATE, DELETE`) assigned to non-essential short-term roles, increasing the lateral movement risk during a breach.

## 3. Forensic Investigation & PHI Exposure Analysis

By cross-referencing the **Security Dashboard** metrics with raw server authentication logs (`evidence/EventLog.txt`), the exact attack vector and timeline were established:

### Attack Timeline & Root Cause

* **10:01:00 – 10:06:00 AM:** External IP address `512.92.134.199` executed a systematic brute-force password guessing attack targeting the Fundraising and Development role (`fd_role`), testing sequential weak credentials (`pass123` through `pass128`).
* **10:07:00 AM (The Breach):** The threat actor successfully authenticated (`STATUS: SUCCESS`) into the `fd_role` account using the weak password `pass129`.
* **Dashboard Anomaly:** Login attempt telemetry confirmed an extreme spike (~850+ attempts) isolated to `fd_role` compared to the 30-day normal baseline (~200 attempts).

### Compromised Data Classification (PHI)

* **Affected Schema:** `Client data` (`clientdata.clients`).
* **Data Impacted:** Individually identifiable personal and medical claims information stored alongside health records, classified legally as **Protected Health Information (PHI)**.

## 4. Immediate Containment (Short-Term Fix)

To immediately sever the threat actor's session and eliminate the weak-credential vulnerability on the compromised account (`fd_role`), a strict password complexity policy (minimum 12 characters, uppercase, lowercase, numeric, and special symbols) was enforced via MySQL Workbench:

```sql
ALTER USER 'fd_role'@'%' IDENTIFIED BY 'kV2,F~EvD-um';
```

*(Note: Password rotated in a controlled lab environment to demonstrate compliance enforcement).*

## 5. Long-Term Remediation & Operational Recovery

Following containment and credential hardening, database access was systematically restored across authorized business units while aligning permissions with the **Principle of Least Privilege (PoLP)**:

1. Restored operational database privileges for the Data Analysis & Reporting tools (`da_role`):

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON Clientdata.Clients TO 'da_role'@'%';
```

2. Executed controlled privilege restoration across remaining restricted departmental roles (`oe_role`, `fs_role`, `finance_role`, `hr_role`, `hpr_role`, and the hardened `fd_role`) to resume normal organizational workflows without exposing unrestricted administrative privileges.

## 6. Governance, Risk & Compliance (GRC) Takeaways

* **Identity & Access Management (IAM):** Enforcing strong password policies and automated account lockout thresholds (preventing brute-force attempts after 3–5 failed logins) would have neutralized this attack vector prior to compromise.
* **Regulatory Alignment (UK GDPR & Cyber Essentials):** In a UK/European enterprise context, unauthorized access to health records constitutes a breach of **Special Category Data (Article 9, UK/EU GDPR)**, requiring containment and notification to the Information Commissioner's Office (ICO) within 72 hours, alongside strict enforcement of **UK Cyber Essentials** Access Control standards.

## Repository Structure & Evidence

```text
healthcare-breach-incident-response/
├── README.md
├── sql/
│   └── ClientDB-Create.sql
└── evidence/
    ├── IDS_Breach_Alert.png
    ├── SecurityDashboard_Logins.png
    ├── EventLog.txt
    └── SecurityRolesAndAccessNeeds.txt
```

* `sql/ClientDB-Create.sql` — Database initialization script used to deploy the `clientdata` schema for investigation.
* `evidence/IDS_Breach_Alert.png` — Initial high-severity alert from the MySQL event log.
* `evidence/SecurityDashboard_Logins.png` — Telemetry chart highlighting the `fd_role` brute-force anomaly and compromised `clientdata` table.
* `evidence/EventLog.txt` — Raw chronological authentication logs tracing the attack to IP `512.92.134.199`.
* `evidence/SecurityRolesAndAccessNeeds.txt` — Organizational role-based access control (RBAC) baseline matrix.