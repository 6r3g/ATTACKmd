Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1074  

# Data Staged - T1074
---
## Description
[more on T1074](https://attack.mitre.org/techniques/T1074)

Adversaries may stage collected data in a central location or directory prior to Exfiltration. Data may be kept in separate files or combined into one file through techniques such as [[T1560_Archive Collected Data|Archive Collected Data (T1560)]]. Interactive command shells may be used, and common functionality within [cmd](https://attack.mitre.org/software/S0106) and bash may be used to copy data into a staging location.[1](https://www.pwc.co.uk/cyber-security/pdf/cloud-hopper-report-final-v4.pdf)

In cloud environments, adversaries may stage data within a particular instance or virtual machine before exfiltration. An adversary may [[T1578_Modify Cloud Compute Infrastructure#Create Cloud Instance - T1578 002|Create Cloud Instance (T1578.002)]] and stage data in that instance.[2](https://content.fireeye.com/m-trends/rpt-m-trends-2020)

Adversaries may choose to stage data from a victim network in a centralized location prior to Exfiltration to minimize the number of connections made to their C2 server and better evade detection.

---
## Sub-Techniques

#### Local Data Staging - T1074.001
[more on T1074.001](https://attack.mitre.org/techniques/T1074/001)

Adversaries may stage collected data in a central location or directory on the local system prior to Exfiltration. Data may be kept in separate files or combined into one file through techniques such as [[T1560_Archive Collected Data|Archive Collected Data (T1560)]]. Interactive command shells may be used, and common functionality within [cmd](https://attack.mitre.org/software/S0106) and bash may be used to copy data into a staging location.

#### Remote Data Staging - T1074.002
[more on T1074.002](https://attack.mitre.org/techniques/T1074/002)

Adversaries may stage data collected from multiple systems in a central location or directory on one system prior to Exfiltration. Data may be kept in separate files or combined into one file through techniques such as [[T1560_Archive Collected Data|Archive Collected Data (T1560)]]. Interactive command shells may be used, and common functionality within [cmd](https://attack.mitre.org/software/S0106) and bash may be used to copy data into a staging location.

In cloud environments, adversaries may stage data within a particular instance or virtual machine before exfiltration. An adversary may [[T1578_Modify Cloud Compute Infrastructure#Create Cloud Instance - T1578 002|Create Cloud Instance (T1578.002)]] and stage data in that instance.[1](https://content.fireeye.com/m-trends/rpt-m-trends-2020)

By staging data on one system prior to Exfiltration, adversaries can minimize the number of connections made to their C2 server and better evade detection.
