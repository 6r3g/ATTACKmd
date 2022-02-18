Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1110  

# Brute Force - T1110
---
## Description
[more on T1110](https://attack.mitre.org/techniques/T1110)

Adversaries may use brute force techniques to gain access to accounts when passwords are unknown or when password hashes are obtained. Without knowledge of the password for an account or set of accounts, an adversary may systematically guess the password using a repetitive or iterative mechanism. Brute forcing passwords can take place via interaction with a service that will check the validity of those credentials or offline against previously acquired credential data, such as password hashes.

Brute forcing credentials may take place at various points during a breach. For example, adversaries may attempt to brute force access to [[T1078_Valid Accounts|Valid Accounts (T1078)]] within a victim environment leveraging knowledge gathered from other post-compromise behaviors such as [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]], [[T1087_Account Discovery|Account Discovery (T1087)]], or [[T1201_Password Policy Discovery|Password Policy Discovery (T1201)]]. Adversaries may also combine brute forcing activity with behaviors such as [[T1133_External Remote Services|External Remote Services (T1133)]] as part of Initial Access.

---
## Sub-Techniques

#### Password Guessing - T1110.001
[more on T1110.001](https://attack.mitre.org/techniques/T1110/001)

Adversaries with no prior knowledge of legitimate credentials within the system or environment may guess passwords to attempt access to accounts. Without knowledge of the password for an account, an adversary may opt to systematically guess the password using a repetitive or iterative mechanism. An adversary may guess login credentials without prior knowledge of system or environment passwords during an operation by using a list of common passwords. Password guessing may or may not take into account the target's policies on password complexity or use policies that may lock accounts out after a number of failed attempts.

Guessing passwords can be a risky option because it could cause numerous authentication failures and account lockouts, depending on the organization's login failure policies. [1](https://web.archive.org/web/20200302085133/https://www.cylance.com/content/dam/cylance/pages/operation-cleaver/Cylance_Operation_Cleaver_Report.pdf)

Typically, management services over commonly used ports are used when guessing passwords. Commonly targeted services include the following:

-   SSH (22/TCP)
-   Telnet (23/TCP)
-   FTP (21/TCP)
-   NetBIOS / SMB / Samba (139/TCP & 445/TCP)
-   LDAP (389/TCP)
-   Kerberos (88/TCP)
-   RDP / Terminal Services (3389/TCP)
-   HTTP/HTTP Management Services (80/TCP & 443/TCP)
-   MSSQL (1433/TCP)
-   Oracle (1521/TCP)
-   MySQL (3306/TCP)
-   VNC (5900/TCP)

In addition to management services, adversaries may "target single sign-on (SSO) and cloud-based applications utilizing federated authentication protocols," as well as externally facing email applications, such as Office 365.[2](https://www.us-cert.gov/ncas/alerts/TA18-086A)

In default environments, LDAP and Kerberos connection attempts are less likely to trigger events over SMB, which creates Windows "logon failure" event ID 4625.

#### Password Cracking - T1110.002
[more on T1110.002](https://attack.mitre.org/techniques/T1110/002)

Adversaries may use password cracking to attempt to recover usable credentials, such as plaintext passwords, when credential material such as password hashes are obtained. [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]] is used to obtain password hashes, this may only get an adversary so far when [[T1550_Use Alternate Authentication Material#Pass The Hash - T1550 002|Pass the Hash (T1550.002)]] is not an option. Techniques to systematically guess the passwords used to compute hashes are available, or the adversary may use a pre-computed rainbow table to crack hashes. Cracking hashes is usually done on adversary-controlled systems outside of the target network.[1](https://en.wikipedia.org/wiki/Password_cracking) The resulting plaintext password resulting from a successfully cracked hash may be used to log into systems, resources, and services in which the account has access.

#### Password Spraying - T1110.003
[more on T1110.003](https://attack.mitre.org/techniques/T1110/003)

Adversaries may use a single or small list of commonly used passwords against many different accounts to attempt to acquire valid account credentials. Password spraying uses one password (e.g. 'Password01'), or a small list of commonly used passwords, that may match the complexity policy of the domain. Logins are attempted with that password against many different accounts on a network to avoid account lockouts that would normally occur when brute forcing a single account with many passwords. [1](http://www.blackhillsinfosec.com/?p=4645)

Typically, management services over commonly used ports are used when password spraying. Commonly targeted services include the following:

-   SSH (22/TCP)
-   Telnet (23/TCP)
-   FTP (21/TCP)
-   NetBIOS / SMB / Samba (139/TCP & 445/TCP)
-   LDAP (389/TCP)
-   Kerberos (88/TCP)
-   RDP / Terminal Services (3389/TCP)
-   HTTP/HTTP Management Services (80/TCP & 443/TCP)
-   MSSQL (1433/TCP)
-   Oracle (1521/TCP)
-   MySQL (3306/TCP)
-   VNC (5900/TCP)

In addition to management services, adversaries may "target single sign-on (SSO) and cloud-based applications utilizing federated authentication protocols," as well as externally facing email applications, such as Office 365.[2](https://www.us-cert.gov/ncas/alerts/TA18-086A)

In default environments, LDAP and Kerberos connection attempts are less likely to trigger events over SMB, which creates Windows "logon failure" event ID 4625.

#### Credential Stuffing - T1110.004
[more on T1110.004](https://attack.mitre.org/techniques/T1110/004)

Adversaries may use credentials obtained from breach dumps of unrelated accounts to gain access to target accounts through credential overlap. Occasionally, large numbers of username and password pairs are dumped online when a website or service is compromised and the user account credentials accessed. The information may be useful to an adversary attempting to compromise accounts by taking advantage of the tendency for users to use the same passwords across personal and business accounts.

Credential stuffing is a risky option because it could cause numerous authentication failures and account lockouts, depending on the organization's login failure policies.

Typically, management services over commonly used ports are used when stuffing credentials. Commonly targeted services include the following:

-   SSH (22/TCP)
-   Telnet (23/TCP)
-   FTP (21/TCP)
-   NetBIOS / SMB / Samba (139/TCP & 445/TCP)
-   LDAP (389/TCP)
-   Kerberos (88/TCP)
-   RDP / Terminal Services (3389/TCP)
-   HTTP/HTTP Management Services (80/TCP & 443/TCP)
-   MSSQL (1433/TCP)
-   Oracle (1521/TCP)
-   MySQL (3306/TCP)
-   VNC (5900/TCP)

In addition to management services, adversaries may "target single sign-on (SSO) and cloud-based applications utilizing federated authentication protocols," as well as externally facing email applications, such as Office 365.[1](https://www.us-cert.gov/ncas/alerts/TA18-086A)

