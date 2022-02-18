Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1016  

# System Network Configuration Discovery - T1016
---
## Description
[more on T1016](https://attack.mitre.org/techniques/T1016)

Adversaries may look for details about the network configuration and settings, such as IP and/or MAC addresses, of systems they access or through information [[discovery]] of remote systems. Several operating system administration utilities exist that can be used to gather this information. Examples include [Arp](https://attack.mitre.org/software/S0099), [ipconfig](https://attack.mitre.org/software/S0100)/[ifconfig](https://attack.mitre.org/software/S0101), [nbtstat](https://attack.mitre.org/software/S0102), and [route](https://attack.mitre.org/software/S0103).

Adversaries may use the information from [[T1016_System Network Configuration Discovery|System Network Configuration Discovery (T1016)]] during automated [[discovery]] to shape follow-on behaviors, including determining certain access within the target network and what actions to do next.

---
## Sub-Techniques

#### Internet Connection Discovery - T1016.001
[more on T1016.001](https://attack.mitre.org/techniques/T1016/001)

Adversaries may check for Internet connectivity on compromised systems. This may be performed during automated [[discovery]] and can be accomplished in numerous ways such as using [Ping](https://attack.mitre.org/software/S0097), `tracert`, and GET requests to websites.

Adversaries may use the results and responses from these requests to determine if the system is capable of communicating with their C2 servers before attempting to connect to them. The results may also be used to identify routes, redirectors, and proxy servers.

