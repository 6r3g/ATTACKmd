Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1018  

# Remote System Discovery - T1018
---
## Description
[more on T1018](https://attack.mitre.org/techniques/T1018)

Adversaries may attempt to get a listing of other systems by IP address, hostname, or other logical identifier on a network that may be used for Lateral Movement from the current system. Functionality could exist within remote access tools to enable this, but utilities available on the operating system could also be used such as [Ping](https://attack.mitre.org/software/S0097) or `net view` using [Net](https://attack.mitre.org/software/S0039). Adversaries may also use local host files (ex: `C:\Windows\System32\Drivers\etc\hosts` or `/etc/hosts`) in order to discover the hostname to IP address mappings of remote systems.

---
## Sub-Techniques

#### none
