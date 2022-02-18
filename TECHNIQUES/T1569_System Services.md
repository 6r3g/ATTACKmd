Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1569  

# System Services - T1569
---
## Description
[more on T1569](https://attack.mitre.org/techniques/T1569)

Adversaries may abuse system services or daemons to execute commands or programs. Adversaries can execute malicious content by interacting with or creating services either locally or remotely. Many services are set to run at boot, which can aid in achieving persistence ([[T1543_Create or Modify System Process|Create or Modify System Process (T1543)]]) , but adversaries can also abuse services for one-time or temporary execution.

---
## Sub-Techniques

#### Launchctl - T1569.001
[more on T1569.001](https://attack.mitre.org/techniques/T1569/001)

Adversaries may abuse launchctl to execute commands or programs. Launchctl interfaces with launchd, the service management framework for macOS. Launchctl supports taking subcommands on the command-line, interactively, or even redirected from standard input.[1](https://ss64.com/osx/launchctl.html)

Adversaries use launchctl to execute commands and programs as [[T1543_Create or Modify System Process#Launch Agent - T1543 001|Launch Agent (T1543.001)]]s or [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]]s. Common subcommands include: `launchctl load`,`launchctl unload`, and `launchctl start`. Adversaries can use scripts or manually run the commands `launchctl load -w "%s/Library/LaunchAgents/%s"` or `/bin/launchctl load` to execute [[T1543_Create or Modify System Process#Launch Agent - T1543 001|Launch Agent (T1543.001)]]s or [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]]s.[2](https://researchcenter.paloaltonetworks.com/2016/09/unit42-sofacys-komplex-os-x-trojan/)[3](https://labs.sentinelone.com/20-common-tools-techniques-used-by-macos-threat-actors-malware/)

#### Service Execution - T1569.002
[more on T1569.002](https://attack.mitre.org/techniques/T1569/002)

Adversaries may abuse the Windows service control manager to execute malicious commands or payloads. The Windows service control manager (`services.exe`) is an interface to manage and manipulate services.[1](https://docs.microsoft.com/windows/win32/services/service-control-manager) The service control manager is accessible to users via GUI components as well as system utilities such as `sc.exe` and [Net](https://attack.mitre.org/software/S0039).

[PsExec](https://attack.mitre.org/software/S0029) can also be used to execute commands or payloads via a temporary Windows service created through the service control manager API.[2](https://technet.microsoft.com/en-us/sysinternals/bb897553.aspx) Tools such as [PsExec](https://attack.mitre.org/software/S0029) and `sc.exe` can accept remote servers as arguments and may be used to conduct remote execution.

Adversaries may leverage these mechanisms to execute malicious content. This can be done by either executing a new or modified service. This technique is the execution used in conjunction with [[T1543_Create or Modify System Process#Windows Service - T1543 003|Windows Service (T1543.003)]] during service persistence or privilege escalation.


