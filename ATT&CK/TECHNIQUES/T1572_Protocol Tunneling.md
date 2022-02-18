Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1572  

# Protocol Tunneling - T1572
---
## Description
[more on T1572](https://attack.mitre.org/techniques/T1572)

Adversaries may tunnel network communications to and from a victim system within a separate protocol to avoid detection/network filtering and/or enable access to otherwise unreachable systems. Tunneling involves explicitly encapsulating a protocol within another. This behavior may conceal malicious traffic by blending in with existing traffic and/or provide an outer layer of encryption (similar to a VPN). Tunneling could also enable routing of network packets that would otherwise not reach their intended destination, such as SMB, RDP, or other traffic that would be filtered by network appliances or not routed over the Internet.

There are various means to encapsulate a protocol within another protocol. For example, adversaries may perform SSH tunneling (also known as SSH port forwarding), which involves forwarding arbitrary data over an encrypted SSH tunnel.[1](https://www.ssh.com/ssh/tunneling)

[[T1572_Protocol Tunneling|Protocol Tunneling (T1572)]] may also be abused by adversaries during [[T1568_Dynamic Resolution|Dynamic Resolution (T1568)]]. Known as DNS over HTTPS (DoH), queries to resolve C2 infrastructure may be encapsulated within encrypted HTTPS packets.[2](https://www.bleepingcomputer.com/news/security/new-godlua-malware-evades-traffic-monitoring-via-dns-over-https/)

Adversaries may also leverage [[T1572_Protocol Tunneling|Protocol Tunneling (T1572)]] in conjunction with [[T1090_Proxy|Proxy (T1090)]] and/or [[T1001_Data Obfuscation#Protocol Impersonation - T1001 003|Protocol Impersonation (T1001.003)]] to further conceal C2 communications and infrastructure.

---
## Sub-Techniques

#### none
