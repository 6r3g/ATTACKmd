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


