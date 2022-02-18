Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1490  

# Inhibit System Recovery - T1490
---
## Description
[more on T1490](https://attack.mitre.org/techniques/T1490)

Adversaries may delete or remove built-in operating system data and turn off services designed to aid in the recovery of a corrupted system to prevent recovery.[1](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html)[2](https://www.fireeye.com/blog/threat-research/2017/05/wannacry-malware-profile.html) Operating systems may contain features that can help fix corrupted systems, such as a backup catalog, volume shadow copies, and automatic repair features. Adversaries may disable or delete system recovery features to augment the effects of [[T1485_Data Destruction|Data Destruction (T1485)]] and [[T1486_Data Encrypted for Impact|Data Encrypted for Impact (T1486)]].[1](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html)[2](https://www.fireeye.com/blog/threat-research/2017/05/wannacry-malware-profile.html)

A number of native Windows utilities have been used by adversaries to disable or delete system recovery features:

-   `vssadmin.exe` can be used to delete all volume shadow copies on a system - `vssadmin.exe delete shadows /all /quiet`
-   [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]] can be used to delete volume shadow copies - `wmic shadowcopy delete`
-   `wbadmin.exe` can be used to delete the Windows Backup Catalog - `wbadmin.exe delete catalog -quiet`
-   `bcdedit.exe` can be used to disable automatic Windows recovery features by modifying boot configuration data - `bcdedit.exe /set {{default}} bootstatuspolicy ignoreallfailures & bcdedit /set {{default}} recoveryenabled no`

---
## Sub-Techniques

#### none
