Tactics: [[EXFILTRATION]]
Tags: #mitre/attack/techniques/T1011  

# Exfiltration Over Other Network Medium - T1011
---
## Description
[more on T1011](https://attack.mitre.org/techniques/T1011)

Adversaries may attempt to exfiltrate data over a different network medium than the command and control channel. If the command and control network is a wired Internet connection, the [[exfiltration]] may occur, for example, over a WiFi connection, modem, cellular data connection, Bluetooth, or another radio frequency (RF) channel.

Adversaries may choose to do this if they have sufficient access or proximity, and the connection might not be secured or defended as well as the primary Internet-connected channel because it is not routed through the same enterprise network

---
## Sub-Techniques

#### Exfiltration Over Bluetooth - T1011.001
[more on T1011.001](https://attack.mitre.org/techniques/T1011/001)

Adversaries may attempt to exfiltrate data over Bluetooth rather than the command and control channel. If the command and control network is a wired Internet connection, an attacker may opt to exfiltrate data using a Bluetooth communication channel.

Adversaries may choose to do this if they have sufficient access and proximity. Bluetooth connections might not be secured or defended as well as the primary Internet-connected channel because it is not routed through the same enterprise network.

