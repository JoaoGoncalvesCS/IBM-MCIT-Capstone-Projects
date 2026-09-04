# IBMSkillsBuild-SOHO-Network-Capstone
This capstone project was completed as part of the practical networking component of the IBM IT Support Technician Certificate Programs, specifically the Network Protocol and Configuration microcredential.

# Design and Configure a SOHO Network

A practical networking capstone project completed using **Cisco Packet Tracer** as part of the **IBM IT Support Technician Certificate Programs**, within the **Network Protocol and Configuration** microcredential.

The project simulates the design and configuration of a **Small Office/Home Office (SOHO) network**, including wired and wireless clients, a local Network Attached Storage (NAS) server, a simulated Internet connection, DHCP, wireless security, and host-based firewall rules.

---

## Project Overview

This project involved designing and configuring a simulated SOHO network based on a set of predefined business requirements.

The network was implemented in **Cisco Packet Tracer** and included:

* A simulated Internet connection
* A simulated Internet Service Provider (ISP)
* A cable modem
* A wireless router
* A network hub
* Wired laptops and desktop computers
* A wireless laptop
* A NAS server
* A simulated external web server
* DHCP configuration
* Wireless WPA2-PSK security
* Host firewall configuration
* HTTP/HTTPS traffic rules
* ICMP connectivity
* Static and dynamic IPv4 addressing

The objective was to create a functional small-business network capable of providing local connectivity and access to a simulated Internet service while protecting end-user devices and the NAS server through firewall rules.

---

## Credential Context

**Program:** IBM IT Support Technician Certificate Programs
**Microcredential:** Network Protocol and Configuration
**Project:** Capstone — Design and Configure a SOHO Network
**Platform:** Cisco Packet Tracer

---

## Project Objectives

The project was designed to demonstrate practical understanding of fundamental networking concepts, including:

* Network topology design
* LAN connectivity
* WAN/Internet simulation
* Ethernet and coaxial connections
* Wired and wireless networking
* IPv4 addressing
* DHCP
* Static IP configuration
* Wireless SSID configuration
* WPA2-PSK authentication
* Firewall configuration
* TCP and UDP traffic
* ICMP
* HTTP and HTTPS
* Network Attached Storage
* Basic network connectivity testing

---

# Network Architecture

The simulated network follows this general topology:

```text
                    Simulated Internet
                           |
                      Web Server
                           |
                        Cloud0
                           |
                      Cable Modem
                           |
                    Wireless Router
                    /             \
                   /               \
                Hub0               NAS
              /  |  \
             /   |   \
        Laptop 1 Laptop 2 PC 1

                     )))
                  Laptop 0
                 Wireless Client
```

### Network Flow

External connectivity is simulated through the following path:

```text
Web Server
    ↓
Cloud0
    ↓
Cable Modem
    ↓
Wireless Router
    ↓
Local Network
```

The wireless router provides connectivity to the local wired network through the hub and directly connects to the NAS.

The wireless laptop connects directly to the wireless router using the configured SSID and WPA2-PSK credentials.

---

# Devices Used

| Device          | Role                                               |
| --------------- | -------------------------------------------------- |
| Web Server      | Simulated Internet web server                      |
| Cloud0          | Simulated ISP / Internet connection                |
| Cable Modem     | WAN/Internet access device                         |
| Wireless Router | LAN gateway and wireless access point              |
| Hub0            | Wired LAN connectivity                             |
| Laptop 0        | Wireless client                                    |
| Laptop 1        | Wired client                                       |
| Laptop 2        | Wired client                                       |
| PC 1            | Wired desktop client                               |
| NAS             | Network Attached Storage and web management server |

---

# IP Addressing

## Simulated Internet

The external web server was configured with a static IPv4 address:

```text
IPv4 Address: 23.1.2.2
```

The use of a specific IP address allows the local network devices to test access to the simulated external web server without relying on a DNS name.

---

## Local Network

The NAS was configured with a static IPv4 address:

```text
IPv4 Address: 192.168.0.3
```

The end-user devices were configured to obtain their IPv4 configuration dynamically through DHCP.

This approach allows client devices to receive network configuration automatically while keeping the NAS on a known static address.

---

# Internet Simulation

Because Cisco Packet Tracer operates in a simulated environment, the network cannot connect to the real Internet.

Instead, the project uses two components to simulate Internet connectivity:

### Web Server

A Packet Tracer server was configured to represent an external web server.

```text
Name: Web Server
IPv4: 23.1.2.2
```

