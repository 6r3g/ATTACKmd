Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1049  

# System Network Connections Discovery - T1049
---
## Description
[more on T1049](https://attack.mitre.org/techniques/T1049)

Adversaries may attempt to get a listing of network connections to or from the compromised system they are currently accessing or from remote systems by querying for information over the network.

An adversary who gains access to a system that is part of a cloud-based environment may map out Virtual Private Clouds or Virtual Networks in order to determine what systems and services are connected. The actions performed are likely the same types of [[discovery]] techniques depending on the operating system, but the resulting information may include details about the networked cloud environment relevant to the adversary's goals. Cloud providers may have different ways in which their virtual networks operate.[1](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)[2](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)[3](https://cloud.google.com/vpc/docs/vpc)

Utilities and commands that acquire this information include [netstat](https://attack.mitre.org/software/S0104), "net use," and "net session" with [Net](https://attack.mitre.org/software/S0039). In Mac and Linux, [netstat](https://attack.mitre.org/software/S0104) and `lsof` can be used to list current connections. `who -a` and `w` can be used to show which users are currently logged in, similar to "net session".

---
## Sub-Techniques

#### none
