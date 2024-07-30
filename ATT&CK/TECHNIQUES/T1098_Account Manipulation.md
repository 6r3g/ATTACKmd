Tactics: [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1098  

# Account Manipulation - T1098
---
## Description
[more on T1098](https://attack.mitre.org/techniques/T1098)

Adversaries may manipulate accounts to maintain access to victim systems. Account manipulation may consist of any action that preserves adversary access to a compromised account, such as modifying credentials or permission groups. These actions could also include account activity designed to subvert security policies, such as performing iterative password updates to bypass password duration policies and preserve the life of compromised credentials. In order to create or manipulate accounts, the adversary must already have sufficient permissions on systems or the domain.

---
## Sub-Techniques

#### Additional Cloud Credentials - T1098.001
[more on T1098.001](https://attack.mitre.org/techniques/T1098/001)

Adversaries may add adversary-controlled credentials to a cloud account to maintain persistent access to victim accounts and instances within the environment.

Adversaries may add credentials for Service Principals and Applications in addition to existing legitimate credentials in Azure AD.[1](https://msrc-blog.microsoft.com/2020/12/13/customer-guidance-on-recent-nation-state-cyber-attacks/)[2](https://speakerdeck.com/tweekfawkes/blue-cloud-of-death-red-teaming-azure-1)[3](https://www.youtube.com/watch?v=wQ1CuAPnrLM&feature=youtu.be&t=2815) These credentials include both x509 keys and passwords.[1](https://msrc-blog.microsoft.com/2020/12/13/customer-guidance-on-recent-nation-state-cyber-attacks/) With sufficient permissions, there are a variety of ways to add credentials including the Azure Portal, Azure command line interface, and Azure or Az PowerShell modules.[4](https://nedinthecloud.com/2019/07/16/demystifying-azure-ad-service-principals/)

In infrastructure-as-a-service (IaaS) environments, after gaining access through [[T1078_Valid Accounts#Cloud Accounts - T1078 004|Cloud Accounts (T1078.004)]], adversaries may generate or import their own SSH keys using either the `CreateKeyPair` or `ImportKeyPair` API in AWS or the `gcloud compute os-login ssh-keys add` command in GCP.[5](https://cloud.google.com/sdk/gcloud/reference/compute/os-login/ssh-keys/add) This allows persistent access to instances within the cloud environment without further usage of the compromised cloud accounts.[6](https://expel.io/blog/finding-evil-in-aws/)[7](https://expel.io/blog/behind-the-scenes-expel-soc-alert-aws/)

#### Exchange Email Delegate Permissions - T1098.002
[more on T1098.002](https://attack.mitre.org/techniques/T1098/002)

Adversaries may grant additional permission levels, such as ReadPermission or FullAccess, to maintain persistent access to an adversary-controlled email account. The `Add-MailboxPermission` [[T1059_Command and Scripting Interpreter#Powershell - T1059 001|PowerShell (T1059.001)]] cmdlet, available in on-premises Exchange and in the cloud-based service Office 365, adds permissions to a mailbox.[1](https://docs.microsoft.com/en-us/powershell/module/exchange/mailboxes/add-mailboxpermission?view=exchange-ps)[2](https://www.fireeye.com/content/dam/collateral/en/mtrends-2018.pdf)[3](https://www.crowdstrike.com/blog/hiding-in-plain-sight-using-the-office-365-activities-api-to-investigate-business-email-compromises/)

Adversaries may also assign mailbox folder permissions through individual folder permissions or roles. Adversaries may assign the Default or Anonymous user permissions or roles to the Top of Information Store (root), Inbox, or other mailbox folders. By assigning one or both user permissions to a folder, the adversary can utilize any other account in the tenant to maintain persistence to the target user’s mail folders.[4](https://www.fireeye.com/blog/threat-research/2021/01/remediation-and-hardening-strategies-for-microsoft-365-to-defend-against-unc2452.html)

This may be used in persistent threat incidents as well as BEC (Business Email Compromise) incidents where an adversary can assign more access rights to the accounts they wish to compromise. This may further enable use of additional techniques for gaining access to systems. For example, compromised business accounts are often used to send messages to other accounts in the network of the target business while creating inbox rules (ex: [[T1534_Internal Spearphishing|Internal Spearphishing (T1534)]]), so the messages evade spam/phishing detection mechanisms.[5](https://www.slideshare.net/DouglasBienstock/shmoocon-2019-becs-and-beyond-investigating-and-defending-office-365)

#### Add Office 365 Global Administrator Role - T1098.003
[more on T1098.003](https://attack.mitre.org/techniques/T1098/003)

An adversary may add the Global Administrator role to an adversary-controlled account to maintain persistent access to an Office 365 tenant.[1](https://support.office.com/en-us/article/add-another-admin-f693489f-9f55-4bd0-a637-a81ce93de22d)[2](https://docs.microsoft.com/en-us/office365/admin/add-users/about-admin-roles?view=o365-worldwide) With sufficient permissions, a compromised account can gain almost unlimited access to data and settings (including the ability to reset the passwords of other admins) via the global admin role.[2](https://docs.microsoft.com/en-us/office365/admin/add-users/about-admin-roles?view=o365-worldwide)

This account modification may immediately follow [[T1136_Create Account|Create Account (T1136)]] or other malicious account activity.

#### SSH Authorized Keys - T1098.004
[more on T1098.004](https://attack.mitre.org/techniques/T1098/004)

Adversaries may modify the SSH `authorized_keys` file to maintain persistence on a victim host. Linux distributions and macOS commonly use key-based authentication to secure the authentication process of SSH sessions for remote management. The `authorized_keys` file in SSH specifies the SSH keys that can be used for logging into the user account for which the file is configured. This file is usually found in the user's home directory under `<user-home>/.ssh/authorized_keys`. Users may edit the system’s SSH config file to modify the directives PubkeyAuthentication and RSAAuthentication to the value "yes" to ensure public key and RSA authentication are enabled. The SSH config file is usually located under `/etc/ssh/sshd_config`.

Adversaries may modify SSH `authorized_keys` files directly with scripts or shell commands to add their own adversary-supplied public keys. This ensures that an adversary possessing the corresponding private key may log in as an existing user via SSH.[2](https://www.venafi.com/blog/growing-abuse-ssh-keys-commodity-malware-campaigns-now-equipped-ssh-capabilities) [3](https://www.cybereason.com/blog/new-pervasive-worm-exploiting-linux-exim-server-vulnerability)

#### Device Registration - T1098.005
[more on T1098.005](https://attack.mitre.org/techniques/T1098/005)

Adversaries may register a device to an adversary-controlled account. Devices may be registered in a multifactor authentication (MFA) system, which handles authentication to the network, or in a device management system, which handles device access and compliance.

MFA systems, such as Duo or Okta, allow users to associate devices with their accounts in order to complete MFA requirements. An adversary that compromises a user’s credentials may enroll a new device in order to bypass initial MFA requirements and gain persistent access to a network. [1](https://www.cisa.gov/uscert/ncas/alerts/aa22-074a) [2](https://www.darkreading.com/threat-intelligence/fireeye-s-mandia-severity-zero-alert-led-to-discovery-of-solarwinds-attack) In some cases, the MFA self-enrollment process may require only a username and password to enroll the account's first device or to enroll a device to an inactive account. [3](https://www.mandiant.com/resources/blog/apt29-continues-targeting-microsoft)

Similarly, an adversary with existing access to a network may register a device to Azure AD and/or its device management system, Microsoft Intune, in order to access sensitive data or resources while bypassing conditional access policies. [4](https://o365blog.com/post/devices/) [5](https://o365blog.com/post/mdm) [6](https://www.microsoft.com/security/blog/2022/03/22/dev-0537-criminal-actor-targeting-organizations-for-data-exfiltration-and-destruction/)

Devices registered in Azure AD may be able to conduct [[T1534_Internal Spearphishing|Internal Spearphishing]] campaigns via intra-organizational emails, which are less likely to be treated as suspicious by the email client. [7](https://www.microsoft.com/security/blog/2022/01/26/evolved-phishing-device-registration-trick-adds-to-phishers-toolbox-for-victims-without-mfa) Additionally, an adversary may be able to perform a [[T1499_Endpoint Denial of Service#Service Exhaustion Flood - T1499.002|Service Exhaustion Flood]] on an Azure AD tenant by registering a large number of devices. [8](https://o365blog.com/post/bprt/)

#### Additional Container Cluster Roles - T1098.006
[more on T1098.006](https://attack.mitre.org/techniques/T1098/006)

An adversary may add additional roles or permissions to an adversary-controlled user or service account to maintain persistent access to a container orchestration system. For example, an adversary with sufficient permissions may create a RoleBinding or a ClusterRoleBinding to bind a Role or ClusterRole to a Kubernetes account. [1](https://kubernetes.io/docs/concepts/security/rbac-good-practices/) [2](https://blog.aquasec.com/leveraging-kubernetes-rbac-to-backdoor-clusters) Where attribute-based access control (ABAC) is in use, an adversary with sufficient permissions may modify a Kubernetes ABAC policy to give the target account additional permissions. [3](https://kubernetes.io/docs/reference/access-authn-authz/abac/)

This account modification may immediately follow [[T1136_Create Account|Create Account]] or other malicious account activity. Adversaries may also modify existing [[T1078_Valid Accounts|Valid Accounts]] that they have compromised.

Note that where container orchestration systems are deployed in cloud environments, as with Google Kubernetes Engine, Amazon Elastic Kubernetes Service, and Azure Kubernetes Service, cloud-based role-based access control (RBAC) assignments or ABAC policies can often be used in place of or in addition to local permission assignments. [4](https://cloud.google.com/kubernetes-engine/docs/how-to/iam) [5](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html) [6](https://learn.microsoft.com/en-us/azure/aks/concepts-identity) In these cases, this technique may be used in conjunction with [[T1098_Account Manipulation#Add Office 365 Global Administrator Role - T1098.003|Additional Cloud Roles]].
