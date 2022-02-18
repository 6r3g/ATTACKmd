Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1219  

# Remote Access Software - T1219
---
## Description
[more on T1219](https://attack.mitre.org/techniques/T1219)

An adversary may use legitimate desktop support and remote access software, such as Team Viewer, Go2Assist, LogMein, AmmyyAdmin, etc, to establish an interactive command and control channel to target systems within networks. These services are commonly used as legitimate technical support software, and may be allowed by application control within a target environment. Remote access tools like VNC, Ammyy, and Teamviewer are used frequently when compared with other legitimate software commonly used by adversaries. [1](https://www.symantec.com/content/dam/symantec/docs/security-center/white-papers/istr-living-off-the-land-and-fileless-attack-techniques-en.pdf)

Remote access tools may be established and used post-compromise as alternate communications channel for redundant access or as a way to establish an interactive remote desktop session with the target system. They may also be used as a component of malware to establish a reverse connection or back-connect to a service or adversary controlled system.

Admin tools such as TeamViewer have been used by several groups targeting institutions in countries of interest to the Russian state and criminal campaigns. [2](https://go.crowdstrike.com/rs/281-OBQ-266/images/15GlobalThreatReport.pdf) [3](https://blog.crysys.hu/2013/03/teamspy/)

---
## Sub-Techniques

#### none

