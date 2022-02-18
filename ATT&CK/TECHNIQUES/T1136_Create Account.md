Tactics: [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1136  

# Create Account - T1136
---
## Description
[more on T1136](https://attack.mitre.org/techniques/T1136)

Adversaries may create an account to maintain access to victim systems. With a sufficient level of access, creating such accounts may be used to establish secondary credentialed access that do not require persistent remote access tools to be deployed on the system.

Accounts may be created on the local system or within a domain or cloud tenant. In cloud environments, adversaries may create accounts that only have access to specific services, which can reduce the chance of detection.

---
## Sub-Techniques

#### Local Account - T1136.001
[more on T1136.001](https://attack.mitre.org/techniques/T1136/001)

Adversaries may create a local account to maintain access to victim systems. Local accounts are those configured by an organization for use by users, remote support, services, or for administration on a single system or service. With a sufficient level of access, the `net user /add` command can be used to create a local account. On macOS systems the `dscl -create` command can be used to create a local account.

Such accounts may be used to establish secondary credentialed access that do not require persistent remote access tools to be deployed on the system.

#### Domain Account - T1136.002
[more on T1136.002](https://attack.mitre.org/techniques/T1136/002)

Adversaries may create a domain account to maintain access to victim systems. Domain accounts are those managed by Active Directory Domain Services where access and permissions are configured across systems and services that are part of that domain. Domain accounts can cover user, administrator, and service accounts. With a sufficient level of access, the `net user /add /domain` command can be used to create a domain account.

Such accounts may be used to establish secondary credentialed access that do not require persistent remote access tools to be deployed on the system.

#### Cloud Account - T1136.003
[more on T1136.003](https://attack.mitre.org/techniques/T1136/003)

Adversaries may create a cloud account to maintain access to victim systems. With a sufficient level of access, such accounts may be used to establish secondary credentialed access that does not require persistent remote access tools to be deployed on the system.[1](https://docs.microsoft.com/en-us/office365/admin/add-users/about-admin-roles?view=o365-worldwide)[2](https://support.office.com/en-us/article/add-another-admin-f693489f-9f55-4bd0-a637-a81ce93de22d)[3](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)[4](https://support.google.com/cloudidentity/answer/7332836?hl=en&ref_topic=7558554)[5](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory)

Adversaries may create accounts that only have access to specific cloud services, which can reduce the chance of detection.


