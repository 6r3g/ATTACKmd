Tactics: [[PRIVILEGE_ESCALATION]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1548  

# Abuse Elevation Control Mechanism - T1548
---
## Description
[more on T1548](https://attack.mitre.org/techniques/T1548)

Adversaries may circumvent mechanisms designed to control elevate privileges to gain higher-level permissions. Most modern systems contain native elevation control mechanisms that are intended to limit privileges that a user can perform on a machine. Authorization has to be granted to specific users in order to perform tasks that can be considered of higher risk. An adversary can perform several methods to take advantage of built-in control mechanisms in order to escalate privileges on a system.

---
## Sub-Techniques

#### Setuid and Setgid - T1548.001
[more on T1548.001](https://attack.mitre.org/techniques/T1548/001)

An adversary may perform shell escapes or exploit vulnerabilities in an application with the setsuid or setgid bits to get code running in a different user’s context. On Linux or macOS, when the setuid or setgid bits are set for an application, the application will run with the privileges of the owning user or group respectively. [1](http://man7.org/linux/man-pages/man2/setuid.2.html). Normally an application is run in the current user’s context, regardless of which user or group owns the application. However, there are instances where programs need to be executed in an elevated context to function properly, but the user running them doesn’t need the elevated privileges.

Instead of creating an entry in the sudoers file, which must be done by root, any user can specify the setuid or setgid flag to be set for their own applications. These bits are indicated with an "s" instead of an "x" when viewing a file's attributes via `ls -l`. The `chmod` program can set these bits with via bitmasking, `chmod 4777 [file]` or via shorthand naming, `chmod u+s [file]`.

Adversaries can use this mechanism on their own malware to make sure they're able to execute in elevated contexts in the future.[2](https://www.welivesecurity.com/2016/07/06/new-osxkeydnap-malware-hungry-credentials/).

#### Bypass User Account Control - T1548.002
[more on T1548.002](https://attack.mitre.org/techniques/T1548/002)

Adversaries may bypass UAC mechanisms to elevate process privileges on system. Windows User Account Control (UAC) allows a program to elevate its privileges (tracked as integrity levels ranging from low to high) to perform a task under administrator-level permissions, possibly by prompting the user for confirmation. The impact to the user ranges from denying the operation under high enforcement to allowing the user to perform the action if they are in the local administrators group and click through the prompt or allowing them to enter an administrator password to complete the action. [1](https://technet.microsoft.com/en-us/itpro/windows/keep-secure/how-user-account-control-works)

If the UAC protection level of a computer is set to anything but the highest level, certain Windows programs can elevate privileges or execute some elevated [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] objects without prompting the user through the UAC notification box. [2](https://technet.microsoft.com/en-US/magazine/2009.07.uac.aspx) [3](https://msdn.microsoft.com/en-us/library/ms679687.aspx) An example of this is use of [[T1218_Signed Binary Proxy Execution#Rundll32 - T1218 011|Rundll32 (T1218.011)]] to load a specifically crafted DLL which loads an auto-elevated [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] object and performs a file operation in a protected directory which would typically require elevated access. Malicious software may also be injected into a trusted process to gain elevated privileges without prompting a user.[4](http://www.pretentiousname.com/misc/win7_uac_whitelist2.html)

Many methods have been discovered to bypass UAC. The Github readme page for UACME contains an extensive list of methods[5](https://github.com/hfiref0x/UACME) that have been discovered and implemented, but may not be a comprehensive list of bypasses. Additional bypass methods are regularly discovered and some used in the wild, such as:

-   `eventvwr.exe` can auto-elevate and execute a specified binary or script.[6](https://enigma0x3.net/2016/08/15/fileless-uac-bypass-using-eventvwr-exe-and-registry-hijacking/)[7](https://blog.fortinet.com/2016/12/16/malicious-macro-bypasses-uac-to-elevate-privilege-for-fareit-malware)

Another bypass is possible through some lateral movement techniques if credentials for an account with administrator privileges are known, since UAC is a single system security mechanism, and the privilege or integrity of a process running on one system will be unknown on remote systems and default to high integrity.[8](http://pen-testing.sans.org/blog/pen-testing/2013/08/08/psexec-uac-bypass)

#### Sudo and Sudo Caching - T1548.003
[more on T1548.003](https://attack.mitre.org/techniques/T1548/003)

Adversaries may perform sudo caching and/or use the suoders file to elevate privileges. Adversaries may do this to execute commands as other users or spawn processes with higher privileges.

Within Linux and MacOS systems, sudo (sometimes referred to as "superuser do") allows users to perform commands from terminals with elevated privileges and to control who can perform these commands on the system. The `sudo` command "allows a system administrator to delegate authority to give certain users (or groups of users) the ability to run some (or all) commands as root or another user while providing an audit trail of the commands and their arguments."[1](https://www.sudo.ws/) Since sudo was made for the system administrator, it has some useful configuration features such as a `timestamp_timeout`, which is the amount of time in minutes between instances of `sudo` before it will re-prompt for a password. This is because `sudo` has the ability to cache credentials for a period of time. Sudo creates (or touches) a file at `/var/db/sudo` with a timestamp of when sudo was last run to determine this timeout. Additionally, there is a `tty_tickets` variable that treats each new tty (terminal session) in isolation. This means that, for example, the sudo timeout of one tty will not affect another tty (you will have to type the password again).

The sudoers file, `/etc/sudoers`, describes which users can run which commands and from which terminals. This also describes which commands users can run as other users or groups. This provides the principle of least privilege such that users are running in their lowest possible permissions for most of the time and only elevate to other users or permissions as needed, typically by prompting for a password. However, the sudoers file can also specify when to not prompt users for passwords with a line like `user1 ALL=(ALL) NOPASSWD: ALL` [2](https://blog.malwarebytes.com/threat-analysis/2017/04/new-osx-dok-malware-intercepts-web-traffic/). Elevated privileges are required to edit this file though.

Adversaries can also abuse poor configurations of these mechanisms to escalate privileges without needing the user's password. For example, `/var/db/sudo`'s timestamp can be monitored to see if it falls within the `timestamp_timeout` range. If it does, then malware can execute sudo commands without needing to supply the user's password. Additional, if `tty_tickets` is disabled, adversaries can do this from any tty for that user.

In the wild, malware has disabled `tty_tickets` to potentially make scripting easier by issuing `echo \'Defaults !tty_tickets\' >> /etc/sudoers` [3](https://www.cybereason.com/blog/labs-proton-b-what-this-mac-malware-actually-does). In order for this change to be reflected, the malware also issued `killall Terminal`. As of macOS Sierra, the sudoers file has `tty_tickets` enabled by default.

#### Elevated Execution with Prompt - T1548.004
[more on T1548.004](https://attack.mitre.org/techniques/T1548/004)

Adversaries may leverage the `AuthorizationExecuteWithPrivileges` API to escalate privileges by prompting the user for credentials.[1](https://developer.apple.com/documentation/security/1540038-authorizationexecutewithprivileg) The purpose of this API is to give application developers an easy way to perform operations with root privileges, such as for application installation or updating. This API does not validate that the program requesting root privileges comes from a reputable source or has been maliciously modified.

Although this API is deprecated, it still fully functions in the latest releases of macOS. When calling this API, the user will be prompted to enter their credentials but no checks on the origin or integrity of the program are made. The program calling the API may also load world writable files which can be modified to perform malicious behavior with elevated privileges.

Adversaries may abuse `AuthorizationExecuteWithPrivileges` to obtain root privileges in order to install malicious software on victims and install persistence mechanisms.[2](https://speakerdeck.com/patrickwardle/defcon-2017-death-by-1000-installers-its-all-broken?slide=8)[3](https://www.carbonblack.com/2019/02/12/tau-threat-intelligence-notification-new-macos-malware-variant-of-shlayer-osx-discovered/)[4](https://objective-see.com/blog/blog_0x2A.html) This technique may be combined with [[T1036_Masquerading|Masquerading (T1036)]] to trick the user into granting escalated privileges to malicious code.[2](https://speakerdeck.com/patrickwardle/defcon-2017-death-by-1000-installers-its-all-broken?slide=8)[3](https://www.carbonblack.com/2019/02/12/tau-threat-intelligence-notification-new-macos-malware-variant-of-shlayer-osx-discovered/) This technique has also been shown to work by modifying legitimate programs present on the machine that make use of this API.[2](https://speakerdeck.com/patrickwardle/defcon-2017-death-by-1000-installers-its-all-broken?slide=8)

#### Temporary Elevated Cloud Access - T1548.005
[more on T1548.005](https://attack.mitre.org/techniques/T1548/005)

Adversaries may abuse permission configurations that allow them to gain temporarily elevated access to cloud resources. Many cloud environments allow administrators to grant user or service accounts permission to request just-in-time access to roles, impersonate other accounts, pass roles onto resources and services, or otherwise gain short-term access to a set of privileges that may be distinct from their own.

Just-in-time access is a mechanism for granting additional roles to cloud accounts in a granular, temporary manner. This allows accounts to operate with only the permissions they need on a daily basis, and to request additional permissions as necessary. Sometimes just-in-time access requests are configured to require manual approval, while other times the desired permissions are automatically granted. [1](https://learn.microsoft.com/en-us/azure/azure-resource-manager/managed-applications/approve-just-in-time-access)

Account impersonation allows user or service accounts to temporarily act with the permissions of another account. For example, in GCP users with the `iam.serviceAccountTokenCreator` role can create temporary access tokens or sign arbitrary payloads with the permissions of a service account, while service accounts with domain-wide delegation permission are permitted to impersonate Google Workspace accounts. [2](https://cloud.google.com/iam/docs/service-account-permissions) [3](https://www.hunters.security/en/blog/delefriend-a-newly-discovered-design-flaw-in-domain-wide-delegation-could-leave-google-workspace-vulnerable-for-takeover) [4](https://cloud.google.com/architecture/manage-just-in-time-privileged-access-to-project) [5](https://unit42.paloaltonetworks.com/critical-risk-in-google-workspace-delegation-feature/) In Exchange Online, the `ApplicationImpersonation` role allows a service account to use the permissions associated with specified user accounts. [6](https://learn.microsoft.com/en-us/exchange/client-developer/exchange-web-services/impersonation-and-ews-in-exchange)

Many cloud environments also include mechanisms for users to pass roles to resources that allow them to perform tasks and authenticate to other services. While the user that creates the resource does not directly assume the role they pass to it, they may still be able to take advantage of the role's access -- for example, by configuring the resource to perform certain actions with the permissions it has been granted. In AWS, users with the `PassRole` permission can allow a service they create to assume a given role, while in GCP, users with the `iam.serviceAccountUser` role can attach a service account to a resource. [7](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html) [2](https://cloud.google.com/iam/docs/service-account-permissions)

While users require specific role assignments in order to use any of these features, cloud administrators may misconfigure permissions. This could result in escalation paths that allow adversaries to gain access to resources beyond what was originally intended. [8](https://rhinosecuritylabs.com/gcp/privilege-escalation-google-cloud-platform-part-1/) [9](https://rhinosecuritylabs.com/aws/aws-privilege-escalation-methods-mitigation/)

**Note:** this technique is distinct from [[T1098_Account Manipulation#Add Office 365 Global Administrator Role - T1098.003|Additional Cloud Roles]], which involves assigning permanent roles to accounts rather than abusing existing permissions structures to gain temporarily elevated access to resources. However, adversaries that compromise a sufficiently privileged account may grant another account they control [[T1098_Account Manipulation#Add Office 365 Global Administrator Role - T1098.003|Additional Cloud Roles]] that would allow them to also abuse these features. This may also allow for greater stealth than would be had by directly using the highly privileged account, especially when logs do not clarify when role impersonation is taking place. [10](https://www.crowdstrike.com/blog/observations-from-the-stellarparticle-campaign/)

#### TCC Manipulation - T1548.006
[more on T1548.006](https://attack.mitre.org/techniques/T1548/006)

Adversaries can manipulate or abuse the Transparency, Consent, & Control (TCC) service or database to execute malicious applications with elevated permissions. TCC is a Privacy & Security macOS control mechanism used to determine if the running process has permission to access the data or services protected by TCC, such as screen sharing, camera, microphone, or Full Disk Access (FDA).

When an application requests to access data or a service protected by TCC, the TCC daemon (`tccd`) checks the TCC database, located at `/Library/Application Support/com.apple.TCC/TCC.db` (and `~/` equivalent), for existing permissions. If permissions do not exist, then the user is prompted to grant permission. Once permissions are granted, the database stores the application's permissions and will not prompt the user again unless reset. For example, when a web browser requests permissions to the user's webcam, once granted the web browser may not explicitly prompt the user again. [1](https://www.welivesecurity.com/2022/07/19/i-see-what-you-did-there-look-cloudmensis-macos-spyware/)

Adversaries may manipulate the TCC database or otherwise abuse the TCC service to execute malicious content. This can be done in various ways, including using privileged system applications to execute malicious payloads or manipulating the database to grant their application TCC permissions.

For example, adversaries can use Finder, which has FDA permissions by default, to execute malicious [[T1059_Command and Scripting Interpreter#AppleScript - T1059.002|AppleScript]] while preventing a user prompt. For a system without System Integrity Protection (SIP) enabled, adversaries have also manipulated the operating system to load an adversary controlled TCC database using environment variables and [[T1569_System Services#Launchctl - T1569.001|Launchctl]].  [2](https://www.sentinelone.com/labs/bypassing-macos-tcc-user-privacy-protections-by-accident-and-design/) [3](https://interpressecurity.com/resources/return-of-the-macos-tcc/)

Adversaries may also opt to instead inject code (e.g., [[T1055_Process Injection|Process Injection]]) into targeted applications with the desired TCC permissions.

