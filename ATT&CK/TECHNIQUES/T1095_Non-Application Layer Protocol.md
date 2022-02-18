Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1095  

# Non-Application Layer Protocol - T1095
---
## Description
[more on T1095](https://attack.mitre.org/techniques/T1095)

Adversaries may use a non-application layer protocol for communication between host and C2 server or among infected hosts within a network. The list of possible protocols is extensive.[1](http://en.wikipedia.org/wiki/List_of_network_protocols_%28OSI_model%29) Specific examples include use of network layer protocols, such as the Internet Control Message Protocol (ICMP), transport layer protocols, such as the User Datagram Protocol (UDP), session layer protocols, such as Socket Secure (SOCKS), as well as redirected/tunneled protocols, such as Serial over LAN (SOL).

ICMP communication between hosts is one example.[2](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices) Because ICMP is part of the Internet Protocol Suite, it is required to be implemented by all IP-compatible hosts; [3](http://support.microsoft.com/KB/170292) however, it is not as commonly monitored as other Internet Protocols such as TCP or UDP and may be used by adversaries to hide communications.

---
## Sub-Techniques

#### none