### Cloud0

A Packet Tracer PT-Cloud was configured to simulate the ISP and provide the connection between the simulated external network and the local network.

The cloud was configured to use a cable interface and connected to the cable modem through a coaxial connection.

---

# WAN Connectivity

The simulated Internet connection was built using the following sequence:

```text
Web Server
    ↓
Ethernet
    ↓
Cloud0
    ↓
Coaxial
    ↓
Cable Modem
    ↓
Ethernet
    ↓
Wireless Router
```

The cable modem represents the device that connects the local network to the simulated Internet service.

The modem's power state was also verified before continuing with the network configuration.

---

# Local Network Connectivity

The local wired network was implemented using a hub connected to the wireless router.

The wired topology is:

```text
Wireless Router
       |
      Hub0
    /  |  \
   /   |   \
Laptop1 Laptop2 PC1
```

The wired client devices use Ethernet connections to communicate with the LAN.

The NAS is connected directly to the wireless router rather than through the hub.

---

# Wireless Network

The network includes a wireless laptop configured to connect to the wireless router.

### Wireless Configuration

```text
SSID: SOHO 2.4G
Authentication: WPA2-PSK
```

The wireless laptop was configured to obtain its IP address through DHCP.

Unlike the wired clients, the wireless laptop does not require a physical network cable because it connects to the wireless router over Wi-Fi.

---

# DHCP Configuration

The client devices were configured to obtain their IP configuration dynamically.

The following devices use DHCP:

* Laptop 0
* Laptop 1
* Laptop 2
* PC 1

This allows the devices to automatically obtain an IPv4 address from the network's DHCP service.

The NAS was configured with a static IP address instead because it provides a network service that should remain reachable at a predictable address.

---

# NAS Configuration

A Packet Tracer server was configured to represent the network's NAS device.

```text
Device Name: NAS
IPv4 Address: 192.168.0.3
Addressing: Static
```

The NAS includes an active web server in the Packet Tracer environment.

This allows users on the LAN to access the NAS through a web browser for simulated management and file-access functionality.

The NAS is connected directly to the wireless router.

---

# Firewall Configuration

Firewall rules were configured for the end-user devices and the NAS.

The objective was to control network traffic while allowing the services required by the project.

---

## End-User Firewall Rules

The firewall was enabled on:

* Laptop 0
* Laptop 1
* Laptop 2
* PC 1

The configured rules allow:

### HTTP

```text
Protocol: TCP
Port: 80
Action: Allow
```

This allows HTTP traffic.

### HTTPS

```text
Protocol: TCP
Port: 443
Action: Allow
```

This allows HTTPS traffic.

### DHCP

```text
Protocol: UDP
Remote Port: 67
Local Port: 68
Action: Allow
```

This allows DHCP clients to communicate with the DHCP server and obtain their network configuration.

### ICMP

```text
Protocol: ICMP
Action: Allow
```

This permits ICMP traffic, allowing devices on the LAN to use the `ping` command for connectivity testing.

### IP Traffic

```text
Protocol: IP
Action: Allow
```

This permits IP traffic required for Internet communication.

---

# NAS Firewall Rules

The NAS firewall was also enabled.

The NAS firewall permits the following traffic:

### HTTP

```text
Protocol: TCP
Port: 80
Action: Allow
```

### HTTPS

```text
Protocol: TCP
Port: 443
Action: Allow
```

### IP Traffic

```text
Protocol: IP
Action: Allow
```

These rules allow users to access the NAS web interface while controlling the traffic permitted to the server.

---

# Network Connections

The following connection types were used by Cisco Packet Tracer:

| Connection              | Purpose                                                           |
| ----------------------- | ----------------------------------------------------------------- |
| Copper Straight-Through | Ethernet connections                                              |
| Copper Cross-Over       | Connections between network devices as specified by Packet Tracer |
| Coaxial                 | Cloud-to-cable-modem connection                                   |
| Wireless                | Laptop 0 to wireless router                                       |

The project used Packet Tracer's **Automatically Choose Connection Type** option where specified by the lab instructions.

---

# Configuration Summary

The resulting network contains:

```text
Internet Simulation
├── Web Server
│   └── 23.1.2.2
│
└── Cloud0
    │
    └── Cable Modem
        │
        └── Wireless Router
            ├── Hub0
            │   ├── Laptop 1
            │   ├── Laptop 2
            │   └── PC 1
            │
            ├── NAS
            │   └── 192.168.0.3
            │
            └── Wireless
                └── Laptop 0
```

