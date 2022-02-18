Tactics: [[EXFILTRATION]]
Tags: #mitre/attack/techniques/T1020  

# Automated Exfiltration - T1020
---
## Description
[more on T1020](https://attack.mitre.org/techniques/T1020)

Adversaries may exfiltrate data, such as sensitive documents, through the use of automated processing after being gathered during [[Collection]].

When automated [[exfiltration]] is used, other [[exfiltration]] techniques likely apply as well to transfer the information out of the network, such as [[T1041_Exfiltration Over C2 Channel|Exfiltration Over C2 Channel (T1041)]] and [[T1048_Exfiltration Over Alternative Protocol|Exfiltration Over Alternative Protocol (T1048)]].

---
## Sub-Techniques

#### Traffic Duplication - T1020.001
[more on T1020.001](https://attack.mitre.org/techniques/T1020/001)

Adversaries may leverage traffic mirroring in order to automate data [[exfiltration]] over compromised network infrastructure. Traffic mirroring is a native feature for some network devices and used for network analysis and may be configured to duplicate traffic and forward to one or more destinations for analysis by a network analyzer or other monitoring device. [1](https://www.cisco.com/c/en/us/td/docs/routers/crs/software/crs_r5-1/interfaces/configuration/guide/hc51xcrsbook/hc51span.html) [2](https://www.juniper.net/documentation/en_US/junos/topics/concept/port-mirroring-ex-series.html)

Adversaries may abuse traffic mirroring to mirror or redirect network traffic through other network infrastructure they control. Malicious modifications to network devices to enable traffic redirection may be possible through [[T1542_Pre-OS Boot#ROMMONkit - T1542 004|ROMMONkit (T1542.004)]] or [[T1601_Modify System Image#Patch System Image - T1601 001|Patch System Image (T1601.001)]].[3](https://www.us-cert.gov/ncas/alerts/TA18-106A)[4](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954) Adversaries may use traffic duplication in conjunction with [[T1040_Network Sniffing|Network Sniffing (T1040)]], [[T1056_Input Capture|Input Capture (T1056)]], or [[T1557_Adversary-in-the-Middle|Adversary-in-the-Middle (T1557)]] depending on the goals and objectives of the adversary.

