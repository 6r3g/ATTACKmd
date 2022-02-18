Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1535  

# Unused/Unsupported Cloud Regions
---
## Description
[more on T1535](https://attack.mitre.org/techniques/T1535)

Adversaries may create cloud instances in unused geographic service regions in order to evade detection. Access is usually obtained through compromising accounts used to manage cloud infrastructure.

Cloud service providers often provide infrastructure throughout the world in order to improve performance, provide redundancy, and allow customers to meet compliance requirements. Oftentimes, a customer will only use a subset of the available regions and may not actively monitor other regions. If an adversary creates resources in an unused region, they may be able to operate undetected.

A variation on this behavior takes advantage of differences in functionality across cloud regions. An adversary could utilize regions which do not support advanced detection services in order to avoid detection of their activity.

An example of adversary use of unused AWS regions is to mine cryptocurrency through [[T1496_Resource Hijacking|Resource Hijacking (T1496)]], which can cost organizations substantial amounts of money over time depending on the processing power used.[1](https://blog.cloudsploit.com/the-danger-of-unused-aws-regions-af0bf1b878fc)

---
## Sub-Techniques

#### none
