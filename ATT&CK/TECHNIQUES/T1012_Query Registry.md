Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1012  

# Query Registry - T1012
---
## Description
[more on T1012](https://attack.mitre.org/techniques/T1012)

Adversaries may interact with the Windows Registry to gather information about the system, configuration, and installed software.

The Registry contains a significant amount of information about the operating system, configuration, software, and security.[1](https://en.wikipedia.org/wiki/Windows_Registry) Information can easily be queried using the [Reg](https://attack.mitre.org/software/S0075) utility, though other means to access the Registry exist. Some of the information may help adversaries to further their operation within a network. Adversaries may use the information from [[T1012_Query Registry|Query Registry (T1012)]] during automated [[discovery]] to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

---
## Sub-Techniques

#### none
