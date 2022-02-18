Tactics: [[EXFILTRATION]]
Tags: #mitre/attack/techniques/T1537  

# Transfer Data to Cloud Account - T1537
---
## Description
[more on T1537](https://attack.mitre.org/techniques/T1537)

Adversaries may exfiltrate data by transferring the data, including backups of cloud environments, to another cloud account they control on the same service to avoid typical file transfers/downloads and network-based exfiltration detection.

A defender who is monitoring for large transfers to outside the cloud environment through normal file transfers or over command and control channels may not be watching for data transfers to another account within the same cloud provider. Such transfers may utilize existing cloud provider APIs and the internal address space of the cloud provider to blend into normal traffic or avoid data transfers over external network interfaces.

Incidents have been observed where adversaries have created backups of cloud instances and transferred them to separate accounts.[1](https://www.justice.gov/file/1080281/download)

---
## Sub-Techniques

#### none
