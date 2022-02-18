Tactics: [[CREDENTIAL_ACCESS]] - [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1040  

# Network Sniffing - T1040
---
## Description
[more on T1040](https://attack.mitre.org/techniques/T1040)

Adversaries may sniff network traffic to capture information about an environment, including authentication material passed over the network. Network sniffing refers to using the network interface on a system to monitor or capture information sent over a wired or wireless connection. An adversary may place a network interface into promiscuous mode to passively access data in transit over the network, or use span ports to capture a larger amount of data.

Data captured via this technique may include user credentials, especially those sent over an insecure, unencrypted protocol. Techniques for name service resolution poisoning, such as [[T1557_Adversary-in-the-Middle#LLMNR/NBT-NS Poisoning and SMB Relay - T1557 001|LLMNR/NBT-NS Poisoning and SMB Relay (T1557.001)]], can also be used to capture credentials to websites, proxies, and internal systems by redirecting traffic to an adversary.

Network sniffing may also reveal configuration details, such as running services, version numbers, and other network characteristics (e.g. IP addresses, hostnames, VLAN IDs) necessary for subsequent Lateral Movement and/or Defense Evasion activities.

---
## Sub-Techniques

#### none
