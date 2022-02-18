Tactics: [[PERSISTENCE]] - [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/techniques/T1547  

# Boot or Logon Autostart Execution - T1547
---
## Description
[more on T1547](https://attack.mitre.org/techniques/T1547)

Adversaries may configure system settings to automatically execute a program during system boot or logon to maintain persistence or gain higher-level privileges on compromised systems. Operating systems may have mechanisms for automatically running a program on system boot or account logon.[1](http://msdn.microsoft.com/en-us/library/aa376977)[2](https://msdn.microsoft.com/library/windows/desktop/aa374733.aspx)[3](https://msdn.microsoft.com/library/windows/desktop/ms725475.aspx)[4](https://blog.cylance.com/windows-registry-persistence-part-2-the-run-keys-and-search-order)[5](https://www.tldp.org/LDP/lkmpg/2.4/lkmpg.pdf)  These mechanisms may include automatically executing programs that are placed in specially designated directories or are referenced by repositories that store configuration information, such as the Windows Registry. An adversary may achieve the same goal by modifying or extending features of the kernel.

Since some boot or logon autostart programs run with higher privileges, an adversary may leverage these to elevate privileges.

---
## Sub-Techniques

#### Registry Run Keys / Startup Folder - T1547.001
[more on T1547.001](https://attack.mitre.org/techniques/T1547/001)

Adversaries may achieve persistence by adding a program to a startup folder or referencing it with a Registry run key. Adding an entry to the "run keys" in the Registry or startup folder will cause the program referenced to be executed when a user logs in. [1](http://msdn.microsoft.com/en-us/library/aa376977) These programs will be executed under the context of the user and will have the account's associated permissions level.

Placing a program within a startup folder will also cause that program to execute when a user logs in. There is a startup folder location for individual user accounts as well as a system-wide startup folder that will be checked regardless of which user account logs in. The startup folder path for the current user is `C:\Users\[Username]\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`. The startup folder path for all users is `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`.

The following run keys are created by default on Windows systems:

-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run`
-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce`
-   `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run`
-   `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce`

Run keys may exist under multiple hives.[2](https://docs.microsoft.com/en-us/windows/win32/sysinfo/32-bit-and-64-bit-application-data-in-the-registry)[3](https://blog.malwarebytes.com/cybercrime/2013/10/hiding-in-plain-sight/) The `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx` is also available but is not created by default on Windows Vista and newer. Registry run key entries can reference programs directly or list them as a dependency. [4](https://support.microsoft.com/help/310593/description-of-the-runonceex-registry-key) For example, it is possible to load a DLL at logon using a "Depend" key with RunOnceEx: `reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx\0001\Depend /v 1 /d "C:\temp\evil[.]dll"` [5](https://oddvar.moe/2018/03/21/persistence-using-runonceex-hidden-from-autoruns-exe/)

The following Registry keys can be used to set startup folder items for persistence:

-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`
-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders`
-   `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders`
-   `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`

The following Registry keys can control automatic startup of services during boot:

-   `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce`
-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce`
-   `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices`
-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices`

Using policy settings to specify startup programs creates corresponding values in either of two Registry keys:

-   `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run`
-   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run`

The Winlogon key controls actions that occur when a user logs on to a computer running Windows 7. Most of these actions are under the control of the operating system, but you can also add custom actions here. The `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit` and `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell` subkeys can automatically launch programs.

Programs listed in the load value of the registry key `HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows` run when any user logs on.

By default, the multistring `BootExecute` value of the registry key `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager` is set to `autocheck autochk *`. This value causes Windows, at startup, to check the file-system integrity of the hard disks if the system has been shut down abnormally. Adversaries can add other programs or processes to this registry value which will automatically launch at boot.

Adversaries can use these configuration locations to execute malware, such as remote access tools, to maintain persistence through system reboots. Adversaries may also use [[T1036_Masquerading|Masquerading (T1036)]] to make the Registry entries look as if they are associated with legitimate programs.

#### Authentication Package - T1547.002
[more on T1547.002](https://attack.mitre.org/techniques/T1547/002)

Adversaries may abuse authentication packages to execute DLLs when the system boots. Windows authentication package DLLs are loaded by the Local Security Authority (LSA) process at system start. They provide support for multiple logon processes and multiple security protocols to the operating system. [1](https://msdn.microsoft.com/library/windows/desktop/aa374733.aspx)

Adversaries can use the autostart mechanism provided by LSA authentication packages for persistence by placing a reference to a binary in the Windows Registry location `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\` with the key value of `"Authentication Packages"=<target binary>`. The binary will then be executed by the system when the authentication packages are loaded.

#### Time Providers - T1547.003
[more on T1547.003](https://attack.mitre.org/techniques/T1547/003)

Adversaries may abuse time providers to execute DLLs when the system boots. The Windows Time service (W32Time) enables time synchronization across and within domains. [1](https://docs.microsoft.com/windows-server/networking/windows-time-service/windows-time-service-top) W32Time time providers are responsible for retrieving time stamps from hardware/network resources and outputting these values to other network clients. [2](https://msdn.microsoft.com/library/windows/desktop/ms725475.aspx)

Time providers are implemented as dynamic-link libraries (DLLs) that are registered in the subkeys of `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\W32Time\TimeProviders\`. [2](https://msdn.microsoft.com/library/windows/desktop/ms725475.aspx) The time provider manager, directed by the service control manager, loads and starts time providers listed and enabled under this key at system startup and/or whenever parameters are changed. [2](https://msdn.microsoft.com/library/windows/desktop/ms725475.aspx)

Adversaries may abuse this architecture to establish persistence, specifically by registering and enabling a malicious DLL as a time provider. Administrator privileges are required for time provider registration, though execution will run in context of the Local Service account. [3](https://github.com/scottlundgren/w32time)

#### Winlogon Helper DLL - T1547.004
[more on T1547.004](https://attack.mitre.org/techniques/T1547/004)

Adversaries may abuse features of Winlogon to execute DLLs and/or executables when a user logs in. Winlogon.exe is a Windows component responsible for actions at logon/logoff as well as the secure attention sequence (SAS) triggered by Ctrl-Alt-Delete. Registry entries in `HKLM\Software[\Wow6432Node\]\Microsoft\Windows NT\CurrentVersion\Winlogon\` and `HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\` are used to manage additional helper programs and functionalities that support Winlogon. [1](https://blog.cylance.com/windows-registry-persistence-part-2-the-run-keys-and-search-order)

Malicious modifications to these Registry keys may cause Winlogon to load and execute malicious DLLs and/or executables. Specifically, the following subkeys have been known to be possibly vulnerable to abuse: [1](https://blog.cylance.com/windows-registry-persistence-part-2-the-run-keys-and-search-order)

-   Winlogon\Notify - points to notification package DLLs that handle Winlogon events
-   Winlogon\Userinit - points to userinit.exe, the user initialization program executed when a user logs on
-   Winlogon\Shell - points to explorer.exe, the system shell executed when a user logs on

Adversaries may take advantage of these features to repeatedly execute malicious code and establish persistence.

#### Security Support Provider - T1547.005
[more on T1547.005](https://attack.mitre.org/techniques/T1547/005)

Adversaries may abuse security support providers (SSPs) to execute DLLs when the system boots. Windows SSP DLLs are loaded into the Local Security Authority (LSA) process at system start. Once loaded into the LSA, SSP DLLs have access to encrypted and plaintext passwords that are stored in Windows, such as any logged-on user's Domain password or smart card PINs.

The SSP configuration is stored in two Registry keys: `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\Security Packages` and `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\OSConfig\Security Packages`. An adversary may modify these Registry keys to add new SSPs, which will be loaded the next time the system boots, or when the AddSecurityPackage Windows API function is called.[1](http://docplayer.net/20839173-Analysis-of-malicious-security-support-provider-dlls.html)

#### Kernel Modules and Extensions - T1547.006
[more on T1547.006](https://attack.mitre.org/techniques/T1547/006)

Adversaries may modify the kernel to automatically execute programs on system boot. Loadable Kernel Modules (LKMs) are pieces of code that can be loaded and unloaded into the kernel upon demand. They extend the functionality of the kernel without the need to reboot the system. For example, one type of module is the device driver, which allows the kernel to access hardware connected to the system. [1](https://www.tldp.org/LDP/lkmpg/2.4/lkmpg.pdf) 

When used maliciously, LKMs can be a type of kernel-mode [[T1014_Rootkit|Rootkit (T1014)]] that run with the highest operating system privilege (Ring 0). [2](http://www.tldp.org/LDP/lkmpg/2.4/html/x437.html) Common features of LKM based rootkits include: hiding itself, selective hiding of files, processes and network activity, as well as log tampering, providing authenticated backdoors and enabling root access to non-privileged users. [3](http://www.megasecurity.org/papers/Rootkits.pdf)

Kernel extensions, also called kext, are used for macOS to load functionality onto a system similar to LKMs for Linux. They are loaded and unloaded through `kextload` and `kextunload` commands. Since macOS Catalina 10.15, kernel extensions have been deprecated on macOS systems.[4](https://developer.apple.com/support/kernel-extensions/)

Adversaries can use LKMs and kexts to covertly persist on a system and elevate privileges. Examples have been found in the wild and there are some open source projects. [5](https://volatility-labs.blogspot.com/2012/10/phalanx-2-revealed-using-volatility-to.html) [6](https://www.crowdstrike.com/blog/http-iframe-injecting-linux-rootkit/) [7](https://github.com/f0rb1dd3n/Reptile) [8](https://github.com/m0nad/Diamorphine)[9](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf) [10](https://www.synack.com/2017/09/08/high-sierras-secure-kernel-extension-loading-is-broken/)[11](https://securelist.com/the-ventir-trojan-assemble-your-macos-spy/67267/) [12](https://blog.trendmicro.com/trendlabs-security-intelligence/skidmap-linux-malware-uses-rootkit-capabilities-to-hide-cryptocurrency-mining-payload/)

#### Re-opened Applications - T1547.007
[more on T1547.007](https://attack.mitre.org/techniques/T1547/007)

Adversaries may modify plist files to automatically run an application when a user logs in. Starting in Mac OS X 10.7 (Lion), users can specify certain applications to be re-opened when a user logs into their machine after reboot. While this is usually done via a Graphical User Interface (GUI) on an app-by-app basis, there are property list files (plist) that contain this information as well located at `~/Library/Preferences/com.apple.loginwindow.plist` and `~/Library/Preferences/ByHost/com.apple.loginwindow.* .plist`.

An adversary can modify one of these files directly to include a link to their malicious executable to provide a persistence mechanism each time the user reboots their machine [1](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf).

#### LSASS Driver - T1547.008
[more on T1547.008](https://attack.mitre.org/techniques/T1547/008)

Adversaries may modify or add LSASS drivers to obtain persistence on compromised systems. The Windows security subsystem is a set of components that manage and enforce the security policy for a computer or domain. The Local Security Authority (LSA) is the main component responsible for local security policy and user authentication. The LSA includes multiple dynamic link libraries (DLLs) associated with various other security functions, all of which run in the context of the LSA Subsystem Service (LSASS) lsass.exe process. [1](https://technet.microsoft.com/library/cc961760.aspx)

Adversaries may target LSASS drivers to obtain persistence. By either replacing or adding illegitimate drivers (e.g., [[T1574_Hijack Execution Flow|Hijack Execution Flow (T1574)]]), an adversary can use LSA operations to continuously execute malicious payloads.

#### Shortcut Modification - T1547.009
[more on T1547.009](https://attack.mitre.org/techniques/T1547/009)

Adversaries may create or edit shortcuts to run a program during system boot or user login. Shortcuts or symbolic links are ways of referencing other files or programs that will be opened or executed when the shortcut is clicked or executed by a system startup process.

Adversaries could use shortcuts to execute their tools for persistence. They may create a new shortcut as a means of indirection that may use [[T1036_Masquerading|Masquerading (T1036)]] to look like a legitimate program. Adversaries could also edit the target path or entirely replace an existing shortcut so their tools will be executed instead of the intended legitimate program.

#### Port Monitors - T1547.010
[more on T1547.010](https://attack.mitre.org/techniques/T1547/010)

Adversaries may use port monitors to run an attacker supplied DLL during system boot for persistence or privilege escalation. A port monitor can be set through the `AddMonitor` API call to set a DLL to be loaded at startup. [1](http://msdn.microsoft.com/en-us/library/dd183341) This DLL can be located in `C:\Windows\System32` and will be loaded by the print spooler service, spoolsv.exe, on boot. The spoolsv.exe process also runs under SYSTEM level permissions. [2](https://www.defcon.org/images/defcon-22/dc-22-presentations/Bloxham/DEFCON-22-Brady-Bloxham-Windows-API-Abuse-UPDATED.pdf) Alternatively, an arbitrary DLL can be loaded if permissions allow writing a fully-qualified pathname for that DLL to `HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors`.

The Registry key contains entries for the following:

-   Local Port
-   Standard TCP/IP Port
-   USB Monitor
-   WSD Port

Adversaries can use this technique to load malicious code at startup that will persist on system reboot and execute as SYSTEM.

#### Plist Modification - T1547.011
[more on T1547.011](https://attack.mitre.org/techniques/T1547/011)

Adversaries can modify property list files (plist files) to execute their code as part of establishing persistence. Plist files are used by macOS applications to store properties and configuration settings for applications and services. Applications use information plist files, `Info.plist`, to tell the operating system how to handle the application at runtime using structured metadata in the form of keys and values. Plist files are formatted in XML and based on Apple's Core Foundation DTD and can be saved in text or binary format.[1](https://fileinfo.com/extension/plist)

Adversaries can modify paths to executed binaries, add command line arguments, and insert key/pair values to plist files in auto-run locations which execute upon user logon or system startup. Through modifying plist files in these locations, adversaries can also execute a malicious dynamic library (dylib) by adding a dictionary containing the `DYLD_INSERT_LIBRARIES` key combined with a path to a malicious dylib under the `EnvironmentVariables` key in a plist file. Upon user logon, the plist is called for execution and the malicious dylib is executed within the process space. Persistence can also be achieved by modifying the `LSEnvironment` key in the application's `Info.plist` file.[2](https://taomm.org/vol1/pdfs.html)

#### Print Processors - T1547.012
[more on T1547.012](https://attack.mitre.org/techniques/T1547/012)

Adversaries may abuse print processors to run malicious DLLs during system boot for persistence and/or privilege escalation. Print processors are DLLs that are loaded by the print spooler service, spoolsv.exe, during boot.

Adversaries may abuse the print spooler service by adding print processors that load malicious DLLs at startup. A print processor can be installed through the `AddPrintProcessor` API call with an account that has `SeLoadDriverPrivilege` enabled. Alternatively, a print processor can be registered to the print spooler service by adding the `HKLM\SYSTEM\[CurrentControlSet or ControlSet001]\Control\Print\Environments\[Windows architecture: e.g., Windows x64]\Print Processors\[user defined]\Driver` Registry key that points to the DLL. For the print processor to be correctly installed, it must be located in the system print-processor directory that can be found with the `GetPrintProcessorDirectory` API call.[1](https://docs.microsoft.com/en-us/windows/win32/printdocs/addprintprocessor) After the print processors are installed, the print spooler service, which starts during boot, must be restarted in order for them to run.[2](https://www.welivesecurity.com/2020/05/21/no-game-over-winnti-group/) The print spooler service runs under SYSTEM level permissions, therefore print processors installed by an adversary may run under elevated privileges.

#### XDG Autostart Entries - T1547.013
[more on T1547.013](https://attack.mitre.org/techniques/T1547/013)

Adversaries may modify XDG autostart entries to execute programs or commands during system boot. Linux desktop environments that are XDG compliant implement functionality for XDG autostart entries. These entries will allow an application to automatically start during the startup of a desktop environment after user logon. By default, XDG autostart entries are stored within the `/etc/xdg/autostart` or `~/.config/autostart` directories and have a .desktop file extension.[1](https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html)

Within an XDG autostart entry file, the `Type` key specifies if the entry is an application (type 1), link (type 2) or directory (type 3). The `Name` key indicates an arbitrary name assigned by the creator and the `Exec` key indicates the application and command line arguments to execute.[2](https://specifications.freedesktop.org/desktop-entry-spec/1.2/ar01s06.html)

Adversaries may use XDG autostart entries to maintain persistence by executing malicious commands and payloads, such as remote access tools, during the startup of a desktop environment. Commands included in XDG autostart entries with execute after user logon in the context of the currently logged on user. Adversaries may also use [[T1036_Masquerading|Masquerading (T1036)]] to make XDG autostart entries look as if they are associated with legitimate programs.

#### Active Setup - T1547.014
[more on T1547.014](https://attack.mitre.org/techniques/T1547/014)

Adversaries may achieve persistence by adding a Registry key to the Active Setup of the local machine. Active Setup is a Windows mechanism that is used to execute programs when a user logs in. The value stored in the Registry key will be executed after a user logs into the computer.[1](https://helgeklein.com/blog/2010/04/active-setup-explained/) These programs will be executed under the context of the user and will have the account's associated permissions level.

Adversaries may abuse Active Setup by creating a key under `HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\` and setting a malicious value for `StubPath`. This value will serve as the program that will be executed when a user logs into the computer.[2](https://digital-forensics.sans.org/summit-archives/2010/35-glyer-apt-persistence-mechanisms.pdf)[3](https://citizenlab.ca/2015/12/packrat-report/)[4](https://www.fireeye.com/blog/threat-research/2012/12/council-foreign-relations-water-hole-attack-details.html)[5](https://securelist.com/whos-really-spreading-through-the-bright-star/68978/)[6](https://unit42.paloaltonetworks.com/unit42-tropic-trooper-targets-taiwanese-government-and-fossil-fuel-provider-with-poison-ivy/)

Adversaries can abuse these components to execute malware, such as remote access tools, to maintain persistence through system reboots. Adversaries may also use [[T1036_Masquerading|Masquerading (T1036)]] to make the Registry entries look as if they are associated with legitimate programs.

#### Login Items - T1547.015
[more on T1547.015](https://attack.mitre.org/techniques/T1547/015)

Adversaries may add login items to execute upon user login to gain persistence or escalate privileges. Login items are applications, documents, folders, or server connections that are automatically launched when a user logs in.[1](https://support.apple.com/guide/mac-help/open-items-automatically-when-you-log-in-mh15189/mac) Login items can be added via a shared file list or Service Management Framework.[2](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLoginItems.html) Shared file list login items can be set using scripting languages such as [[T1059_Command and Scripting Interpreter#AppleScript - T1059 002|AppleScript (T1059.002)]], whereas the Service Management Framework uses the API call `SMLoginItemSetEnabled`.

Login items installed using the Service Management Framework leverage `launchd`, are not visible in the System Preferences, and can only be removed by the application that created them.[2](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLoginItems.html)[3](https://blog.timschroeder.net/2013/04/21/smloginitemsetenabled-demystified/) Login items created using a shared file list are visible in System Preferences, can hide the application when it launches, and are executed through LaunchServices, not launchd, to open applications, documents, or URLs without using Finder.[4](https://developer.apple.com/documentation/coreservices/launch_services) Users and applications use login items to configure their user environment to launch commonly used services or applications, such as email, chat, and music applications.

Adversaries can utilize [[T1059_Command and Scripting Interpreter#AppleScript - T1059 002|AppleScript (T1059.002)]] and [[T1106_Native API|Native API (T1106)]] calls to create a login item to spawn malicious executables.[5](https://eclecticlight.co/2018/05/22/running-at-startup-when-to-use-a-login-item-or-a-launchagent-launchdaemon/) Prior to version 10.5 on macOS, adversaries can add login items by using [[T1059_Command and Scripting Interpreter#AppleScript - T1059 002|AppleScript (T1059.002)]] to send an Apple events to the "System Events" process, which has an AppleScript dictionary for manipulating login items.[6](https://developer.apple.com/library/archive/samplecode/LoginItemsAE/Introduction/Intro.html#//apple_ref/doc/uid/DTS10003788) Adversaries can use a command such as `tell application "System Events" to make login item at end with properties /path/to/executable`.[7](https://eclecticlight.co/2021/09/16/how-to-run-an-app-or-tool-at-startup/)[8](http://www.hexed.in/2019/07/osxdok-analysis.html)[9](https://gist.github.com/kaloprominat/6111584) This command adds the path of the malicious executable to the login item file list located in `~/Library/Application Support/com.apple.backgroundtaskmanagementagent/backgrounditems.btm`.[7](https://eclecticlight.co/2021/09/16/how-to-run-an-app-or-tool-at-startup/) Adversaries can also use login items to launch executables that can be used to control the victim system remotely or as a means to gain privilege escalation by prompting for user credentials.[10](https://objective-see.com/blog/blog_0x25.html)[11](https://blog.checkpoint.com/2017/04/27/osx-malware-catching-wants-read-https-traffic/)[12](https://objective-see.com/blog/blog_0x44.html)

