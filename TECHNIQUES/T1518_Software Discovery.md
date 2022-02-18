Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1518  

# Software Discovery - T1518
---
## Description
[more on T1518](https://attack.mitre.org/techniques/T1518)

Adversaries may attempt to get a listing of software and software versions that are installed on a system or in a cloud environment. Adversaries may use the information from [[T1518_Software Discovery|Software Discovery (T1518)]] during automated discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

Adversaries may attempt to enumerate software for a variety of reasons, such as figuring out what security measures are present or if the compromised system has a version of software that is vulnerable to [[T1068_Exploitation for Privilege Escalation|Exploitation for Privilege Escalation (T1068)]].

---
## Sub-Techniques

#### Security Software Discovery - T1518.001
[more on T1518.001](https://attack.mitre.org/techniques/T1518/001)

Adversaries may attempt to get a listing of security software, configurations, defensive tools, and sensors that are installed on a system or in a cloud environment. This may include things such as firewall rules and anti-virus. Adversaries may use the information from [[T1518_Software Discovery#Security Software Discovery - T1518 001|Security Software Discovery (T1518.001)]] during automated discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

Example commands that can be used to obtain security software information are [netsh](https://attack.mitre.org/software/S0108), `reg query` with [Reg](https://attack.mitre.org/software/S0075), `dir` with [cmd](https://attack.mitre.org/software/S0106), and [Tasklist](https://attack.mitre.org/software/S0057), but other indicators of discovery behavior may be more specific to the type of software or security system the adversary is looking for. It is becoming more common to see macOS malware perform checks for LittleSnitch and KnockKnock software.

Adversaries may also utilize cloud APIs to discover the configurations of firewall rules within an environment.[1](https://expel.io/blog/finding-evil-in-aws/)



