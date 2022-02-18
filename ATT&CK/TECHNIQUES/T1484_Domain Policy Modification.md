Tactics: [[PRIVILEGE_ESCALATION]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1484  

# Domain Policy Modification - T1484
---
## Description
[more on T1484](https://attack.mitre.org/techniques/T1484)

Adversaries may modify the configuration settings of a domain to evade defenses and/or escalate privileges in domain environments. Domains provide a centralized means of managing how computer resources (ex: computers, user accounts) can act, and interact with each other, on a network. The policy of the domain also includes configuration settings that may apply between domains in a multi-domain/forest environment. Modifications to domain settings may include altering domain Group Policy Objects (GPOs) or changing trust settings for domains, including federation trusts.

With sufficient permissions, adversaries can modify domain policy settings. Since domain configuration settings control many of the interactions within the Active Directory (AD) environment, there are a great number of potential attacks that can stem from this abuse. Examples of such abuse include modifying GPOs to push a malicious [[T1053_Scheduled Task-Job#Scheduled Task - T1053 005|Scheduled Task (T1053.005)]] to computers throughout the domain environment[1](https://adsecurity.org/?p=2716)[2](https://wald0.com/?p=179)[3](http://www.harmj0y.net/blog/redteaming/abusing-gpo-permissions/) or modifying domain trusts to include an adversary controlled domain where they can control access tokens that will subsequently be accepted by victim domain resources.[4](https://msrc-blog.microsoft.com/2020/12/13/customer-guidance-on-recent-nation-state-cyber-attacks/) Adversaries can also change configuration settings within the AD environment to implement a [[T1207_Rogue Domain Controller|Rogue Domain Controller (T1207)]].

Adversaries may temporarily modify domain policy, carry out a malicious action(s), and then revert the change to remove suspicious indicators.

---
## Sub-Techniques

#### Group Policy Modification - T1484.001
[more on T1484.001](https://attack.mitre.org/techniques/T1484/001)

Adversaries may modify Group Policy Objects (GPOs) to subvert the intended discretionary access controls for a domain, usually with the intention of escalating privileges on the domain. Group policy allows for centralized management of user and computer settings in Active Directory (AD). GPOs are containers for group policy settings made up of files stored within a predicable network path `\<DOMAIN>\SYSVOL\<DOMAIN>\Policies\`.[1](https://blogs.technet.microsoft.com/musings_of_a_technical_tam/2012/02/13/group-policy-basics-part-1-understanding-the-structure-of-a-group-policy-object/)[2](https://adsecurity.org/?p=2716)

Like other objects in AD, GPOs have access controls associated with them. By default all user accounts in the domain have permission to read GPOs. It is possible to delegate GPO access control permissions, e.g. write access, to specific users or groups in the domain.

Malicious GPO modifications can be used to implement many other malicious behaviors such as [[T1053_Scheduled Task-Job|Scheduled Task/Job (T1053)]], [[T1562_Impair Defenses#Disable or Modify Tools - T1562 001|Disable or Modify Tools (T1562.001)]], [[T1105_Ingress Tool Transfer|Ingress Tool Transfer (T1105)]], [[T1136_Create Account|Create Account (T1136)]], [[T1569_System Services#Service Execution - T1569 002|Service Execution (T1569.002)]], and more.[2](https://adsecurity.org/?p=2716)[3](https://wald0.com/?p=179)[4](http://www.harmj0y.net/blog/redteaming/abusing-gpo-permissions/)[5](https://www.fireeye.com/content/dam/fireeye-www/current-threats/pdfs/rpt-mtrends-2016.pdf)[6](https://www.microsoft.com/security/blog/2016/06/01/hacking-team-breach-a-cyber-jurassic-park/) Since GPOs can control so many user and machine settings in the AD environment, there are a great number of potential attacks that can stem from this GPO abuse.[3](https://wald0.com/?p=179)

For example, publicly available scripts such as `New-GPOImmediateTask` can be leveraged to automate the creation of a malicious [[T1053_Scheduled Task-Job|Scheduled Task/Job (T1053)]] by modifying GPO settings, in this case modifying `<GPO_PATH>\Machine\Preferences\ScheduledTasks\ScheduledTasks.xml`.[3](https://wald0.com/?p=179)[4](http://www.harmj0y.net/blog/redteaming/abusing-gpo-permissions/) In some cases an adversary might modify specific user rights like SeEnableDelegationPrivilege, set in `<GPO_PATH>\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf`, to achieve a subtle AD backdoor with complete control of the domain because the user account under the adversary's control would then be able to modify GPOs.[7](http://www.harmj0y.net/blog/activedirectory/the-most-dangerous-user-right-you-probably-have-never-heard-of/)

#### Domain Trust Modification - T1484.002
[more on T1484.002](https://attack.mitre.org/techniques/T1484/002)

Adversaries may add new domain trusts or modify the properties of existing domain trusts to evade defenses and/or elevate privileges. Domain trust details, such as whether or not a domain is federated, allow authentication and authorization properties to apply between domains for the purpose of accessing shared resources.[1](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/whatis-fed) These trust objects may include accounts, credentials, and other authentication material applied to servers, tokens, and domains.

Manipulating the domain trusts may allow an adversary to escalate privileges and/or evade defenses by modifying settings to add objects which they control. For example, this may be used to forge [[T1606_Forge Web Credentials#SAML Tokens - T1606 002|SAML Tokens (T1606.002)]], without the need to compromise the signing certificate to forge new credentials. Instead, an adversary can manipulate domain trusts to add their own signing certificate.



