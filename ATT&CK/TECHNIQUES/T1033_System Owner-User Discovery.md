Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1033  

# System Owner/User Discovery - T1033
---
## Description
[more on T1033](https://attack.mitre.org/techniques/T1033)

Adversaries may attempt to identify the primary user, currently logged in user, set of users that commonly uses a system, or whether a user is actively using the system. They may do this, for example, by retrieving account usernames or by using [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]]. The information may be collected in a number of different ways using other [[Discovery]] techniques, because user and username details are prevalent throughout a system and include running process ownership, file/directory ownership, session information, and system logs. Adversaries may use the information from [[T1033_System Owner-User Discovery|System Owner/User Discovery (T1033)]] during automated [[discovery]] to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

Various utilities and commands may acquire this information, including `whoami`. In macOS and Linux, the currently logged in user can be identified with `w` and `who`. On macOS the `dscl . list /Users | grep -v '_'` command can also be used to enumerate user accounts. Environment variables, such as `%USERNAME%` and `$USER`, may also be used to access this information.

---
## Sub-Techniques

#### none
