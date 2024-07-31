Tactics: [[PERSISTENCE]] - [[DEFENSE_EVASION]] - [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1556  

# Modify Authentication Process - T1556
---
## Description
[more on T1556](https://attack.mitre.org/techniques/T1556)

Adversaries may modify authentication mechanisms and processes to access user credentials or enable otherwise unwarranted access to accounts. The authentication process is handled by mechanisms, such as the Local Security Authentication Server (LSASS) process and the Security Accounts Manager (SAM) on Windows, pluggable authentication modules (PAM) on Unix-based systems, and authorization plugins on MacOS systems, responsible for gathering, storing, and validating credentials. By modifying an authentication process, an adversary may be able to authenticate to a service or system without using [[T1078_Valid Accounts|Valid Accounts (T1078)]].

Adversaries may maliciously modify a part of this process to either reveal credentials or bypass authentication mechanisms. Compromised credentials or access may be used to bypass access controls placed on various resources on systems within the network and may even be used for persistent access to remote systems and externally available services, such as VPNs, Outlook Web Access and remote desktop.

---
## Sub-Techniques

#### Domain Controller Authentication - T1556.001
[more on T1556.001](https://attack.mitre.org/techniques/T1556/001)

Adversaries may patch the authentication process on a domain controller to bypass the typical authentication mechanisms and enable access to accounts.

Malware may be used to inject false credentials into the authentication process on a domain controller with the intent of creating a backdoor used to access any user’s account and/or credentials (ex: [Skeleton Key](https://attack.mitre.org/software/S0007)). Skeleton key works through a patch on an enterprise domain controller authentication process (LSASS) with credentials that adversaries may use to bypass the standard authentication system. Once patched, an adversary can use the injected password to successfully authenticate as any domain user account (until the the skeleton key is erased from memory by a reboot of the domain controller). Authenticated access may enable unfettered access to hosts and/or resources within single-factor authentication environments.[1](https://www.secureworks.com/research/skeleton-key-malware-analysis)

#### Password Filter DLL - T1556.002
[more on T1556.002](https://attack.mitre.org/techniques/T1556/002)

Adversaries may register malicious password filter dynamic link libraries (DLLs) into the authentication process to acquire user credentials as they are validated.

Windows password filters are password policy enforcement mechanisms for both domain and local accounts. Filters are implemented as DLLs containing a method to validate potential passwords against password policies. Filter DLLs can be positioned on local computers for local accounts and/or domain controllers for domain accounts. Before registering new passwords in the Security Accounts Manager (SAM), the Local Security Authority (LSA) requests validation from each registered filter. Any potential changes cannot take effect until every registered filter acknowledges validation.

Adversaries can register malicious password filters to harvest credentials from local computers and/or entire domains. To perform proper validation, filters must receive plain-text credentials from the LSA. A malicious password filter would receive these plain-text credentials every time a password request is made.[1](http://carnal0wnage.attackresearch.com/2013/09/stealing-passwords-every-time-they.html)

#### Pluggable Authentication Modules - T1556.003
[more on T1556.003](https://attack.mitre.org/techniques/T1556/003)

Adversaries may modify pluggable authentication modules (PAM) to access user credentials or enable otherwise unwarranted access to accounts. PAM is a modular system of configuration files, libraries, and executable files which guide authentication for many services. The most common authentication module is `pam_unix.so`, which retrieves, sets, and verifies account authentication information in `/etc/passwd` and `/etc/shadow`.[1](https://opensource.apple.com/source/dovecot/dovecot-239/dovecot/doc/wiki/PasswordDatabase.PAM.txt)[2](https://linux.die.net/man/8/pam_unix)[3](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/managing_smart_cards/pluggable_authentication_modules)

Adversaries may modify components of the PAM system to create backdoors. PAM components, such as `pam_unix.so`, can be patched to accept arbitrary adversary supplied values as legitimate credentials.[4](https://github.com/zephrax/linux-pam-backdoor)

Malicious modifications to the PAM system may also be abused to steal credentials. Adversaries may infect PAM resources with code to harvest user credentials, since the values exchanged with PAM components may be plain-text since PAM does not store passwords.[5](https://x-c3ll.github.io/posts/PAM-backdoor-DNS/)[1](https://opensource.apple.com/source/dovecot/dovecot-239/dovecot/doc/wiki/PasswordDatabase.PAM.txt)

#### Network Device Authentication - T1556.004
[more on T1556.004](https://attack.mitre.org/techniques/T1556/004)

Adversaries may use [[T1601_Modify System Image#Patch System Image - T1601 001|Patch System Image (T1601.001)]] to hard code a password in the operating system, thus bypassing of native authentication mechanisms for local accounts on network devices.

[[T1601_Modify System Image|Modify System Image (T1601)]] may include implanted code to the operating system for network devices to provide access for adversaries using a specific password. The modification includes a specific password which is implanted in the operating system image via the patch. Upon authentication attempts, the inserted code will first check to see if the user input is the password. If so, access is granted. Otherwise, the implanted code will pass the credentials on for verification of potentially valid credentials.[1](https://www.fireeye.com/blog/threat-research/2015/09/synful_knock_-_acis.html)

#### Reversible Encryption - T1556.005
[more on T1556.005](https://attack.mitre.org/techniques/T1556/005)

An adversary may abuse Active Directory authentication encryption properties to gain access to credentials on Windows systems. The `AllowReversiblePasswordEncryption` property specifies whether reversible password encryption for an account is enabled or disabled. By default this property is disabled (instead storing user credentials as the output of one-way hashing functions) and should not be enabled unless legacy or other software require it. [1](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/store-passwords-using-reversible-encryption)

If the property is enabled and/or a user changes their password after it is enabled, an adversary may be able to obtain the plaintext of passwords created/changed after the property was enabled. To decrypt the passwords, an adversary needs four components:

1. Encrypted password (`G$RADIUSCHAP`) from the Active Directory user-structure `userParameters`
2. 16 byte randomly-generated value (`G$RADIUSCHAPKEY`) also from `userParameters`
3. Global LSA secret (`G$MSRADIUSCHAPKEY`)
4. Static key hardcoded in the Remote Access Subauthentication DLL (`RASSFM.DLL`)

With this information, an adversary may be able to reproduce the encryption key and subsequently decrypt the encrypted password value. [2](http://blog.teusink.net/2009/08/passwords-stored-using-reversible.html) [3](http://blog.teusink.net/2009/08/passwords-stored-using-reversible_26.html)

An adversary may set this property at various scopes through Local Group Policy Editor, user properties, Fine-Grained Password Policy (FGPP), or via the ActiveDirectory [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]] module. For example, an adversary may implement and apply a FGPP to users or groups if the Domain Functional Level is set to "Windows Server 2008" or higher. [4](https://adsecurity.org/?p=2053) In PowerShell, an adversary may make associated changes to user settings using commands similar to `Set-ADUser -AllowReversiblePasswordEncryption $true`.

#### Multi-Factor Authentication - T1556.006
[more on T1556.006](https://attack.mitre.org/techniques/T1556/006)

Adversaries may disable or modify multi-factor authentication (MFA) mechanisms to enable persistent access to compromised accounts.

Once adversaries have gained access to a network by either compromising an account lacking MFA or by employing an MFA bypass method such as [[T1621_Multi-Factor Authentication Request Generation|Multi-Factor Authentication Request Generation]], adversaries may leverage their access to modify or completely disable MFA defenses. This can be accomplished by abusing legitimate features, such as excluding users from Azure AD Conditional Access Policies, registering a new yet vulnerable/adversary-controlled MFA method, or by manually patching MFA programs and configuration files to bypass expected functionality. [1](https://www.mandiant.com/media/17826) [2](https://docs.microsoft.com/en-us/azure/active-directory/governance/conditional-access-exclusion)

For example, modifying the Windows hosts file (`C:\windows\system32\drivers\etc\hosts`) to redirect MFA calls to localhost instead of an MFA server may cause the MFA process to fail. If a "fail open" policy is in place, any otherwise successful authentication attempt may be granted access without enforcing MFA. [3](https://www.cisa.gov/uscert/ncas/alerts/aa22-074a)

Depending on the scope, goals, and privileges of the adversary, MFA defenses may be disabled for individual accounts or for all accounts tied to a larger group, such as all domain accounts in a victim's network environment. [3](https://www.cisa.gov/uscert/ncas/alerts/aa22-074a)

#### Hybrid Identity  - T1556.007
[more on T1556.007](https://attack.mitre.org/techniques/T1556/007)

Adversaries may patch, modify, or otherwise backdoor cloud authentication processes that are tied to on-premises user identities in order to bypass typical authentication mechanisms, access credentials, and enable persistent access to accounts.

Many organizations maintain hybrid user and device identities that are shared between on-premises and cloud-based environments. These can be maintained in a number of ways. For example, Azure AD includes three options for synchronizing identities between Active Directory and Azure AD [1](https://learn.microsoft.com/en-us/azure/active-directory/hybrid/choose-ad-authn):

- Password Hash Synchronization (PHS), in which a privileged on-premises account synchronizes user password hashes between Active Directory and Azure AD, allowing authentication to Azure AD to take place entirely in the cloud
- Pass Through Authentication (PTA), in which Azure AD authentication attempts are forwarded to an on-premises PTA agent, which validates the credentials against Active Directory
- Active Directory Federation Services (AD FS), in which a trust relationship is established between Active Directory and Azure AD

AD FS can also be used with other SaaS and cloud platforms such as AWS and GCP, which will hand off the authentication process to AD FS and receive a token containing the hybrid users’ identity and privileges.

By modifying authentication processes tied to hybrid identities, an adversary may be able to establish persistent privileged access to cloud resources. For example, adversaries who compromise an on-premises server running a PTA agent may inject a malicious DLL into the `AzureADConnectAuthenticationAgentService` process that authorizes all attempts to authenticate to Azure AD, as well as records user credentials. [2](https://blog.xpnsec.com/azuread-connect-for-redteam/) [3](https://o365blog.com/post/on-prem_admin/) In environments using AD FS, an adversary may edit the `Microsoft.IdentityServer.Servicehost` configuration file to load a malicious DLL that generates authentication tokens for any user with any set of claims, thereby bypassing multi-factor authentication and defined AD FS policies. [4](https://www.microsoft.com/security/blog/2022/08/24/magicweb-nobeliums-post-compromise-trick-to-authenticate-as-anyone/)

In some cases, adversaries may be able to modify the hybrid identity authentication process from the cloud. For example, adversaries who compromise a Global Administrator account in an Azure AD tenant may be able to register a new PTA agent via the web console, similarly allowing them to harvest credentials and log into the Azure AD environment as any user. [5](https://www.mandiant.com/resources/detecting-microsoft-365-azure-active-directory-backdoors)

#### Network Provider DLL - T1556.008
[more on T1556.008](https://attack.mitre.org/techniques/T1556/008)

Adversaries may register malicious network provider dynamic link libraries (DLLs) to capture cleartext user credentials during the authentication process. Network provider DLLs allow Windows to interface with specific network protocols and can also support add-on credential management functions. [1](https://learn.microsoft.com/en-us/windows/win32/secauthn/network-provider-api) During the logon process, Winlogon (the interactive logon module) sends credentials to the local `mpnotify.exe` process via RPC. The `mpnotify.exe` process then shares the credentials in cleartext with registered credential managers when notifying that a logon event is happening. [2](https://www.huntress.com/blog/cleartext-shenanigans-gifting-user-passwords-to-adversaries-with-nppspy) [3](https://www.youtube.com/watch?v=ggY3srD9dYs) [4](https://learn.microsoft.com/en-us/windows/win32/api/npapi/nf-npapi-nplogonnotify)

Adversaries can configure a malicious network provider DLL to receive credentials from `mpnotify.exe`. [5](https://github.com/gtworek/PSBits/tree/master/PasswordStealing/NPPSpy) Once installed as a credential manager (via the Registry), a malicious DLL can receive and save credentials each time a user logs onto a Windows workstation or domain via the `NPLogonNotify()` function. [4](https://learn.microsoft.com/en-us/windows/win32/api/npapi/nf-npapi-nplogonnotify)

Adversaries may target planting malicious network provider DLLs on systems known to have increased logon activity and/or administrator logon activity, such as servers and domain controllers. [2](https://www.huntress.com/blog/cleartext-shenanigans-gifting-user-passwords-to-adversaries-with-nppspy)

#### Conditional Access Policies - T1556.009
[more on T1556.009](https://attack.mitre.org/techniques/T1556/009)

Adversaries may disable or modify conditional access policies to enable persistent access to compromised accounts. Conditional access policies are additional verifications used by identity providers and identity and access management systems to determine whether a user should be granted access to a resource.

For example, in Azure AD, Okta, and JumpCloud, users can be denied access to applications based on their IP address, device enrollment status, and use of multi-factor authentication. [1](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview) [2](https://jumpcloud.com/support/get-started-conditional-access-policies) [3](https://support.okta.com/help/s/article/Conditional-access-based-on-device-security-posture?language=en_US) In some cases, identity providers may also support the use of risk-based metrics to deny sign-ins based on a variety of indicators. In AWS and GCP, IAM policies can contain `condition` attributes that verify arbitrary constraints such as the source IP, the date the request was made, and the nature of the resources or regions being requested. [4](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition.html) [5](https://cloud.google.com/iam/docs/conditions-overview) These measures help to prevent compromised credentials from resulting in unauthorized access to data or resources, as well as limit user permissions to only those required.

By modifying conditional access policies, such as adding additional trusted IP ranges, removing [[T1556_Modify Authentication Process#Multi-Factor Authentication - T1556.006|Multi-Factor Authentication]] requirements, or allowing additional [[T1535_Unused-Unsupported Cloud Regions|Unused/Unsupported Cloud Regions]], adversaries may be able to ensure persistent access to accounts and circumvent defensive measures.

