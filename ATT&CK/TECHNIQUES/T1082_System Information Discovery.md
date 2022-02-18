Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1082  

# System Information Discovery - T1082
---
## Description
[more on T1082](https://attack.mitre.org/techniques/T1082)

An adversary may attempt to get detailed information about the operating system and hardware, including version, patches, hotfixes, service packs, and architecture. Adversaries may use the information from [[T1082_System Information Discovery|System Information Discovery (T1082)]] during automated discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

Tools such as [Systeminfo](https://attack.mitre.org/software/S0096) can be used to gather detailed system information. If running with privileged access, a breakdown of system data can be gathered through the `systemsetup` configuration tool on macOS. As an example, adversaries with user-level access can execute the `df -aH` command to obtain currently mounted disks and associated freely available space. [[T1082_System Information Discovery|System Information Discovery (T1082)]] combined with information gathered from other forms of discovery and reconnaissance can drive payload development and concealment.[1](https://www.sentinelone.com/blog/trail-osx-fairytale-adware-playing-malware/)[2](https://labs.sentinelone.com/20-common-tools-techniques-used-by-macos-threat-actors-malware/)

Infrastructure as a Service (IaaS) cloud providers such as AWS, GCP, and Azure allow access to instance and virtual machine information via APIs. Successful authenticated API calls can return data such as the operating system platform and status of a particular instance or the model view of a virtual machine.[3](https://docs.aws.amazon.com/cli/latest/reference/ssm/describe-instance-information.html)[4](https://cloud.google.com/compute/docs/reference/rest/v1/instances)[5](https://docs.microsoft.com/en-us/rest/api/compute/virtualmachines/get)

---
## Sub-Techniques

#### none
