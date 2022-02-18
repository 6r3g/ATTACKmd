Tactics: [[PERSISTENCE]] - [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/techniques/T1037  

# Boot or Logon Initialization Scripts - T1037
---
## Description
[more on T1037](https://attack.mitre.org/techniques/T1037)

Adversaries may use scripts automatically executed at boot or logon initialization to establish [[persistence]]. Initialization scripts can be used to perform administrative functions, which may often execute other programs or send information to an internal logging server. These scripts can vary based on operating system and whether applied locally or remotely.

Adversaries may use these scripts to maintain [[persistence]] on a single system. Depending on the access configuration of the logon scripts, either local credentials or an administrator account may be necessary.

An adversary may also be able to escalate their privileges since some boot or logon initialization scripts run with higher privileges.

---
## Sub-Techniques

#### Logon Script (Windows) - T1037.001
[more on T1037.001](https://attack.mitre.org/techniques/T1037/001)

Adversaries may use Windows logon scripts automatically executed at logon initialization to establish [[persistence]]. Windows allows logon scripts to be run whenever a specific user or group of users log into a system.[1](https://technet.microsoft.com/en-us/library/cc758918(v=ws.10).aspx) This is done via adding a path to a script to the `HKCU\Environment\UserInitMprLogonScript` Registry key.[2](http://www.hexacorn.com/blog/2014/11/14/beyond-good-ol-run-key-part-18/)

Adversaries may use these scripts to maintain [[persistence]] on a single system. Depending on the access configuration of the logon scripts, either local credentials or an administrator account may be necessary.

#### Logon Script (Mac) - T1037.002
[more on T1037.002](https://attack.mitre.org/techniques/T1037/002)

Adversaries may use macOS logon scripts automatically executed at logon initialization to establish [[persistence]]. macOS allows logon scripts (known as login hooks) to be executed whenever a specific user logs into a system. A login hook tells Mac OS X to execute a certain script when a user logs in, but unlike [[T1037_Boot or Logon Initialization Scripts#Startup Items - T1037 005|Startup Items (T1037.005)]], a login hook executes as the elevated root user.[1](https://support.apple.com/de-at/HT2420)

Adversaries may use these login hooks to maintain [[persistence]] on a single system.[2](https://www.sentinelone.com/blog/how-malware-persists-on-macos/) Access to login hook scripts may allow an adversary to insert additional malicious code. There can only be one login hook at a time though and depending on the access configuration of the hooks, either local credentials or an administrator account may be necessary.

#### Network Logon Script - T1037.003
[more on T1037.003](https://attack.mitre.org/techniques/T1037/003)

Adversaries may use network logon scripts automatically executed at logon initialization to establish [[persistence]]. Network logon scripts can be assigned using Active Directory or Group Policy Objects.[1](https://www.petri.com/setting-up-logon-script-through-active-directory-users-computers-windows-server-2008) These logon scripts run with the privileges of the user they are assigned to. Depending on the systems within the network, initializing one of these scripts could apply to more than one or potentially all systems.

Adversaries may use these scripts to maintain [[persistence]] on a network. Depending on the access configuration of the logon scripts, either local credentials or an administrator account may be necessary.

#### RC Scripts - T1037.004
[more on T1037.004](https://attack.mitre.org/techniques/T1037/004)

Adversaries may establish [[persistence]] by modifying RC scripts which are executed during a Unix-like system’s startup. These files allow system administrators to map and start custom services at startup for different run levels. RC scripts require root privileges to modify.

Adversaries can establish [[persistence]] by adding a malicious binary path or shell commands to `rc.local`, `rc.common`, and other RC scripts specific to the Unix-like distribution.[1](https://iranthreats.github.io/resources/attribution-flying-rocket-kitten/)[2](https://www.intezer.com/blog-hiddenwasp-malware-targeting-linux-systems/) Upon reboot, the system executes the script's contents as root, resulting in [[persistence]].

Adversary abuse of RC scripts is especially effective for lightweight Unix-like distributions using the root user as default, such as IoT or embedded systems.[3](https://www.intezer.com/blog/research/kaiji-new-chinese-linux-malware-turning-to-golang/)

Several Unix-like systems have moved to Systemd and deprecated the use of RC scripts. This is now a deprecated mechanism in macOS in favor of [Launchd](https://attack.mitre.org/techniques/T1053/004). [4](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)[5](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/StartupItems.html) This technique can be used on Mac OS X Panther v10.3 and earlier versions which still execute the RC scripts.[6](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf) To maintain backwards compatibility some systems, such as Ubuntu, will execute the RC scripts if they exist with the correct file permissions.[7](http://manpages.ubuntu.com/manpages/bionic/man8/systemd-rc-local-generator.8.html)

#### Startup Items - T1037.005
[more on T1037.005](https://attack.mitre.org/techniques/T1037/005)

Adversaries may use startup items automatically executed at boot initialization to establish [[persistence]]. Startup items execute during the final phase of the boot process and contain shell scripts or other executable files along with configuration information used by the system to determine the execution order for all startup items. [1](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/StartupItems.html)

This is technically a deprecated technology (superseded by [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]]), and thus the appropriate folder, `/Library/StartupItems` isn’t guaranteed to exist on the system by default, but does appear to exist by default on macOS Sierra. A startup item is a directory whose executable and configuration property list (plist), `StartupParameters.plist`, reside in the top-level directory.

An adversary can create the appropriate folders/files in the StartupItems directory to register their own [[persistence]] mechanism [2](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf). Additionally, since StartupItems run during the bootup phase of macOS, they will run as the elevated root user.

