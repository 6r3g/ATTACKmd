Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1559  

# Inter-Process Communicaion - T1559
---
## Description
[more on T1559](https://attack.mitre.org/techniques/T1559)

Adversaries may abuse inter-process communication (IPC) mechanisms for local code or command execution. IPC is typically used by processes to share data, communicate with each other, or synchronize execution. IPC is also commonly used to avoid situations such as deadlocks, which occurs when processes are stuck in a cyclic waiting pattern.

Adversaries may abuse IPC to execute arbitrary code or commands. IPC mechanisms may differ depending on OS, but typically exists in a form accessible through programming languages/libraries or native interfaces such as Windows [[T1559_Inter-Process Communication#Dynamic Data Exchange - T1559 002|Dynamic Data Exchange (T1559.002)]] or [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]]. Higher level execution mediums, such as those of [[T1059_Command and Scripting Interpreter|Command and Scripting Interpreter (T1059)]]s, may also leverage underlying IPC mechanisms. Adversaries may also use [[T1021_Remote Services|Remote Services (T1021)]] such as [[T1021_Remote Services#Distributed Component Object Model - T1021 003|Distributed Component Object Model (T1021.003)]] to facilitate remote IPC execution.[1](https://www.fireeye.com/blog/threat-research/2019/06/hunting-com-objects.html)

---
## Sub-Techniques

#### Component Object Model - T1559.001
[more on T1559.001](https://attack.mitre.org/techniques/T1559/001)

Adversaries may use the Windows Component Object Model (COM) for local code execution. COM is an inter-process communication (IPC) component of the native Windows application programming interface (API) that enables interaction between software objects, or executable code that implements one or more interfaces.[1](https://www.fireeye.com/blog/threat-research/2019/06/hunting-com-objects.html) Through COM, a client object can call methods of server objects, which are typically binary Dynamic Link Libraries (DLL) or executables (EXE).[2](https://msdn.microsoft.com/library/windows/desktop/ms680573.aspx) Remote COM execution is facilitated by [[T1021_Remote Services|Remote Services (T1021)]] such as [[T1021_Remote Services#Distributed Component Object Model - T1021 003|Distributed Component Object Model (T1021.003)]] (DCOM).[1](https://www.fireeye.com/blog/threat-research/2019/06/hunting-com-objects.html)

Various COM interfaces are exposed that can be abused to invoke arbitrary execution via a variety of programming languages such as C, C++, Java, and [[T1059_Command and Scripting Interpreter#Visual Basic - T1059 005|Visual Basic (T1059.005)]].[2](https://msdn.microsoft.com/library/windows/desktop/ms680573.aspx) Specific COM objects also exist to directly perform functions beyond code execution, such as creating a [[T1053_Scheduled Task-Job|Scheduled Task/Job (T1053)]], fileless download/execution, and other adversary behaviors related to privilege escalation and persistence.[1](https://www.fireeye.com/blog/threat-research/2019/06/hunting-com-objects.html)[3](https://googleprojectzero.blogspot.com/2018/04/windows-exploitation-tricks-exploiting.html)

#### Dynamic Data Exchange - T1559.002
[more on T1559.002](https://attack.mitre.org/techniques/T1559/002)

Adversaries may use Windows Dynamic Data Exchange (DDE) to execute arbitrary commands. DDE is a client-server protocol for one-time and/or continuous inter-process communication (IPC) between applications. Once a link is established, applications can autonomously exchange transactions consisting of strings, warm data links (notifications when a data item changes), hot data links (duplications of changes to a data item), and requests for command execution.

Object Linking and Embedding (OLE), or the ability to link data between documents, was originally implemented through DDE. Despite being superseded by [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]], DDE may be enabled in Windows 10 and most of Microsoft Office 2016 via Registry keys. [1](https://www.bleepingcomputer.com/news/microsoft/microsoft-disables-dde-feature-in-word-to-prevent-further-malware-attacks/) [2](https://portal.msrc.microsoft.com/security-guidance/advisory/ADV170021) [3](https://technet.microsoft.com/library/security/4053440)

Microsoft Office documents can be poisoned with DDE commands [4](https://sensepost.com/blog/2016/powershell-c-sharp-and-dde-the-power-within/) [5](https://www.contextis.com/blog/comma-separated-vulnerabilities), directly or through embedded files [6](https://posts.specterops.io/reviving-dde-using-onenote-and-excel-for-code-execution-d7226864caee), and used to deliver execution via [[T1566_Phishing|Phishing (T1566)]] campaigns or hosted Web content, avoiding the use of Visual Basic for Applications (VBA) macros. [7](https://sensepost.com/blog/2017/macro-less-code-exec-in-msword/) DDE could also be leveraged by an adversary operating on a compromised machine who does not have direct access to a [[T1059_Command and Scripting Interpreter|Command and Scripting Interpreter (T1059)]]. DDE execution can be invoked remotely via [[T1021_Remote Services|Remote Services (T1021)]] such as [[T1021_Remote Services#Distributed Component Object Model - T1021 003|Distributed Component Object Model (T1021.003)]] (DCOM).[8](https://www.fireeye.com/blog/threat-research/2019/06/hunting-com-objects.html)

#### XPC Services - T1559.003
[more on T1559.003](https://attack.mitre.org/techniques/T1559/003)

Adversaries can provide malicious content to an XPC service daemon for local code execution. macOS uses XPC services for basic inter-process communication between various processes, such as between the XPC Service daemon and third-party application privileged helper tools. Applications can send messages to the XPC Service daemon, which runs as root, using the low-level XPC Service `C API` or the high level `NSXPCConnection API` in order to handle tasks that require elevated privileges (such as network connections). Applications are responsible for providing the protocol definition which serves as a blueprint of the XPC services. Developers typically use XPC Services to provide applications stability and privilege separation between the application client and the daemon. [1](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingXPCServices.html#//apple_ref/doc/uid/10000172i-SW6-SW1) [2](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/DesigningDaemons.html)

Adversaries can abuse XPC services to execute malicious content. Requests for malicious execution can be passed through the application's XPC Services handler. [3](https://www.trendmicro.com/en_us/research/21/f/CVE-2021-30724_CVMServer_Vulnerability_in_macOS_and_iOS.html) [4](https://wojciechregula.blog/post/learn-xpc-exploitation-part-3-code-injections/) This may also include identifying and abusing improper XPC client validation and/or poor sanitization of input parameters to conduct [[T1068_Exploitation for Privilege Escalation|Exploitation for Privilege Escalation]].

