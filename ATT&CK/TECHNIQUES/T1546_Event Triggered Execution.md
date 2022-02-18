Tactics: [[PERSISTENCE]] - [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/techniques/T1546  

# Event Triggered Execution - T1546
---
## Description
[more on T1546](https://attack.mitre.org/techniques/T1546)

Adversaries may establish persistence and/or elevate privileges using system mechanisms that trigger execution based on specific events. Various operating systems have means to monitor and subscribe to events such as logons or other user activity such as running specific applications/binaries.

Adversaries may abuse these mechanisms as a means of maintaining persistent access to a victim via repeatedly executing malicious code. After gaining access to a victim system, adversaries may create/modify event triggers to point to malicious content that will be executed whenever the event trigger is invoked.[1](https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/wp-windows-management-instrumentation.pdf)[2](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf)[3](https://researchcenter.paloaltonetworks.com/2017/04/unit42-new-iotlinux-malware-targets-dvrs-forms-botnet/)

Since the execution can be proxied by an account with higher permissions, such as SYSTEM or service accounts, an adversary may be able to abuse these triggered execution mechanisms to escalate their privileges.

---
## Sub-Techniques

#### Change Default File Association - T1546.001
[more on T1546.001](https://attack.mitre.org/techniques/T1546/001)

Adversaries may establish persistence by executing malicious content triggered by a file type association. When a file is opened, the default program used to open the file (also called the file association or handler) is checked. File association selections are stored in the Windows Registry and can be edited by users, administrators, or programs that have Registry access [1](https://support.microsoft.com/en-us/help/18539/windows-7-change-default-programs) [2](http://msdn.microsoft.com/en-us/library/bb166549.aspx) or by administrators using the built-in assoc utility. [3](https://docs.microsoft.com/windows-server/administration/windows-commands/assoc) Applications can modify the file association for a given file extension to call an arbitrary program when a file with the given extension is opened.

System file associations are listed under `HKEY_CLASSES_ROOT.[extension]`, for example `HKEY_CLASSES_ROOT.txt`. The entries point to a handler for that extension located at `HKEY_CLASSES_ROOT[handler]`. The various commands are then listed as subkeys underneath the shell key at `HKEY_CLASSES_ROOT[handler]\shell[action]\command`. For example: _`HKEY_CLASSES_ROOT\txtfile\shell\open\command`_ `HKEY_CLASSES_ROOT\txtfile\shell\print\command`* `HKEY_CLASSES_ROOT\txtfile\shell\printto\command`

The values of the keys listed are commands that are executed when the handler opens the file extension. Adversaries can modify these values to continually execute arbitrary commands. [4](https://www.trendmicro.com/vinfo/us/threat-encyclopedia/malware/troj_fakeav.gzd)

#### Screensaver - T1546.002
[more on T1546.002](https://attack.mitre.org/techniques/T1546/002)

Adversaries may establish persistence by executing malicious content triggered by user inactivity. Screensavers are programs that execute after a configurable time of user inactivity and consist of Portable Executable (PE) files with a .scr file extension.[1](https://en.wikipedia.org/wiki/Screensaver) The Windows screensaver application scrnsave.scr is located in `C:\Windows\System32\`, and `C:\Windows\sysWOW64\` on 64-bit Windows systems, along with screensavers included with base Windows installations.

The following screensaver settings are stored in the Registry (`HKCU\Control Panel\Desktop\`) and could be manipulated to achieve persistence:

-   `SCRNSAVE.exe` - set to malicious PE path
-   `ScreenSaveActive` - set to '1' to enable the screensaver
-   `ScreenSaverIsSecure` - set to '0' to not require a password to unlock
-   `ScreenSaveTimeout` - sets user inactivity timeout before screensaver is executed

Adversaries can use screensaver settings to maintain persistence by setting the screensaver to run malware after a certain timeframe of user inactivity. [2](https://www.welivesecurity.com/wp-content/uploads/2017/08/eset-gazer.pdf)

#### Windows Management Instrumentation Event Subscription - T1546.003
[more on T1546.003](https://attack.mitre.org/techniques/T1546/003)

Adversaries may establish persistence and elevate privileges by executing malicious content triggered by a Windows Management Instrumentation (WMI) event subscription. WMI can be used to install event filters, providers, consumers, and bindings that execute code when a defined event occurs. Examples of events that may be subscribed to are the wall clock time, user loging, or the computer's uptime. [1](https://www2.fireeye.com/rs/fireye/images/rpt-m-trends-2015.pdf)

Adversaries may use the capabilities of WMI to subscribe to an event and execute arbitrary code when that event occurs, providing persistence on a system. [2](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/sans-dfir-2015.pdf) [3](https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/wp-windows-management-instrumentation.pdf) Adversaries may also compile WMI scripts into Windows Management Object (MOF) files (.mof extension) that can be used to create a malicious subscription. [4](https://www.secureworks.com/blog/wmi-persistence) [5](https://docs.microsoft.com/en-us/windows/win32/wmisdk/managed-object-format--mof-)

WMI subscription execution is proxied by the WMI Provider Host process (WmiPrvSe.exe) and thus may result in elevated SYSTEM privileges.

#### Unix Shell Configuration Modification - T1546.004
[more on T1546.004](https://attack.mitre.org/techniques/T1546/004)

Adversaries may establish persistence through executing malicious commands triggered by a user’s shell. User [[T1059_Command and Scripting Interpreter#Unix Shell - T1059 004|Unix Shell (T1059.004)]]s execute several configuration scripts at different points throughout the session based on events. For example, when a user opens a command-line interface or remotely logs in (such as via SSH) a login shell is initiated. The login shell executes scripts from the system (`/etc`) and the user’s home directory (`~/`) to configure the environment. All login shells on a system use /etc/profile when initiated. These configuration scripts run at the permission level of their directory and are often used to set environment variables, create aliases, and customize the user’s environment. When the shell exits or terminates, additional shell scripts are executed to ensure the shell exits appropriately.

Adversaries may attempt to establish persistence by inserting commands into scripts automatically executed by shells. Using bash as an example, the default shell for most GNU/Linux systems, adversaries may add commands that launch malicious binaries into the `/etc/profile` and `/etc/profile.d` files.[1](https://www.intezer.com/blog/research/kaiji-new-chinese-linux-malware-turning-to-golang/)[2](https://bencane.com/2013/09/16/understanding-a-little-more-about-etcprofile-and-etcbashrc/) These files typically require root permissions to modify and are executed each time any shell on a system launches. For user level permissions, adversaries can insert malicious commands into `~/.bash_profile`, `~/.bash_login`, or `~/.profile` which are sourced when a user opens a command-line interface or connects remotely.[3](https://www.anomali.com/blog/illicit-cryptomining-threat-actor-rocke-changes-tactics-now-more-difficult-to-detect)[4](https://wiki.archlinux.org/index.php/Bash#Invocation) Since the system only executes the first existing file in the listed order, adversaries have used `~/.bash_profile` to ensure execution. Adversaries have also leveraged the `~/.bashrc` file which is additionally executed if the connection is established remotely or an additional interactive shell is opened, such as a new tab in the command-line interface.[5](https://unit42.paloaltonetworks.com/unit42-new-iotlinux-malware-targets-dvrs-forms-botnet/)[3](https://www.anomali.com/blog/illicit-cryptomining-threat-actor-rocke-changes-tactics-now-more-difficult-to-detect)[6](https://www.anomali.com/blog/pulling-linux-rabbit-rabbot-malware-out-of-a-hat)[7](https://blog.sucuri.net/2018/05/shell-logins-as-a-magento-reinfection-vector.html) Some malware targets the termination of a program to trigger execution, adversaries can use the `~/.bash_logout` file to execute malicious commands at the end of a session.

For macOS, the functionality of this technique is similar but may leverage zsh, the default shell for macOS 10.15+. When the Terminal.app is opened, the application launches a zsh login shell and a zsh interactive shell. The login shell configures the system environment using `/etc/profile`, `/etc/zshenv`, `/etc/zprofile`, and `/etc/zlogin`.[8](https://scriptingosx.com/2019/06/moving-to-zsh-part-2-configuration-files/)[9](https://posts.specterops.io/persistent-jxa-66e1c3cd1cf5)[10](https://github.com/D00MFist/PersistentJXA/blob/master/BashProfilePersist.js)[11](https://cedowens.medium.com/macos-ms-office-sandbox-brain-dump-4509b5fed49a) The login shell then configures the user environment with `~/.zprofile` and `~/.zlogin`. The interactive shell uses the `~/.zshrc` to configure the user environment. Upon exiting, `/etc/zlogout` and `~/.zlogout` are executed. For legacy programs, macOS executes `/etc/bashrc` on startup.

#### Trap - T1546.005
[more on T1546.005](https://attack.mitre.org/techniques/T1546/005)

Adversaries may establish persistence by executing malicious content triggered by an interrupt signal. The `trap` command allows programs and shells to specify commands that will be executed upon receiving interrupt signals. A common situation is a script allowing for graceful termination and handling of common keyboard interrupts like `ctrl+c` and `ctrl+d`.

Adversaries can use this to register code to be executed when the shell encounters specific interrupts as a persistence mechanism. Trap commands are of the following format `trap 'command list' signals` where "command list" will be executed when "signals" are received.[1](https://ss64.com/bash/trap.html)[2](https://bash.cyberciti.biz/guide/Trap_statement)

#### LC_LOAD_DYLIB Addition - T1546.006
[more on T1546.006](https://attack.mitre.org/techniques/T1546/006)

Adversaries may establish persistence by executing malicious content triggered by the execution of tainted binaries. Mach-O binaries have a series of headers that are used to perform certain operations when a binary is loaded. The LC_LOAD_DYLIB header in a Mach-O binary tells macOS and OS X which dynamic libraries (dylibs) to load during execution time. These can be added ad-hoc to the compiled binary as long as adjustments are made to the rest of the fields and dependencies. [1](https://www.blackhat.com/docs/us-15/materials/us-15-Wardle-Writing-Bad-A-Malware-For-OS-X.pdf) There are tools available to perform these changes.

Adversaries may modify Mach-O binary headers to load and execute malicious dylibs every time the binary is executed. Although any changes will invalidate digital signatures on binaries because the binary is being modified, this can be remediated by simply removing the LC_CODE_SIGNATURE command from the binary so that the signature isn’t checked at load time. [2](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf)

#### Netsh Helper DLL - T1546.007
[more on T1546.007](https://attack.mitre.org/techniques/T1546/007)

Adversaries may establish persistence by executing malicious content triggered by Netsh Helper DLLs. Netsh.exe (also referred to as Netshell) is a command-line scripting utility used to interact with the network configuration of a system. It contains functionality to add helper DLLs for extending functionality of the utility. [1](https://technet.microsoft.com/library/bb490939.aspx) The paths to registered netsh.exe helper DLLs are entered into the Windows Registry at `HKLM\SOFTWARE\Microsoft\Netsh`.

Adversaries can use netsh.exe helper DLLs to trigger execution of arbitrary code in a persistent manner. This execution would take place anytime netsh.exe is executed, which could happen automatically, with another persistence technique, or if other software (ex: VPN) is present on the system that executes netsh.exe as part of its normal functionality. [2](https://github.com/outflankbv/NetshHelperBeacon)[3](https://htmlpreview.github.io/?https://github.com/MatthewDemaske/blogbackup/blob/master/netshell.html)

#### Accessibilty Features - T1546.008
[more on T1546.008](https://attack.mitre.org/techniques/T1546/008)

Adversaries may establish persistence and/or elevate privileges by executing malicious content triggered by accessibility features. Windows contains accessibility features that may be launched with a key combination before a user has logged in (ex: when the user is on the Windows logon screen). An adversary can modify the way these programs are launched to get a command prompt or backdoor without logging in to the system.

Two common accessibility programs are `C:\Windows\System32\sethc.exe`, launched when the shift key is pressed five times and `C:\Windows\System32\utilman.exe`, launched when the Windows + U key combination is pressed. The sethc.exe program is often referred to as "sticky keys", and has been used by adversaries for unauthenticated access through a remote desktop login screen. [1](https://www.fireeye.com/blog/threat-research/2012/08/hikit-rootkit-advanced-persistent-attack-techniques-part-1.html)

Depending on the version of Windows, an adversary may take advantage of these features in different ways. Common methods used by adversaries include replacing accessibility feature binaries or pointers/references to these binaries in the Registry. In newer versions of Windows, the replaced binary needs to be digitally signed for x64 systems, the binary must reside in `%systemdir%\`, and it must be protected by Windows File or Resource Protection (WFP/WRP). [2](https://www.slideshare.net/DennisMaldonado5/sticky-keys-to-the-kingdom) The [[T1546_Event Triggered Execution#Image File Execution Options Injection - T1546 012|Image File Execution Options Injection (T1546.012)]] debugger method was likely discovered as a potential workaround because it does not require the corresponding accessibility feature binary to be replaced.

For simple binary replacement on Windows XP and later as well as and Windows Server 2003/R2 and later, for example, the program (e.g., `C:\Windows\System32\utilman.exe`) may be replaced with "cmd.exe" (or another program that provides backdoor access). Subsequently, pressing the appropriate key combination at the login screen while sitting at the keyboard or when connected over [[T1021_Remote Services#Remote Desktop Protocol - T1021 001|Remote Desktop Protocol (T1021.001)]] will cause the replaced file to be executed with SYSTEM privileges. [3](http://blog.crowdstrike.com/registry-analysis-with-crowdresponse/)

Other accessibility features exist that may also be leveraged in a similar fashion: [2](https://www.slideshare.net/DennisMaldonado5/sticky-keys-to-the-kingdom)[4](https://giuliocomi.blogspot.com/2019/10/abusing-windows-10-narrators-feedback.html)

-   On-Screen Keyboard: `C:\Windows\System32\osk.exe`
-   Magnifier: `C:\Windows\System32\Magnify.exe`
-   Narrator: `C:\Windows\System32\Narrator.exe`
-   Display Switcher: `C:\Windows\System32\DisplaySwitch.exe`
-   App Switcher: `C:\Windows\System32\AtBroker.exe`

#### AppCert DLLs - T1546.009
[more on T1546.009](https://attack.mitre.org/techniques/T1546/009)

Adversaries may establish persistence and/or elevate privileges by executing malicious content triggered by AppCert DLLs loaded into processes. Dynamic-link libraries (DLLs) that are specified in the `AppCertDLLs` Registry key under `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\` are loaded into every process that calls the ubiquitously used application programming interface (API) functions `CreateProcess`, `CreateProcessAsUser`, `CreateProcessWithLoginW`, `CreateProcessWithTokenW`, or `WinExec`. [1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

Similar to [[T1055_Process Injection|Process Injection (T1055)]], this value can be abused to obtain elevated privileges by causing a malicious DLL to be loaded and run in the context of separate processes on the computer. Malicious AppCert DLLs may also provide persistence by continuously being triggered by API activity.

#### AppInit DLLs - T1546.010
[more on T1546.010](https://attack.mitre.org/techniques/T1546/010)

Adversaries may establish persistence and/or elevate privileges by executing malicious content triggered by AppInit DLLs loaded into processes. Dynamic-link libraries (DLLs) that are specified in the `AppInit_DLLs` value in the Registry keys `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Windows` or `HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Windows` are loaded by user32.dll into every process that loads user32.dll. In practice this is nearly every program, since user32.dll is a very common library. [1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

Similar to Process Injection, these values can be abused to obtain elevated privileges by causing a malicious DLL to be loaded and run in the context of separate processes on the computer. [2](https://support.microsoft.com/en-us/kb/197571) Malicious AppInit DLLs may also provide persistence by continuously being triggered by API activity.

The AppInit DLL functionality is disabled in Windows 8 and later versions when secure boot is enabled. [3](https://msdn.microsoft.com/en-us/library/dn280412)

#### Application Shimming - T1546.011
[more on T1546.011](https://attack.mitre.org/techniques/T1546/011)

Adversaries may establish persistence and/or elevate privileges by executing malicious content triggered by application shims. The Microsoft Windows Application Compatibility Infrastructure/Framework (Application Shim) was created to allow for backward compatibility of software as the operating system codebase changes over time. For example, the application shimming feature allows developers to apply fixes to applications (without rewriting code) that were created for Windows XP so that it will work with Windows 10. [1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

Within the framework, shims are created to act as a buffer between the program (or more specifically, the Import Address Table) and the Windows OS. When a program is executed, the shim cache is referenced to determine if the program requires the use of the shim database (.sdb). If so, the shim database uses hooking to redirect the code as necessary in order to communicate with the OS.

A list of all shims currently installed by the default Windows installer (sdbinst.exe) is kept in:

-   `%WINDIR%\AppPatch\sysmain.sdb` and
-   `hklm\software\microsoft\windows nt\currentversion\appcompatflags\installedsdb`

Custom databases are stored in:

-   `%WINDIR%\AppPatch\custom & %WINDIR%\AppPatch\AppPatch64\Custom` and
-   `hklm\software\microsoft\windows nt\currentversion\appcompatflags\custom`

To keep shims secure, Windows designed them to run in user mode so they cannot modify the kernel and you must have administrator privileges to install a shim. However, certain shims can be used to [[T1548_Abuse Elevation Control Mechanism#Bypass User Account Control - T1548 002|Bypass User Account Control (T1548.002)]] (UAC and RedirectEXE), inject DLLs into processes (InjectDLL), disable Data Execution Prevention (DisableNX) and Structure Exception Handling (DisableSEH), and intercept memory addresses (GetProcAddress).

Utilizing these shims may allow an adversary to perform several malicious acts such as elevate privileges, install backdoors, disable defenses like Windows Defender, etc. [2](http://files.brucon.org/2015/Tomczak_and_Ballenthin_Shims_for_the_Win.pdf) Shims can also be abused to establish persistence by continuously being invoked by affected programs.

#### Image File Execution Options Injection - T1546.012
[more on T1546.012](https://attack.mitre.org/techniques/T1546/012)

Adversaries may establish persistence and/or elevate privileges by executing malicious content triggered by Image File Execution Options (IFEO) debuggers. IFEOs enable a developer to attach a debugger to an application. When a process is created, a debugger present in an application’s IFEO will be prepended to the application’s name, effectively launching the new process under the debugger (e.g., `C:\dbg\ntsd.exe -g notepad.exe`). [1](https://blogs.msdn.microsoft.com/mithuns/2010/03/24/image-file-execution-options-ifeo/)

IFEOs can be set directly via the Registry or in Global Flags via the GFlags tool. [2](https://docs.microsoft.com/windows-hardware/drivers/debugger/gflags-overview) IFEOs are represented as `Debugger` values in the Registry under `HKLM\SOFTWARE{{\Wow6432Node}}\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\` where `<executable>` is the binary on which the debugger is attached. [1](https://blogs.msdn.microsoft.com/mithuns/2010/03/24/image-file-execution-options-ifeo/)

IFEOs can also enable an arbitrary monitor program to be launched when a specified program silently exits (i.e. is prematurely terminated by itself or a second, non kernel-mode process). [3](https://docs.microsoft.com/windows-hardware/drivers/debugger/registry-entries-for-silent-process-exit) [4](https://oddvar.moe/2018/04/10/persistence-using-globalflags-in-image-file-execution-options-hidden-from-autoruns-exe/) Similar to debuggers, silent exit monitoring can be enabled through GFlags and/or by directly modifying IFEO and silent process exit Registry values in `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SilentProcessExit\`. [3](https://docs.microsoft.com/windows-hardware/drivers/debugger/registry-entries-for-silent-process-exit) [4](https://oddvar.moe/2018/04/10/persistence-using-globalflags-in-image-file-execution-options-hidden-from-autoruns-exe/)

Similar to [[T1546_Event Triggered Execution#Accessibility Features - T1546 008|Accessibility Features (T1546.008)]], on Windows Vista and later as well as Windows Server 2008 and later, a Registry key may be modified that configures "cmd.exe," or another program that provides backdoor access, as a "debugger" for an accessibility program (ex: utilman.exe). After the Registry is modified, pressing the appropriate key combination at the login screen while at the keyboard or when connected with [[T1021_Remote Services#Remote Desktop Protocol - T1021 001|Remote Desktop Protocol (T1021.001)]] will cause the "debugger" program to be executed with SYSTEM privileges. [5](http://blog.crowdstrike.com/registry-analysis-with-crowdresponse/)

Similar to [[T1055_Process Injection|Process Injection (T1055)]], these values may also be abused to obtain privilege escalation by causing a malicious executable to be loaded and run in the context of separate processes on the computer. [6](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process) Installing IFEO mechanisms may also provide Persistence via continuous triggered invocation.

Malware may also use IFEO to [[T1562_Impair Defenses|Impair Defenses (T1562)]] by registering invalid debuggers that redirect and effectively disable various system and security applications. [7](https://www.f-secure.com/v-descs/backdoor_w32_hupigon_emv.shtml) [8](https://www.symantec.com/security_response/writeup.jsp?docid=2008-062807-2501-99&tabid=2)

#### PowerShell Profile - T1546.013
[more on T1546.013](https://attack.mitre.org/techniques/T1546/013)

Adversaries may gain persistence and elevate privileges by executing malicious content triggered by PowerShell profiles. A PowerShell profile (`profile.ps1`) is a script that runs when [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] starts and can be used as a logon script to customize user environments.

[[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] supports several profiles depending on the user or host program. For example, there can be different profiles for [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] host programs such as the PowerShell console, PowerShell ISE or Visual Studio Code. An administrator can also configure a profile that applies to all users and host programs on the local computer. [1](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-6)

Adversaries may modify these profiles to include arbitrary commands, functions, modules, and/or [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] drives to gain persistence. Every time a user opens a [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] session the modified script will be executed unless the `-NoProfile` flag is used when it is launched. [2](https://www.welivesecurity.com/2019/05/29/turla-powershell-usage/)

An adversary may also be able to escalate privileges if a script in a PowerShell profile is loaded and executed by an account with higher privileges, such as a domain administrator. [3](https://witsendandshady.blogspot.com/2019/06/lab-notes-persistence-and-privilege.html)

#### Emond - T1546.014
[more on T1546.014](https://attack.mitre.org/techniques/T1546/014)

Adversaries may gain persistence and elevate privileges by executing malicious content triggered by the Event Monitor Daemon (emond). Emond is a [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]] that accepts events from various services, runs them through a simple rules engine, and takes action. The emond binary at `/sbin/emond` will load any rules from the `/etc/emond.d/rules/` directory and take action once an explicitly defined event takes place.

The rule files are in the plist format and define the name, event type, and action to take. Some examples of event types include system startup and user authentication. Examples of actions are to run a system command or send an email. The emond service will not launch if there is no file present in the QueueDirectories path `/private/var/db/emondClients`, specified in the [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]] configuration file at`/System/Library/LaunchDaemons/com.apple.emond.plist`.[1](https://www.xorrior.com/emond-persistence/)[2](http://www.magnusviri.com/Mac/what-is-emond.html)[3](https://www.sentinelone.com/blog/how-malware-persists-on-macos/)

Adversaries may abuse this service by writing a rule to execute commands when a defined event occurs, such as system start up or user authentication.[1](https://www.xorrior.com/emond-persistence/)[2](http://www.magnusviri.com/Mac/what-is-emond.html)[3](https://www.sentinelone.com/blog/how-malware-persists-on-macos/) Adversaries may also be able to escalate privileges from administrator to root as the emond service is executed with root privileges by the [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]] service.

#### Component Object Model Hijacking - T1546.015
[more on T1546.015](https://attack.mitre.org/techniques/T1546/015)

Adversaries may establish persistence by executing malicious content triggered by hijacked references to Component Object Model (COM) objects. COM is a system within Windows to enable interaction between software components through the operating system.[1](https://msdn.microsoft.com/library/ms694363.aspx) References to various COM objects are stored in the Registry.

Adversaries can use the COM system to insert malicious code that can be executed in place of legitimate software through hijacking the COM references and relationships as a means for persistence. Hijacking a COM object requires a change in the Registry to replace a reference to a legitimate system component which may cause that component to not work when executed. When that system component is executed through normal system operation the adversary's code will be executed instead.[2](https://blog.gdatasoftware.com/2014/10/23941-com-object-hijacking-the-discreet-way-of-persistence) An adversary is likely to hijack objects that are used frequently enough to maintain a consistent level of persistence, but are unlikely to break noticeable functionality within the system as to avoid system instability that could lead to detection.

