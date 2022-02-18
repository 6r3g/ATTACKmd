Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1007  

# System Service Discovery - T1007
---
## Description
[more on T1007](https://attack.mitre.org/techniques/T1007)

Adversaries may try to get information about registered services. Commands that may obtain information about services using operating system utilities are "sc," "tasklist /svc" using [Tasklist](https://attack.mitre.org/software/S0057), and "net start" using [Net](https://attack.mitre.org/software/S0039), but adversaries may also use other tools as well. Adversaries may use the information from [[T1007_System Service Discovery|System Service Discovery (T1007)]] during automated [[discovery]] to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

---
## Sub-Techniques

#### none
