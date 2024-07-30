Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1059 

# Command and Scripting Interpreter - T1059
---
## Description
[more on T1059](https://attack.mitre.org/techniques/T1059)

Adversaries may abuse command and script interpreters to execute commands, scripts, or binaries. These interfaces and languages provide ways of interacting with computer systems and are a common feature across many different platforms. Most systems come with some built-in command-line interface and scripting capabilities, for example, macOS and Linux distributions include some flavor of [[T1059_Command and Scripting Interpreter#Unix Shell - T1059 004|Unix Shell (T1059.004)]]  while Windows installations include the [[T1059_Command and Scripting Interpreter#Windows Command Shell - T1059 003|Windows Command Shell (T1059.003)]] and [[T1059_Command and Scripting Interpreter#Powershell - T1059 001|PowerShell (T1059.001)]] .

There are also cross-platform interpreters such as [[T1059_Command and Scripting Interpreter#Python - T1059 006|Python (T1059.006)]], as well as those commonly associated with client applications such as [[T1059_Command and Scripting Interpreter#JavaScript - T1059 007|JavaScript (T1059.007)]] and [[T1059_Command and Scripting Interpreter#Visual Basic - T1059 005|Visual Basic (T1059.005)]].

Adversaries may abuse these technologies in various ways as a means of executing arbitrary commands. Commands and scripts can be embedded in [Initial Access](https://attack.mitre.org/tactics/TA0001) payloads delivered to victims as lure documents or as secondary payloads downloaded from an existing C2. Adversaries may also execute commands through interactive terminals/shells, as well as utilize various [[T1021_Remote Services|Remote Services (T1021)]] in order to achieve remote Execution.[1](https://docs.microsoft.com/en-us/powershell/scripting/learn/remoting/running-remote-commands?view=powershell-7.1)[2](https://tools.cisco.com/security/center/resources/integrity_assurance.html#23)[3](https://www.thepythoncode.com/article/executing-bash-commands-remotely-in-python)

---
## Sub-Techniques

#### Powershell - T1059.001
[more on T1059.001](https://attack.mitre.org/techniques/T1059/001)

Adversaries may abuse PowerShell commands and scripts for execution. PowerShell is a powerful interactive command-line interface and scripting environment included in the Windows operating system. [1](https://technet.microsoft.com/en-us/scriptcenter/dd742419.aspx) Adversaries can use PowerShell to perform a number of actions, including discovery of information and execution of code. Examples include the `Start-Process` cmdlet which can be used to run an executable and the `Invoke-Command` cmdlet which runs a command locally or on a remote computer (though administrator permissions are required to use PowerShell to connect to remote systems).

PowerShell may also be used to download and run executables from the Internet, which can be executed from disk or in memory without touching disk.

A number of PowerShell-based offensive testing tools are available, including [Empire](https://attack.mitre.org/software/S0363), [PowerSploit](https://attack.mitre.org/software/S0194), [PoshC2](https://attack.mitre.org/software/S0378), and PSAttack.[2](https://github.com/jaredhaight/PSAttack)

PowerShell commands/scripts can also be executed without directly invoking the `powershell.exe` binary through interfaces to PowerShell's underlying `System.Management.Automation` assembly DLL exposed through the .NET framework and Windows Common Language Interface (CLI). [3](http://www.sixdub.net/?p=367)[4](https://silentbreaksecurity.com/powershell-jobs-without-powershell-exe/)[5](https://blogs.msdn.microsoft.com/kebab/2014/04/28/executing-powershell-scripts-from-c/)

#### AppleScript - T1059.002
[more on T1059.002](https://attack.mitre.org/techniques/T1059/002)

Adversaries may abuse AppleScript for execution. AppleScript is a macOS scripting language designed to control applications and parts of the OS via inter-application messages called AppleEvents.[1](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html) These AppleEvent messages can be sent independently or easily scripted with AppleScript. These events can locate open windows, send keystrokes, and interact with almost any open application locally or remotely.

Scripts can be run from the command-line via `osascript /path/to/script` or `osascript -e "script here"`. Aside from the command line, scripts can be executed in numerous ways including Mail rules, Calendar.app alarms, and Automator workflows. AppleScripts can also be executed as plain text shell scripts by adding `#!/usr/bin/osascript` to the start of the script file.[2](https://www.sentinelone.com/blog/how-offensive-actors-use-applescript-for-attacking-macos/)

AppleScripts do not need to call `osascript` to execute, however. They may be executed from within mach-O binaries by using the macOS [[T1106_Native API|Native API (T1106)]]s `NSAppleScript` or `OSAScript`, both of which execute code independent of the `/usr/bin/osascript` command line utility.

Adversaries may abuse AppleScript to execute various behaviors, such as interacting with an open SSH connection, moving to remote machines, and even presenting users with fake dialog boxes. These events cannot start applications remotely (they can start them locally), but they can interact with applications if they're already running remotely. On macOS 10.10 Yosemite and higher, AppleScript has the ability to execute [[T1106_Native API|Native API (T1106)]]s, which otherwise would require compilation and execution in a mach-O binary file format.[3](https://www.sentinelone.com/blog/macos-red-team-calling-apple-apis-without-building-binaries/). Since this is a scripting language, it can be used to launch more common techniques as well such as a reverse shell via [[T1059_Command and Scripting Interpreter#Python - T1059 006|Python (T1059.006)]].[4](https://www.mcafee.com/blogs/other-blogs/mcafee-labs/macro-malware-targets-macs/)

#### Windows Command Shell - T1059.003
[more on T1059.003](https://attack.mitre.org/techniques/T1059/003)

Adversaries may abuse the Windows command shell for execution. The Windows command shell ([cmd](https://attack.mitre.org/software/S0106)) is the primary command prompt on Windows systems. The Windows command prompt can be used to control almost any aspect of a system, with various permission levels required for different subsets of commands. The command prompt can be invoked remotely via [[T1021_Remote Services|Remote Services (T1021)]] such as [[T1021_Remote Services#SSH - T1021 004|SSH (T1021.004)]].[1](https://docs.microsoft.com/en-us/windows/terminal/tutorials/ssh)

Batch files (ex: .bat or .cmd) also provide the shell with a list of sequential commands to run, as well as normal scripting operations such as conditionals and loops. Common uses of batch files include long or repetitive tasks, or the need to run the same set of commands on multiple systems.

Adversaries may leverage [cmd](https://attack.mitre.org/software/S0106) to execute various commands and payloads. Common uses include [cmd](https://attack.mitre.org/software/S0106) to execute a single command, or abusing [cmd](https://attack.mitre.org/software/S0106) interactively with input and output forwarded over a command and control channel.

#### Unix Shell - T1059.004
[more on T1059.004](https://attack.mitre.org/techniques/T1059/004)

Adversaries may abuse Unix shell commands and scripts for execution. Unix shells are the primary command prompt on Linux and macOS systems, though many variations of the Unix shell exist (e.g. sh, bash, zsh, etc.) depending on the specific OS or distribution.[1](https://linux.die.net/man/1/bash)[2](https://support.apple.com/HT208050) Unix shells can control every aspect of a system, with certain commands requiring elevated privileges.

Unix shells also support scripts that enable sequential execution of commands as well as other typical programming operations such as conditionals and loops. Common uses of shell scripts include long or repetitive tasks, or the need to run the same set of commands on multiple systems.

Adversaries may abuse Unix shells to execute various commands or payloads. Interactive shells may be accessed through command and control channels or during lateral movement such as with [[T1021_Remote Services#SSH - T1021 004|SSH (T1021.004)]]. Adversaries may also leverage shell scripts to deliver and execute multiple commands on victims or as part of payloads used for persistence.

#### Visual Basic - T1059.005
[more on T1059.005](https://attack.mitre.org/techniques/T1059/005)

Adversaries may abuse Visual Basic (VB) for execution. VB is a programming language created by Microsoft with interoperability with many Windows technologies such as [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] and the [[T1106_Native API|Native API (T1106)]] through the Windows API. Although tagged as legacy with no planned future evolutions, VB is integrated and supported in the .NET Framework and cross-platform .NET Core.[1](https://devblogs.microsoft.com/vbteam/visual-basic-support-planned-for-net-5-0/)[2](https://docs.microsoft.com/dotnet/visual-basic/)

Derivative languages based on VB have also been created, such as Visual Basic for Applications (VBA) and VBScript. VBA is an event-driven programming language built into Microsoft Office, as well as several third-party applications.[3](https://docs.microsoft.com/office/vba/api/overview/)[4](https://en.wikipedia.org/wiki/Visual_Basic_for_Applications) VBA enables documents to contain macros used to automate the execution of tasks and other functionality on the host. VBScript is a default scripting language on Windows hosts and can also be used in place of [[T1059_Command and Scripting Interpreter#JavaScript - T1059 007|JavaScript (T1059.007)]] on HTML Application (HTA) webpages served to Internet Explorer (though most modern browsers do not come with VBScript support).[5](https://docs.microsoft.com/previous-versions//1kw29xwf(v=vs.85))

Adversaries may use VB payloads to execute malicious commands. Common malicious usage includes automating execution of behaviors with VBScript or embedding VBA content into [[T1566_Phishing#Spearphishing Attachment - T1566 001|Spearphishing Attachment (T1566.001)]] payloads.

#### Python - T1059.006
[more on T1059.006](https://attack.mitre.org/techniques/T1059/006)

Adversaries may abuse Python commands and scripts for execution. Python is a very popular scripting/programming language, with capabilities to perform many functions. Python can be executed interactively from the command-line (via the `python.exe` interpreter) or via scripts (.py) that can be written and distributed to different systems. Python code can also be compiled into binary executables.

Python comes with many built-in packages to interact with the underlying system, such as file operations and device I/O. Adversaries can use these libraries to download and execute commands or other scripts as well as perform various malicious behaviors.

#### JavaScript - T1059.007
[more on T1059.007](https://attack.mitre.org/techniques/T1059/007)

Adversaries may abuse various implementations of JavaScript for execution. JavaScript (JS) is a platform-independent scripting language (compiled just-in-time at runtime) commonly associated with scripts in webpages, though JS can be executed in runtime environments outside the browser.[1](https://nodejs.org/)

JScript is the Microsoft implementation of the same scripting standard. JScript is interpreted via the Windows Script engine and thus integrated with many components of Windows such as the [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] and Internet Explorer HTML Application (HTA) pages.[2](https://docs.microsoft.com/windows/win32/com/translating-to-jscript)[3](https://docs.microsoft.com/archive/blogs/gauravseth/the-world-of-jscript-javascript-ecmascript)[4](https://docs.microsoft.com/scripting/winscript/windows-script-interfaces)

JavaScript for Automation (JXA) is a macOS scripting language based on JavaScript, included as part of Apple’s Open Scripting Architecture (OSA), that was introduced in OSX 10.10. Apple’s OSA provides scripting capabilities to control applications, interface with the operating system, and bridge access into the rest of Apple’s internal APIs. As of OSX 10.10, OSA only supports two languages, JXA and [[T1059_Command and Scripting Interpreter#AppleScript - T1059 002|AppleScript (T1059.002)]]. Scripts can be executed via the command line utility `osascript`, they can be compiled into applications or script files via `osacompile`, and they can be compiled and executed in memory of other programs by leveraging the OSAKit Framework.[5](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/index.html)[6](https://posts.specterops.io/persistent-jxa-66e1c3cd1cf5)[7](https://www.sentinelone.com/blog/macos-red-team-calling-apple-apis-without-building-binaries/)[8](https://redcanary.com/blog/clipping-silver-sparrows-wings/)[9](https://www.mdsec.co.uk/2021/01/macos-post-exploitation-shenanigans-with-vscode-extensions/)

Adversaries may abuse various implementations of JavaScript to execute various behaviors. Common uses include hosting malicious scripts on websites as part of a [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]] or downloading and executing these script files as secondary payloads. Since these payloads are text-based, it is also very common for adversaries to obfuscate their content as part of [[T1027_Obfuscated Files or Information|Obfuscated Files or Information (T1027)]].

#### Network Device CLI - T1059.008
[more on T1059.008](https://attack.mitre.org/techniques/T1059/008)

Adversaries may abuse scripting or built-in command line interpreters (CLI) on network devices to execute malicious command and payloads. The CLI is the primary means through which users and administrators interact with the device in order to view system information, modify device operations, or perform diagnostic and administrative functions. CLIs typically contain various permission levels required for different commands.

Scripting interpreters automate tasks and extend functionality beyond the command set included in the network OS. The CLI and scripting interpreter are accessible through a direct console connection, or through remote means, such as telnet or [[T1021_Remote Services#SSH - T1021 004|SSH (T1021.004)]].

Adversaries can use the network CLI to change how network devices behave and operate. The CLI may be used to manipulate traffic flows to intercept or manipulate data, modify startup configuration parameters to load malicious system software, or to disable security features or logging to avoid detection. [1](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices)

#### Cloud API - T1059.009
[more on T1059.009](https://attack.mitre.org/techniques/T1059/009)

Adversaries may abuse cloud APIs to execute malicious commands. APIs available in cloud environments provide various functionalities and are a feature-rich method for programmatic access to nearly all aspects of a tenant. These APIs may be utilized through various methods such as command line interpreters (CLIs), in-browser Cloud Shells, [PowerShell](https://attack.mitre.org/techniques/T1059/001) modules like Azure for PowerShell [1](https://github.com/Azure/azure-powershell), or software developer kits (SDKs) available for languages such as [Python](https://attack.mitre.org/techniques/T1059/006).

Cloud API functionality may allow for administrative access across all major services in a tenant such as compute, storage, identity and access management (IAM), networking, and security policies.

With proper permissions (often via use of credentials such as [[T1528_Steal Application Access Token|Application Access Token]] and [[T1539_Steal Web Session Cookie|Web Session Cookie]] ), adversaries may abuse cloud APIs to invoke various functions that execute malicious actions. For example, CLI and PowerShell functionality may be accessed through binaries installed on cloud-hosted or on-premises hosts or accessed through a browser-based cloud shell offered by many cloud platforms (such as AWS, Azure, and GCP). These cloud shells are often a packaged unified environment to use CLI and/or scripting modules hosted as a container in the cloud environment.

#### AutoHotKey & AutoIT - T1059.010
[more on T1059.010](https://attack.mitre.org/techniques/T1059/010)

Adversaries may execute commands and perform malicious tasks using AutoIT and AutoHotKey automation scripts. AutoIT and AutoHotkey (AHK) are scripting languages that enable users to automate Windows tasks. These automation scripts can be used to perform a wide variety of actions, such as clicking on buttons, entering text, and opening and closing programs. [1](https://www.autoitscript.com/autoit3/docs/intro/running.htm) [2](https://www.autohotkey.com/docs/v1/Program.htm)

Adversaries may use AHK (`.ahk`) and AutoIT (`.au3`) scripts to execute malicious code on a victim's system. For example, adversaries have used for AHK to execute payloads and other modular malware such as keyloggers. Adversaries have also used custom AHK files containing embedded malware as [[T1566_Phishing|Phishing]] payloads. [3](https://www.splunk.com/en_us/blog/security/enter-the-gates-an-analysis-of-the-darkgate-autoit-loader.html)

These scripts may also be compiled into self-contained executable payloads (`.exe`). [1](https://www.autoitscript.com/autoit3/docs/intro/running.htm) [2](https://www.autohotkey.com/docs/v1/Program.htm)


