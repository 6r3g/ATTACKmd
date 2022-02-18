Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1006  

# Direct Volume Access - T1006
---
## Description
[more on T1006](https://attack.mitre.org/techniques/T1006)

Adversaries may directly access a volume to bypass file access controls and file system monitoring. Windows allows programs to have direct access to logical volumes. Programs with direct access may read and write files directly from the drive by analyzing file system data structures. This technique bypasses Windows file access controls as well as file system monitoring tools. [1](http://www.codeproject.com/Articles/32169/FDump-Dumping-File-Sectors-Directly-from-Disk-usin)

Utilities, such as NinjaCopy, exist to perform these actions in PowerShell. [2](https://github.com/PowerShellMafia/PowerSploit/blob/master/Exfiltration/Invoke-NinjaCopy.ps1)

---
## Sub-Techniques

#### none