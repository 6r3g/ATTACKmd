Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1564  

# Hide Artifacts - T1564
---
## Description
[more on T1564](https://attack.mitre.org/techniques/T1564)

Adversaries may attempt to hide artifacts associated with their behaviors to evade detection. Operating systems may have features to hide various artifacts, such as important system files and administrative task execution, to avoid disrupting user work environments and prevent users from changing files or features on the system. Adversaries may abuse these features to hide artifacts such as files, directories, user accounts, or other system activity to evade detection.[1](https://researchcenter.paloaltonetworks.com/2016/09/unit42-sofacys-komplex-os-x-trojan/)[2](http://go.cybereason.com/rs/996-YZT-709/images/Cybereason-Lab-Analysis-OSX-Pirrit-4-6-16.pdf)[3](https://blog.malwarebytes.com/101/2015/07/introduction-to-alternate-data-streams/)

Adversaries may also attempt to hide artifacts associated with malicious behavior by creating computing regions that are isolated from common security instrumentation, such as through the use of virtualization technology.[4](https://news.sophos.com/en-us/2020/05/21/ragnar-locker-ransomware-deploys-virtual-machine-to-dodge-security/)

---
## Sub-Techniques

#### Hidden Files and Directories - T1564.001
[more on T1564.001](https://attack.mitre.org/techniques/T1564/001)

Adversaries may set files and directories to be hidden to evade detection mechanisms. To prevent normal users from accidentally changing special files on a system, most operating systems have the concept of a ‘hidden’ file. These files don’t show up when a user browses the file system with a GUI or when using normal commands on the command line. Users must explicitly ask to show the hidden files either via a series of Graphical User Interface (GUI) prompts or with command line switches (`dir /a` for Windows and `ls –a` for Linux and macOS).

On Linux and Mac, users can mark specific files as hidden simply by putting a "." as the first character in the file or folder name [1](https://researchcenter.paloaltonetworks.com/2016/09/unit42-sofacys-komplex-os-x-trojan/) [2](https://blog.malwarebytes.com/threat-analysis/2017/01/new-mac-backdoor-using-antiquated-code/). Files and folders that start with a period, ‘.’, are by default hidden from being viewed in the Finder application and standard command-line utilities like "ls". Users must specifically change settings to have these files viewable.

Files on macOS can also be marked with the UF_HIDDEN flag which prevents them from being seen in Finder.app, but still allows them to be seen in Terminal.app [3](https://www.paloaltonetworks.com/content/dam/pan/en_US/assets/pdf/reports/Unit_42/unit42-wirelurker.pdf). On Windows, users can mark specific files as hidden by using the attrib.exe binary. Many applications create these hidden files and folders to store information so that it doesn’t clutter up the user’s workspace. For example, SSH utilities create a .ssh folder that’s hidden and contains the user’s known hosts and keys.

Adversaries can use this to their advantage to hide files and folders anywhere on the system and evading a typical user or system analysis that does not incorporate investigation of hidden files.

#### Hidden Users - T1564.002
[more on T1564.002](https://attack.mitre.org/techniques/T1564/002)

Adversaries may use hidden users to mask the presence of user accounts they create or modify. Normal users may want to hide users when there are many users accounts on a given system or want to keep an account hidden from the other users on the system.

In macOS, every user account has a userID associated with it. When creating a user, you can specify the userID for that account. There is a property value in `/Library/Preferences/com.apple.loginwindow` called `Hide500Users` that prevents users with userIDs 500 and lower from appearing at the login screen. When using the [[T1136_Create Account|Create Account (T1136)]] technique with a userID under 500 (ex: `sudo dscl . -create /Users/username UniqueID 401`) and enabling this property (setting it to Yes), an adversary can conceal user accounts. [1](http://go.cybereason.com/rs/996-YZT-709/images/Cybereason-Lab-Analysis-OSX-Pirrit-4-6-16.pdf)

In Windows, adversaries may hide user accounts via settings in the Registry. For example, an adversary may add a value to the Windows Registry (via [Reg](https://attack.mitre.org/software/S0075) or other means) that will hide the user "test" from the Windows login screen: `reg.exe ADD 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccountsUserList' /v test /t REG_DWORD /d 0 /f`.[2](https://www.fireeye.com/blog/threat-research/2021/06/darkside-affiliate-supply-chain-software-compromise.html)[3](https://www.us-cert.gov/ncas/alerts/TA18-074A)

#### Hidden Window - T1564.003
[more on T1564.003](https://attack.mitre.org/techniques/T1564/003)

Adversaries may use hidden windows to conceal malicious activity from the plain sight of users. In some cases, windows that would typically be displayed when an application carries out an operation can be hidden. This may be utilized by system administrators to avoid disrupting user work environments when carrying out administrative tasks.

On Windows, there are a variety of features in scripting languages in Windows, such as [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]], Jscript, and [[T1059_Command and Scripting Interpreter#Visual Basic - T1059 005|Visual Basic (T1059.005)]] to make windows hidden. One example of this is `powershell.exe -WindowStyle Hidden`. [1](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/About/about_PowerShell_exe?view=powershell-5.1)

Similarly, on macOS the configurations for how applications run are listed in property list (plist) files. One of the tags in these files can be `apple.awt.UIElement`, which allows for Java applications to prevent the application's icon from appearing in the Dock. A common use for this is when applications run in the system tray, but don't also want to show up in the Dock.

Adversaries may abuse these functionalities to hide otherwise visible windows from users so as not to alert the user to adversary activity on the system.[2](https://blog.malwarebytes.com/threat-analysis/2017/01/new-mac-backdoor-using-antiquated-code/)

#### NTFS File Attributes - T1564.004
[more on T1564.004](https://attack.mitre.org/techniques/T1564/004)

Adversaries may use NTFS file attributes to hide their malicious data in order to evade detection. Every New Technology File System (NTFS) formatted partition contains a Master File Table (MFT) that maintains a record for every file/directory on the partition. [1](https://posts.specterops.io/host-based-threat-modeling-indicator-design-a9dbbb53d5ea) Within MFT entries are file attributes, [2](https://blogs.technet.microsoft.com/askcore/2010/08/25/ntfs-file-attributes/) such as Extended Attributes (EA) and Data [known as Alternate Data Streams (ADSs) when more than one Data attribute is present], that can be used to store arbitrary data (and even complete files). [1](https://posts.specterops.io/host-based-threat-modeling-indicator-design-a9dbbb53d5ea) [3](http://msdn.microsoft.com/en-us/library/aa364404) [4](https://blog.malwarebytes.com/101/2015/07/introduction-to-alternate-data-streams/) [5](https://blogs.technet.microsoft.com/askcore/2013/03/24/alternate-data-streams-in-ntfs/)

Adversaries may store malicious data or binaries in file attribute metadata instead of directly in files. This may be done to evade some defenses, such as static indicator scanning tools and anti-virus. [6](http://journeyintoir.blogspot.com/2012/12/extracting-zeroaccess-from-ntfs.html) [4](https://blog.malwarebytes.com/101/2015/07/introduction-to-alternate-data-streams/)

#### Hidden File System - T1564.005
[more on T1564.005](https://attack.mitre.org/techniques/T1564/005)

Adversaries may use a hidden file system to conceal malicious activity from users and security tools. File systems provide a structure to store and access data from physical storage. Typically, a user engages with a file system through applications that allow them to access files and directories, which are an abstraction from their physical location (ex: disk sector). Standard file systems include FAT, NTFS, ext4, and APFS. File systems can also contain other structures, such as the Volume Boot Record (VBR) and Master File Table (MFT) in NTFS.[1](https://www.malwaretech.com/2014/11/virtual-file-systems-for-beginners.html)

Adversaries may use their own abstracted file system, separate from the standard file system present on the infected system. In doing so, adversaries can hide the presence of malicious components and file input/output from security tools. Hidden file systems, sometimes referred to as virtual file systems, can be implemented in numerous ways. One implementation would be to store a file system in reserved disk space unused by disk structures or standard file system partitions.[1](https://www.malwaretech.com/2014/11/virtual-file-systems-for-beginners.html)[2](https://www.fireeye.com/blog/threat-research/2015/12/fin1-targets-boot-record.html) Another implementation could be for an adversary to drop their own portable partition image as a file on top of the standard file system.[3](https://www.welivesecurity.com/wp-content/uploads/2020/05/ESET_Turla_ComRAT.pdf) Adversaries may also fragment files across the existing file system structure in non-standard ways.[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/08064459/Equation_group_questions_and_answers.pdf)

#### Run Virtual Instance - T1564.006
[more on T1564.006](https://attack.mitre.org/techniques/T1564/006)

Adversaries may carry out malicious operations using a virtual instance to avoid detection. A wide variety of virtualization technologies exist that allow for the emulation of a computer or computing environment. By running malicious code inside of a virtual instance, adversaries can hide artifacts associated with their behavior from security tools that are unable to monitor activity inside the virtual instance. Additionally, depending on the virtual networking implementation (ex: bridged adapter), network traffic generated by the virtual instance can be difficult to trace back to the compromised host as the IP address and hostname might not match known values.[1](https://www.mci.gov.sg/-/media/mcicorp/doc/report-of-the-coi-into-the-cyber-attack-on-singhealth-10-jan-2019.ashx)

Adversaries may utilize native support for virtualization (ex: Hyper-V) or drop the necessary files to run a virtual instance (ex: VirtualBox binaries). After running a virtual instance, adversaries may create a shared folder between the guest and host with permissions that enable the virtual instance to interact with the host file system.[2](https://news.sophos.com/en-us/2020/05/21/ragnar-locker-ransomware-deploys-virtual-machine-to-dodge-security/)

#### VBA Stomping - T1564.007
[more on T1564.007](https://attack.mitre.org/techniques/T1564/007)

Adversaries may hide malicious Visual Basic for Applications (VBA) payloads embedded within MS Office documents by replacing the VBA source code with benign data.[1](https://www.fireeye.com/blog/threat-research/2020/01/stomp-2-dis-brilliance-in-the-visual-basics.html)

MS Office documents with embedded VBA content store source code inside of module streams. Each module stream has a `PerformanceCache` that stores a separate compiled version of the VBA source code known as p-code. The p-code is executed when the MS Office version specified in the `_VBA_PROJECT` stream (which contains the version-dependent description of the VBA project) matches the version of the host MS Office application.[2](https://outflank.nl/blog/2019/05/05/evil-clippy-ms-office-maldoc-assistant/)[3](https://docs.microsoft.com/en-us/openspecs/office_file_formats/ms-ovba/ef7087ac-3974-4452-aab2-7dba2214d239)

An adversary may hide malicious VBA code by overwriting the VBA source code location with zero’s, benign code, or random bytes while leaving the previously compiled malicious p-code. Tools that scan for malicious VBA source code may be bypassed as the unwanted code is hidden in the compiled p-code. If the VBA source code is removed, some tools might even think that there are no macros present. If there is a version match between the `_VBA_PROJECT` stream and host MS Office application, the p-code will be executed, otherwise the benign VBA source code will be decompressed and recompiled to p-code, thus removing malicious p-code and potentially bypassing dynamic analysis.[4](https://medium.com/walmartglobaltech/vba-stomping-advanced-maldoc-techniques-612c484ab278)[1](https://www.fireeye.com/blog/threat-research/2020/01/stomp-2-dis-brilliance-in-the-visual-basics.html)[5](https://github.com/bontchev/pcodedmp)

#### Email Hidding Rules - T1564.008
[more on T1564.008](https://attack.mitre.org/techniques/T1564/008)

Adversaries may use email rules to hide inbound emails in a compromised user's mailbox. Many email clients allow users to create inbox rules for various email functions, including moving emails to other folders, marking emails as read, or deleting emails. Rules may be created or modified within email clients or through external features such as the `New-InboxRule` or `Set-InboxRule` [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] cmdlets on Windows systems.[1](https://support.microsoft.com/en-us/office/manage-email-messages-by-using-rules-c24f5dea-9465-4df4-ad17-a50704d66c59)[2](https://support.apple.com/guide/mail/use-rules-to-manage-emails-you-receive-mlhlp1017/mac)[3](https://docs.microsoft.com/en-us/powershell/module/exchange/new-inboxrule?view=exchange-ps)[4](https://docs.microsoft.com/en-us/powershell/module/exchange/set-inboxrule?view=exchange-ps)

Adversaries may utilize email rules within a compromised user's mailbox to delete and/or move emails to less noticeable folders. Adversaries may do this to hide security alerts, C2 communication, or responses to [[T1534_Internal Spearphishing|Internal Spearphishing (T1534)]] emails sent from the compromised account.

Any user or administrator within the organization (or adversary with valid credentials) may be able to create rules to automatically move or delete emails. These rules can be abused to impair/delay detection had the email content been immediately seen by a user or defender. Malicious rules commonly filter out emails based on key words (such as `malware`, `suspicious`, `phish`, and `hack`) found in message bodies and subject lines. [5](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/rule-your-inbox-with-microsoft-cloud-app-security/ba-p/299154)

#### Resource Forking - T1564.009
[more on T1564.009](https://attack.mitre.org/techniques/T1564/009)

Adversaries may abuse resource forks to hide malicious code or executables to evade detection and bypass security applications. A resource fork provides applications a structured way to store resources such as thumbnail images, menu definitions, icons, dialog boxes, and code.[1](http://tenon.com/products/codebuilder/User_Guide/6_File_Systems.html#anchor520553) Usage of a resource fork is identifiable when displaying a file’s extended attributes, using `ls -l@` or `xattr -l` commands. Resource forks have been deprecated and replaced with the application bundle structure. Non-localized resources are placed at the top level directory of an application bundle, while localized resources are placed in the `/Resources` folder.[2](https://flylib.com/books/en/4.395.1.192/1/)[3](https://eclecticlight.co/2020/10/24/theres-more-to-files-than-data-extended-attributes/)

Adversaries can use resource forks to hide malicious data that may otherwise be stored directly in files. Adversaries can execute content with an attached resource fork, at a specified offset, that is moved to an executable location then invoked. Resource fork content may also be obfuscated/encrypted until execution.[4](https://www.sentinelone.com/labs/resourceful-macos-malware-hides-in-named-fork/)[5](https://blogs.vmware.com/security/2020/06/tau-threat-analysis-bundlore-macos-mm-install-macos.html)

#### Process Argument Spoofing - T1564.010
[more on T1564.010](https://attack.mitre.org/techniques/T1564/010)

Adversaries may attempt to hide process command-line arguments by overwriting process memory. Process command-line arguments are stored in the process environment block (PEB), a data structure used by Windows to store various information about/used by a process. The PEB includes the process command-line arguments that are referenced when executing the process. When a process is created, defensive tools/sensors that monitor process creations may retrieve the process arguments from the PEB. [1](https://docs.microsoft.com/en-us/windows/win32/api/winternl/ns-winternl-peb) [2](https://blog.xpnsec.com/how-to-argue-like-cobalt-strike/)

Adversaries may manipulate a process PEB to evade defenses. For example, [[T1055_Process Injection#Process Hollowing - T1055.012|Process Hollowing]] can be abused to spawn a process in a suspended state with benign arguments. After the process is spawned and the PEB is initialized (and process information is potentially logged by tools/sensors), adversaries may override the PEB to modify the command-line arguments (ex: using the [[T1106_Native API|Native API]] `WriteProcessMemory()` function) then resume process execution with malicious arguments. [3](https://blog.cobaltstrike.com/2019/01/02/cobalt-strike-3-13-why-do-we-argue/) [2](https://blog.xpnsec.com/how-to-argue-like-cobalt-strike/) [4](https://blog.nviso.eu/2020/02/04/the-return-of-the-spoof-part-2-command-line-spoofing/)

Adversaries may also execute a process with malicious command-line arguments then patch the memory with benign arguments that may bypass subsequent process memory analysis. [5](https://www.fireeye.com/blog/threat-research/2021/04/unc2447-sombrat-and-fivehands-ransomware-sophisticated-financial-threat.html)

This behavior may also be combined with other tricks (such as [[T1134_Access Token Manipulation#Parent PID Spoofing - T1134.004|Parent PID Spoofing]]) to manipulate or further evade process-based detections.

#### Ignore Process Interrupts - T1564.011
[more on T1564.011](https://attack.mitre.org/techniques/T1564/011)

Adversaries may evade defensive mechanisms by executing commands that hide from process interrupt signals. Many operating systems use signals to deliver messages to control process behavior. Command interpreters often include specific commands/flags that ignore errors and other hangups, such as when the user of the active session logs off. [1](https://man7.org/linux/man-pages/man7/signal.7.html) These interrupt signals may also be used by defensive tools and/or analysts to pause or terminate specified running processes.

Adversaries may invoke processes using `nohup`, [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]] `-ErrorAction SilentlyContinue`, or similar commands that may be immune to hangups. [2](https://linux.die.net/man/1/nohup) [3](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.3#debugpreference) This may enable malicious commands and malware to continue execution through system events that would otherwise terminate its execution, such as users logging off or the termination of its C2 network connection.

Hiding from process interrupt signals may allow malware to continue execution, but unlike [[T1546_Event Triggered Execution#Trap - T1546.005|Trap]] this does not establish [[PERSISTENCE|Persistence]] since the process will not be re-invoked once actually terminated.

#### File/Path Exclusions - T1564.012
[more on T1564.012](https://attack.mitre.org/techniques/T1564/012)

Adversaries may attempt to hide their file-based artifacts by writing them to specific folders or file names excluded from antivirus (AV) scanning and other defensive capabilities. AV and other file-based scanners often include exclusions to optimize performance as well as ease installation and legitimate use of applications. These exclusions may be contextual (e.g., scans are only initiated in response to specific triggering events/alerts), but are also often hardcoded strings referencing specific folders and/or files assumed to be trusted and legitimate. [1](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-contextual-file-folder-exclusions-microsoft-defender-antivirus)

Adversaries may abuse these exclusions to hide their file-based artifacts. For example, rather than tampering with tool settings to add a new exclusion (i.e., [[T1562_Impair Defenses#Disable or Modify Tools - T1562.001|Disable or Modify Tools]]), adversaries may drop their file-based payloads in default or otherwise well-known exclusions. Adversaries may also use [[T1518_Software Discovery#Security Software Discovery - T1518.001|Security Software Discovery]] and other [[DISCOVERY|Discovery]]/[[RECONNAISSANCE|Reconnaissance]] activities to both discover and verify existing exclusions in a victim environment.

