Tactics: [[INITIAL_ACCESS]] - [[PERSISTENCE]] - [[PRIVILEGE_ESCALATION]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1078 

# Valid Accounts - T1078
---
## Description
[more on T1078](https://attack.mitre.org/techniques/T1078)

Adversaries may obtain and abuse credentials of existing accounts as a means of gaining Initial Access, Persistence, Privilege Escalation, or Defense Evasion. Compromised credentials may be used to bypass access controls placed on various resources on systems within the network and may even be used for persistent access to remote systems and externally available services, such as VPNs, Outlook Web Access and remote desktop. Compromised credentials may also grant an adversary increased privilege to specific systems or access to restricted areas of the network. Adversaries may choose not to use malware or tools in conjunction with the legitimate access those credentials provide to make it harder to detect their presence.

The overlap of permissions for local, domain, and cloud accounts across a network of systems is of concern because the adversary may be able to pivot across accounts and systems to reach a high level of access (i.e., domain or enterprise administrator) to bypass access controls set within the enterprise. [1](https://technet.microsoft.com/en-us/library/dn535501.aspx)

---
## Sub-Techniques

#### Default Accounts - T1078.001
[more on T1078.001](https://attack.mitre.org/techniques/T1078/001)

Adversaries may obtain and abuse credentials of a default account as a means of gaining Initial Access, Persistence, Privilege Escalation, or Defense Evasion. Default accounts are those that are built-into an OS, such as the Guest or Administrator accounts on Windows systems. Default accounts also include default factory/provider set accounts on other types of systems, software, or devices, including the root user account in AWS and the default service account in Kubernetes.[1](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/local-accounts)[2](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html)[3](https://www.microsoft.com/security/blog/2020/04/02/attack-matrix-kubernetes/)

Default accounts are not limited to client machines, rather also include accounts that are preset for equipment such as network devices and computer applications whether they are internal, open source, or commercial. Appliances that come preset with a username and password combination pose a serious threat to organizations that do not change it post installation, as they are easy targets for an adversary. Similarly, adversaries may also utilize publicly disclosed or stolen [[T1552_Unsecured Credentials#Private Keys - T1552 004|Private Keys (T1552.004)]] or credential materials to legitimately connect to remote environments via [[T1021_Remote Services|Remote Services (T1021)]].[4](https://github.com/rapid7/metasploit-framework/tree/master/modules/exploits/linux/ssh)

#### Domain Accounts - T1078.002
[more on T1078.002](https://attack.mitre.org/techniques/T1078/002)

Adversaries may obtain and abuse credentials of a domain account as a means of gaining Initial Access, Persistence, Privilege Escalation, or Defense Evasion. [1](https://technet.microsoft.com/en-us/library/dn535501.aspx) Domain accounts are those managed by Active Directory Domain Services where access and permissions are configured across systems and services that are part of that domain. Domain accounts can cover users, administrators, and services.[2](https://docs.microsoft.com/en-us/windows/security/identity-protection/access-control/active-directory-accounts)

Adversaries may compromise domain accounts, some with a high level of privileges, through various means such as [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]] or password reuse, allowing access to privileged resources of the domain.

#### Local Accounts - T1078.003
[more on T1078.003](https://attack.mitre.org/techniques/T1078/003)

Adversaries may obtain and abuse credentials of a local account as a means of gaining Initial Access, Persistence, Privilege Escalation, or Defense Evasion. Local accounts are those configured by an organization for use by users, remote support, services, or for administration on a single system or service.

Local Accounts may also be abused to elevate privileges and harvest credentials through [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]]. Password reuse may allow the abuse of local accounts across a set of machines on a network for the purposes of Privilege Escalation and Lateral Movement.

#### Cloud Accounts - T1078.004
[more on T1078.004](https://attack.mitre.org/techniques/T1078/004)

Adversaries may obtain and abuse credentials of a cloud account as a means of gaining Initial Access, Persistence, Privilege Escalation, or Defense Evasion. Cloud accounts are those created and configured by an organization for use by users, remote support, services, or for administration of resources within a cloud service provider or SaaS application. In some cases, cloud accounts may be federated with traditional identity management system, such as Window Active Directory. [1](https://aws.amazon.com/identity/federation/)[2](https://cloud.google.com/solutions/federating-gcp-with-active-directory-introduction)[3](https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/deployment/how-to-connect-fed-azure-adfs)

Compromised credentials for cloud accounts can be used to harvest sensitive data from online storage accounts and databases. Access to cloud accounts can also be abused to gain Initial Access to a network by abusing a [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]. Similar to [[T1078_Valid Accounts#Domain Accounts - T1078 002|Domain Accounts (T1078.002)]], compromise of federated cloud accounts may allow adversaries to more easily move laterally within an environment.


