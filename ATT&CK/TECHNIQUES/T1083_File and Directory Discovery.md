Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1083  

# File and Directory Discovery - T1083
---
## Description
[more on T1083](https://attack.mitre.org/techniques/T1083)

Adversaries may enumerate files and directories or may search in specific locations of a host or network share for certain information within a file system. Adversaries may use the information from [[T1083_File and Directory Discovery|File and Directory Discovery (T1083)]] during automated discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

Many command shell utilities can be used to obtain this information. Examples include `dir`, `tree`, `ls`, `find`, and `locate`.[1](https://blogs.jpcert.or.jp/en/2016/01/windows-commands-abused-by-attackers.html) Custom tools may also be used to gather file and directory information and interact with the [[T1106_Native API|Native API (T1106)]].

---
## Sub-Techniques

#### none
