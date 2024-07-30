Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1651  

# Cloud Administration Command - T1651
---

## Description
[more on T1651](https://attack.mitre.org/techniques/T1651)

Adversaries may abuse cloud management services to execute commands within virtual machines. Resources such as AWS Systems Manager, Azure RunCommand, and Runbooks allow users to remotely run scripts in virtual machines by leveraging installed virtual machine agents. [1](https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html) [2](https://learn.microsoft.com/en-us/azure/virtual-machines/run-command-overview)

If an adversary gains administrative access to a cloud environment, they may be able to abuse cloud management services to execute commands in the environment’s virtual machines. Additionally, an adversary that compromises a service provider or delegated administrator account may similarly be able to leverage a [[T1199_Trusted Relationship|Trusted Relationship]] to execute commands in connected virtual machines. [3](https://www.microsoft.com/security/blog/2021/10/25/nobelium-targeting-delegated-administrative-privileges-to-facilitate-broader-attacks/)
