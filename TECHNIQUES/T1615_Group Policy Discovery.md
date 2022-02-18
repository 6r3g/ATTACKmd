Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1615  

# Group Policy Discovery - T1615
---
## Description
[more on T1615](https://attack.mitre.org/techniques/T1615)

Adversaries may gather information on Group Policy settings to identify paths for privilege escalation, security measures applied within a domain, and to discover patterns in domain objects that can be manipulated or used to blend in the environment. Group Policy allows for centralized management of user and computer settings in Active Directory (AD). Group policy objects (GPOs) are containers for group policy settings made up of files stored within a predicable network path `\\SYSVOL\\Policies\`.[1](https://blogs.technet.microsoft.com/musings_of_a_technical_tam/2012/02/13/group-policy-basics-part-1-understanding-the-structure-of-a-group-policy-object/)[2](https://adsecurity.org/?p=2716)

Adversaries may use commands such as `gpresult` or various publicly available PowerShell functions, such as `Get-DomainGPO` and `Get-DomainGPOLocalGroup`, to gather information on Group Policy settings.[3](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/gpresult)[4](https://github.com/EmpireProject/Empire) Adversaries may use this information to shape follow-on behaviors, including determining potential attack paths within the target network as well as opportunities to manipulate Group Policy settings (i.e. [[T1484_Domain Policy Modification|Domain Policy Modification (T1484)]]) for their benefit.

---
## Sub-Techniques

#### none