---

# Network Security

Basic network security controls were implemented through:

* WPA2-PSK wireless authentication
* Host-based firewall configuration
* Controlled HTTP traffic
* Controlled HTTPS traffic
* Controlled DHCP traffic
* Controlled ICMP traffic
* Static addressing for the NAS
* Separate consideration of client and server firewall requirements

The project demonstrates the principle of allowing required network traffic while restricting traffic according to the requirements of each device.

---

# Testing and Validation

The project was designed to allow connectivity to be tested at multiple points in the topology.

Relevant validation activities include:

### Local Connectivity

Testing connectivity between LAN devices using ICMP/ping.

```text
ping <destination-ip>
```

### External Connectivity

Testing whether local devices can reach the simulated external web server:

```text
23.1.2.2
```

### NAS Connectivity

Testing access to the NAS using its static address:

```text
192.168.0.3
```

### DHCP Validation

Verifying that client devices receive IP configuration dynamically.

### Wireless Validation

Verifying that Laptop 0 associates with:

```text
SOHO 2.4G
```

using WPA2-PSK authentication.

---

# Troubleshooting Considerations

The topology provides several potential points of failure that can be isolated systematically.

For example:

```text
Client
  ↓
Wi-Fi / Ethernet
  ↓
Hub / Wireless Router
  ↓
Cable Modem
  ↓
Cloud0
  ↓
Web Server
```

When connectivity fails, troubleshooting can proceed from the endpoint toward the destination.

Potential areas of investigation include:

* Physical connectivity
* Device power state
* Wireless association
* SSID configuration
* WPA2-PSK configuration
* DHCP address assignment
* IPv4 configuration
* Default gateway
* Firewall rules
* ICMP connectivity
* Router-to-modem connectivity
* Cloud configuration
* External server configuration

This layered approach helps isolate whether a problem originates at the endpoint, LAN, gateway, WAN connection, or destination.

---

# Skills Demonstrated

This project demonstrates practical exposure to:

### Networking

* LAN design
* WAN concepts
* SOHO network architecture
* IPv4 addressing
* DHCP
* Wired networking
* Wireless networking
* Ethernet
* Coaxial connectivity
* Basic network troubleshooting

### Network Services

* DHCP
* HTTP
* HTTPS
* ICMP
* IP

### Security

* WPA2-PSK
* Host firewall configuration
* Traffic filtering
* Basic network security principles

### Infrastructure

* Router
* Hub
* Cable modem
* Network Attached Storage
* Web server
* ISP/Internet simulation

### Tools

* Cisco Packet Tracer

---

# Project Outcome

The completed simulation provides a functional SOHO network consisting of wired and wireless clients, a NAS server, a simulated Internet connection, and basic network security controls.

The project demonstrates how network requirements can be translated into a physical/logical topology and then configured into a working simulated environment.

It also provides practical experience with fundamental network protocols, addressing, connectivity, firewall rules, and structured troubleshooting.

---

# Repository Contents

Recommended repository structure:

```text
soho-network-capstone/
│
├── README.md
│
├── packet-tracer/
│   └── SOHO-Network-Simulation.pkt
│
├── documentation/
│   └── network-configuration.md
│
└── screenshots/
    ├── topology.png
    ├── wireless-configuration.png
    ├── firewall-configuration.png
    ├── ip-configuration.png
    └── connectivity-tests.png
```

> **Note:** The exact filenames above are recommendations for organizing the GitHub repository. They should be changed to match the actual files included in the repository.

---

# Technology Stack

```text
Cisco Packet Tracer
IPv4
DHCP
Ethernet
Coaxial
Wi-Fi
WPA2-PSK
TCP
UDP
ICMP
HTTP
HTTPS
IP
Firewall
NAS
```

---

# Learning Context

This capstone project was completed as part of the practical networking component of the **IBM IT Support Technician Certificate Programs**, specifically the **Network Protocol and Configuration** microcredential.

The project provided hands-on practice translating network requirements into a functioning simulated SOHO environment and configuring the components necessary for wired, wireless, local, and simulated Internet connectivity.

---

## Disclaimer

This repository documents a **simulated networking environment created in Cisco Packet Tracer**.

The Internet connection, ISP, and external web server are simulated within Packet Tracer and do not represent a connection to the live Internet.

The project demonstrates practical networking concepts in a controlled laboratory environment and should not be interpreted as production Enterprise network experience.
