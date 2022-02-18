Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1135  

# Network Share Discovery - T1135
---
## Description
[more on T1135](https://attack.mitre.org/techniques/T1135)

Adversaries may look for folders and drives shared on remote systems as a means of identifying sources of information to gather as a precursor for Collection and to identify potential systems of interest for Lateral Movement. Networks often contain shared network drives and folders that enable users to access file directories on various systems across a network.

File sharing over a Windows network occurs over the SMB protocol. [1](https://en.wikipedia.org/wiki/Shared_resource) [2](https://technet.microsoft.com/library/cc770880.aspx) [Net](https://attack.mitre.org/software/S0039) can be used to query a remote system for available shared drives using the `net view \\remotesystem` command. It can also be used to query shared drives on the local system using `net share`. For macOS, the `sharing -l` command lists all shared points used for smb services.

---
## Sub-Techniques

#### none
