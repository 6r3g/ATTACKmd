Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1602  

# Data from Configuration Repository - T1602
---
## Description
[more on T1602](https://attack.mitre.org/techniques/T1602)

Adversaries may collect data related to managed devices from configuration repositories. Configuration repositories are used by management systems in order to configure, manage, and control data on remote systems. Configuration repositories may also facilitate remote access and administration of devices.

Adversaries may target these repositories in order to collect large quantities of sensitive system administration data. Data from configuration repositories may be exposed by various protocols and software and can store a wide variety of data, much of which may align with adversary Discovery objectives.[1](https://www.us-cert.gov/ncas/alerts/TA18-106A)[2](https://us-cert.cisa.gov/ncas/alerts/TA17-156A)

---
## Sub-Techniques

#### SNMP (MIB Dump) - T1602.001
[more on T1602.001](https://attack.mitre.org/techniques/T1602/001)

Adversaries may target the Management Information Base (MIB) to collect and/or mine valuable information in a network managed using Simple Network Management Protocol (SNMP).

The MIB is a configuration repository that stores variable information accessible via SNMP in the form of object identifiers (OID). Each OID identifies a variable that can be read or set and permits active management tasks, such as configuration changes, through remote modification of these variables. SNMP can give administrators great insight in their systems, such as, system information, description of hardware, physical location, and software packages[1](https://www.sans.org/reading-room/whitepapers/networkdevs/securing-snmp-net-snmp-snmpv3-1051). The MIB may also contain device operational information, including running configuration, routing table, and interface details.

Adversaries may use SNMP queries to collect MIB content directly from SNMP-managed devices in order to collect network information that allows the adversary to build network maps and facilitate future targeted exploitation.[2](https://www.us-cert.gov/ncas/alerts/TA18-106A)[3](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

#### Network Device Configuration Dump - T1602.002
[more on T1602.002](https://attack.mitre.org/techniques/T1602/002)

Adversaries may access network configuration files to collect sensitive data about the device and the network. The network configuration is a file containing parameters that determine the operation of the device. The device typically stores an in-memory copy of the configuration while operating, and a separate configuration on non-volatile storage to load after device reset. Adversaries can inspect the configuration files to reveal information about the target network and its layout, the network device and its software, or identifying legitimate accounts and credentials for later use.

Adversaries can use common management tools and protocols, such as Simple Network Management Protocol (SNMP) and Smart Install (SMI), to access network configuration files. [1](https://us-cert.cisa.gov/ncas/alerts/TA18-106A) [2](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954) These tools may be used to query specific data from a configuration repository or configure the device to export the configuration for later analysis.

