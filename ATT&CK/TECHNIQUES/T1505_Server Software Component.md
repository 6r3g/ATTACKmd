Tactics: [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1505  

# Server Software Component - T1505
---
## Description
[more on T1505](https://attack.mitre.org/techniques/T1505)

Adversaries may abuse legitimate extensible development features of servers to establish persistent access to systems. Enterprise server applications may include features that allow developers to write and install software or scripts to extend the functionality of the main application. Adversaries may install malicious components to extend and abuse server applications.

---
## Sub-Techniques

#### SQL Stored Procedures - T1505.001
[more on T1505.001](https://attack.mitre.org/techniques/T1505/001)

Adversaries may abuse SQL stored procedures to establish persistent access to systems. SQL Stored Procedures are code that can be saved and reused so that database users do not waste time rewriting frequently used SQL queries. Stored procedures can be invoked via SQL statements to the database using the procedure name or via defined events (e.g. when a SQL server application is started/restarted).

Adversaries may craft malicious stored procedures that can provide a persistence mechanism in SQL database servers.[1](https://blog.netspi.com/sql-server-persistence-part-1-startup-stored-procedures/)[2](https://securelist.com/malicious-tasks-in-ms-sql-server/92167/) To execute operating system commands through SQL syntax the adversary may have to enable additional functionality, such as xp_cmdshell for MSSQL Server.[1](https://blog.netspi.com/sql-server-persistence-part-1-startup-stored-procedures/)[2](https://securelist.com/malicious-tasks-in-ms-sql-server/92167/)[3](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/xp-cmdshell-transact-sql?view=sql-server-2017)

Microsoft SQL Server can enable common language runtime (CLR) integration. With CLR integration enabled, application developers can write stored procedures using any .NET framework language (e.g. VB .NET, C#, etc.).[4](https://docs.microsoft.com/en-us/sql/relational-databases/clr-integration/common-language-runtime-integration-overview?view=sql-server-2017) Adversaries may craft or modify CLR assemblies that are linked to stored procedures since these CLR assemblies can be made to execute arbitrary commands.[5](https://blog.netspi.com/attacking-sql-server-clr-assemblies/)

#### Transport Agent - T1505.002
[more on T1505.002](https://attack.mitre.org/techniques/T1505/002)

Adversaries may abuse Microsoft transport agents to establish persistent access to systems. Microsoft Exchange transport agents can operate on email messages passing through the transport pipeline to perform various tasks such as filtering spam, filtering malicious attachments, journaling, or adding a corporate signature to the end of all outgoing emails.[1](https://docs.microsoft.com/en-us/exchange/transport-agents-exchange-2013-help)[2](https://www.welivesecurity.com/wp-content/uploads/2019/05/ESET-LightNeuron.pdf) Transport agents can be written by application developers and then compiled to .NET assemblies that are subsequently registered with the Exchange server. Transport agents will be invoked during a specified stage of email processing and carry out developer defined tasks.

Adversaries may register a malicious transport agent to provide a persistence mechanism in Exchange Server that can be triggered by adversary-specified email events.[2](https://www.welivesecurity.com/wp-content/uploads/2019/05/ESET-LightNeuron.pdf) Though a malicious transport agent may be invoked for all emails passing through the Exchange transport pipeline, the agent can be configured to only carry out specific tasks in response to adversary defined criteria. For example, the transport agent may only carry out an action like copying in-transit attachments and saving them for later exfiltration if the recipient email address matches an entry on a list provided by the adversary.

#### Web Shell - T1505.003
[more on T1505.003](https://attack.mitre.org/techniques/T1505/003)

Adversaries may backdoor web servers with web shells to establish persistent access to systems. A Web shell is a Web script that is placed on an openly accessible Web server to allow an adversary to use the Web server as a gateway into a network. A Web shell may provide a set of functions to execute or a command-line interface on the system that hosts the Web server.

In addition to a server-side script, a Web shell may have a client interface program that is used to talk to the Web server (ex: [China Chopper](https://attack.mitre.org/software/S0020) Web shell client).[1](https://www.fireeye.com/blog/threat-research/2013/08/breaking-down-the-china-chopper-web-shell-part-i.html)

#### IIS Components - T1505.004
[more on T1505.004](https://attack.mitre.org/techniques/T1505/004)

Adversaries may install malicious components that run on Internet Information Services (IIS) web servers to establish persistence. IIS provides several mechanisms to extend the functionality of the web servers. For example, Internet Server Application Programming Interface (ISAPI) extensions and filters can be installed to examine and/or modify incoming and outgoing IIS web requests. Extensions and filters are deployed as DLL files that export three functions: `Get{{Extension/Filter}}Version`, `Http{{Extension/Filter}}Proc`, and (optionally) `Terminate{{Extension/Filter}}`. IIS modules may also be installed to extend IIS web servers.[1](https://docs.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms525172(v=vs.90))[2](https://docs.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms524610(v=vs.90))[3](https://web.archive.org/web/20170106175935/http:/esec-lab.sogeti.com/posts/2011/02/02/iis-backdoor.html)[4](https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/the-curious-case-of-the-malicious-iis-module/)

Adversaries may install malicious ISAPI extensions and filters to observe and/or modify traffic, execute commands on compromised machines, or proxy command and control traffic. ISAPI extensions and filters may have access to all IIS web requests and responses. For example, an adversary may abuse these mechanisms to modify HTTP responses in order to distribute malicious commands/content to previously comprised hosts.[2](https://docs.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms524610(v=vs.90))[1](https://docs.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms525172(v=vs.90))[5](https://docs.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms525696(v=vs.90))[6](https://www.secureworks.com/research/threat-group-3390-targets-organizations-for-cyberespionage)[4](https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/the-curious-case-of-the-malicious-iis-module/)[7](https://web.archive.org/web/20140804175025/http:/blogs.technet.com/b/mmpc/archive/2012/10/03/malware-signed-with-the-adobe-code-signing-certificate.aspx)

Adversaries may also install malicious IIS modules to observe and/or modify traffic. IIS 7.0 introduced modules that provide the same unrestricted access to HTTP requests and responses as ISAPI extensions and filters. IIS modules can be written as a DLL that exports `RegisterModule`, or as a .NET application that interfaces with ASP.NET APIs to access IIS HTTP requests.[8](https://docs.microsoft.com/en-us/iis/get-started/introduction-to-iis/iis-modules-overview)[4](https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/the-curious-case-of-the-malicious-iis-module/)[9](https://i.blackhat.com/USA21/Wednesday-Handouts/us-21-Anatomy-Of-Native-Iis-Malware-wp.pdf)

#### Terminal Services DLL - T1505.005
[more on T1505.005](https://attack.mitre.org/techniques/T1505/005)

Adversaries may abuse components of Terminal Services to enable persistent access to systems. Microsoft Terminal Services, renamed to Remote Desktop Services in some Windows Server OSs as of 2022, enable remote terminal connections to hosts. Terminal Services allows servers to transmit a full, interactive, graphical user interface to clients via RDP. [1](https://docs.microsoft.com/windows/win32/termserv/about-terminal-services)

[[T1543_Create or Modify System Process#Windows Service - T1543.003|Windows Service]]s that are run as a "generic" process (ex: `svchost.exe`) load the service's DLL file, the location of which is stored in a Registry entry named `ServiceDll`. [2](https://social.technet.microsoft.com/wiki/contents/articles/12229.windows-system-services-fundamentals.aspx) The `termsrv.dll` file, typically stored in `%SystemRoot%\System32\`, is the default `ServiceDll` value for Terminal Services in `HKLM\System\CurrentControlSet\services\TermService\Parameters\`.

Adversaries may modify and/or replace the Terminal Services DLL to enable persistent access to victimized hosts. [3](https://twitter.com/james_inthe_box/status/1150495335812177920) Modifications to this DLL could be done to execute arbitrary payloads (while also potentially preserving normal `termsrv.dll` functionality) as well as to simply enable abusable features of Terminal Services. For example, an adversary may enable features such as concurrent [[T1021_Remote Services#Remote Desktop Protocol - T1021.001|Remote Desktop Protocol]] sessions by either patching the `termsrv.dll` file or modifying the `ServiceDll` value to point to a DLL that provides increased RDP functionality. [4](http://woshub.com/how-to-allow-multiple-rdp-sessions-in-windows-10/) [5](https://github.com/stascorp/rdpwrap) On a non-server Windows OS this increased functionality may also enable an adversary to avoid Terminal Services prompts that warn/log out users of a system when a new RDP session is created.

