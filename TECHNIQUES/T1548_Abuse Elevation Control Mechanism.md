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

