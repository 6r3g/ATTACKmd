Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1057  

# Process Discovery - T1057
---
## Description
[more on T1057](https://attack.mitre.org/techniques/T1057)

Adversaries may attempt to get information about running processes on a system. Information obtained could be used to gain an understanding of common software/applications running on systems within the network. Adversaries may use the information from [[T1057_Process Discovery|Process Discovery (T1057)]] during automated discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

In Windows environments, adversaries could obtain details on running processes using the [Tasklist](https://attack.mitre.org/software/S0057) utility via [cmd](https://attack.mitre.org/software/S0106) or `Get-Process` via [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]]. Information about processes can also be extracted from the output of [[T1106_Native API|Native API (T1106)]] calls such as `CreateToolhelp32Snapshot`. In Mac and Linux, this is accomplished with the `ps` command. Adversaries may also opt to enumerate processes via /proc.

---
## Sub-Techniques

#### none
