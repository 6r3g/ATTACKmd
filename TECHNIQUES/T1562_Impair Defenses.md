Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1562  

# Impair Defenses - T1562
---
## Description
[more on T1562](https://attack.mitre.org/techniques/T1562)

Adversaries may maliciously modify components of a victim environment in order to hinder or disable defensive mechanisms. This not only involves impairing preventative defenses, such as firewalls and anti-virus, but also detection capabilities that defenders can use to audit activity and identify malicious behavior. This may also span both native defenses as well as supplemental capabilities installed by users and administrators.

Adversaries could also target event aggregation and analysis mechanisms, or otherwise disrupt these procedures by altering other system components.

---
## Sub-Techniques

#### Disable or Modify Tools - T1562.001
[more on T1562.001](https://attack.mitre.org/techniques/T1562/001)

Adversaries may modify and/or disable security tools to avoid possible detection of their malware/tools and activities. This may take the many forms, such as killing security software processes or services, modifying / deleting Registry keys or configuration files so that tools do not operate properly, or other methods to interfere with security tools scanning or reporting information.

Adversaries may also tamper with artifacts deployed and utilized by security tools. Security tools may make dynamic changes to system components in order to maintain visibility into specific events. For example, security products may load their own modules and/or modify those loaded by processes to facilitate data collection. Similar to [[T1562_Impair Defenses#Indicator Blocking - T1562 006|Indicator Blocking (T1562.006)]], adversaries may unhook or otherwise modify these features added by tools (especially those that exist in userland or are otherwise potentially accessible to adversaries) to avoid detection.[1](https://outflank.nl/blog/2019/06/19/red-team-tactics-combining-direct-system-calls-and-srdi-to-bypass-av-edr/)[2](https://www.mdsec.co.uk/2020/12/bypassing-user-mode-hooks-and-direct-invocation-of-system-calls-for-red-teams/)

#### Disable Windows Event Logging - T1562.002
[more on T1562.002](https://attack.mitre.org/techniques/T1562/002)

Adversaries may disable Windows event logging to limit data that can be leveraged for detections and audits. Windows event logs record user and system activity such as login attempts, process creation, and much more.[1](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/) This data is used by security tools and analysts to generate detections.

The EventLog service maintains event logs from various system components and applications.[2](https://www.coretechnologies.com/blog/windows-services/eventlog/) By default, the service automatically starts when a system powers on. An audit policy, maintained by the Local Security Policy (secpol.msc), defines which system events the EventLog service logs. Security audit policy settings can be changed by running secpol.msc, then navigating to `Security Settings\Local Policies\Audit Policy` for basic audit policy settings or `Security Settings\Advanced Audit Policy Configuration` for advanced audit policy settings.[3](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/audit-policy)[4](https://docs.microsoft.com/en-us/windows/security/threat-protection/auditing/advanced-security-audit-policy-settings) `auditpol.exe` may also be used to set audit policies.[5](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/auditpol)

Adversaries may target system-wide logging or just that of a particular application. For example, the EventLog service may be disabled using the following PowerShell line: `Stop-Service -Name EventLog`.[6](https://dmcxblue.gitbook.io/red-team-notes-2-0/red-team-techniques/defense-evasion/t1562-impair-defenses/disable-windows-event-logging) Additionally, adversaries may use `auditpol` and its sub-commands in a command prompt to disable auditing or clear the audit policy. To enable or disable a specified setting or audit category, adversaries may use the `/success` or `/failure` parameters. For example, `auditpol /set /category:"Account Logon" /success:disable /failure:disable` turns off auditing for the Account Logon category.[7](https://strontic.github.io/xcyclopedia/library/auditpol.exe-214E0EA1F7F7C27C82D23F183F9D23F1.html)[8](https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1562.002/T1562.002.md) To clear the audit policy, adversaries may run the following lines: `auditpol /clear /y` or `auditpol /remove /allusers`.[8](https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1562.002/T1562.002.md)

By disabling Windows event logging, adversaries can operate while leaving less evidence of a compromise behind.

#### Impair Command History Logging - T1562.003
[more on T1562.003](https://attack.mitre.org/techniques/T1562/003)

Adversaries may impair command history logging to hide commands they run on a compromised system. Various command interpreters keep track of the commands users type in their terminal so that users can retrace what they've done.

On Linux and macOS, command history is tracked in a file pointed to by the environment variable `HISTFILE`. When a user logs off a system, this information is flushed to a file in the user's home directory called `~/.bash_history`. The `HISTCONTROL` environment variable keeps track of what should be saved by the `history` command and eventually into the `~/.bash_history` file when a user logs out. `HISTCONTROL` does not exist by default on macOS, but can be set by the user and will be respected.

Adversaries may clear the history environment variable (`unset HISTFILE`) or set the command history size to zero (`export HISTFILESIZE=0`) to prevent logging of commands. Additionally, `HISTCONTROL` can be configured to ignore commands that start with a space by simply setting it to "ignorespace". `HISTCONTROL` can also be set to ignore duplicate commands by setting it to "ignoredups". In some Linux systems, this is set by default to "ignoreboth" which covers both of the previous examples. This means that " ls" will not be saved, but "ls" would be saved by history. Adversaries can abuse this to operate without leaving traces by simply prepending a space to all of their terminal commands.

On Windows systems, the `PSReadLine` module tracks commands used in all PowerShell sessions and writes them to a file (`$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt` by default). Adversaries may change where these logs are saved using `Set-PSReadLineOption -HistorySavePath {{File Path}}`. This will cause `ConsoleHost_history.txt` to stop receiving logs. Additionally, it is possible to turn off logging to this file using the PowerShell command `Set-PSReadlineOption -HistorySaveStyle SaveNothing`.[1](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_history?view=powershell-7)[2](https://community.sophos.com/products/intercept/early-access-program/f/live-discover-response-queries/121529/live-discover---powershell-command-audit)[3](https://community.sophos.com/products/malware/b/blog/posts/powershell-command-history-forensics)

#### Disable or Modify System Firewall - T1562.004
[more on T1562.004](https://attack.mitre.org/techniques/T1562/004)

Adversaries may disable or modify system firewalls in order to bypass controls limiting network usage. Changes could be disabling the entire mechanism as well as adding, deleting, or modifying particular rules. This can be done numerous ways depending on the operating system, including via command-line, editing Windows Registry keys, and Windows Control Panel.

Modifying or disabling a system firewall may enable adversary C2 communications, lateral movement, and/or data exfiltration that would otherwise not be allowed.

#### Indicator Blocking - T1562.006
[more on T1562.006](https://attack.mitre.org/techniques/T1562/006)

An adversary may attempt to block indicators or events typically captured by sensors from being gathered and analyzed. This could include maliciously redirecting [1](https://www.microsoft.com/en-us/wdsi/threats/malware-encyclopedia-description?name=Backdoor:Win32/Lamin.A) or even disabling host-based sensors, such as Event Tracing for Windows (ETW),[2](https://docs.microsoft.com/en-us/windows/desktop/etw/consuming-events) by tampering settings that control the collection and flow of event telemetry. [3](https://medium.com/palantir/tampering-with-windows-event-tracing-background-offense-and-defense-4be7ac62ac63) These settings may be stored on the system in configuration files and/or in the Registry as well as being accessible via administrative utilities such as [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] or [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]].

ETW interruption can be achieved multiple ways, however most directly by defining conditions using the [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] `Set-EtwTraceProvider` cmdlet or by interfacing directly with the Registry to make alterations.

In the case of network-based reporting of indicators, an adversary may block traffic associated with reporting to prevent central analysis. This may be accomplished by many means, such as stopping a local process responsible for forwarding telemetry and/or creating a host-based firewall rule to block traffic to specific hosts responsible for aggregating events, such as security information and event management (SIEM) products.

#### Disable or Modify Cloud Firewall - T1562.007
[more on T1562.007](https://attack.mitre.org/techniques/T1562/007)

Adversaries may disable or modify a firewall within a cloud environment to bypass controls that limit access to cloud resources. Cloud firewalls are separate from system firewalls that are described in [[T1562_Impair Defenses#Disable or Modify System Firewall - T1562 004|Disable or Modify System Firewall (T1562.004)]].

Cloud environments typically utilize restrictive security groups and firewall rules that only allow network activity from trusted IP addresses via expected ports and protocols. An adversary may introduce new firewall rules or policies to allow access into a victim cloud environment. For example, an adversary may use a script or utility that creates new ingress rules in existing security groups to allow any TCP/IP connectivity.[1](https://expel.io/blog/finding-evil-in-aws/)

Modifying or disabling a cloud firewall may enable adversary C2 communications, lateral movement, and/or data exfiltration that would otherwise not be allowed.

#### Disable Cloud Logs - T1562.008
[more on T1562.008](https://attack.mitre.org/techniques/T1562/008)

An adversary may disable cloud logging capabilities and integrations to limit what data is collected on their activities and avoid detection.

Cloud environments allow for collection and analysis of audit and application logs that provide insight into what activities a user does within the environment. If an attacker has sufficient permissions, they can disable logging to avoid detection of their activities. For example, in AWS an adversary may disable CloudWatch/CloudTrail integrations prior to conducting further malicious activity.[1](https://expel.io/blog/following-cloudtrail-generating-aws-security-signals-sumo-logic/)

#### Safe Mode Boot - T1562.009
[more on T1562.009](https://attack.mitre.org/techniques/T1562/009)

Adversaries may abuse Windows safe mode to disable endpoint defenses. Safe mode starts up the Windows operating system with a limited set of drivers and services. Third-party security software such as endpoint detection and response (EDR) tools may not start after booting Windows in safe mode. There are two versions of safe mode: Safe Mode and Safe Mode with Networking. It is possible to start additional services after a safe mode boot.[1](https://support.microsoft.com/en-us/windows/start-your-pc-in-safe-mode-in-windows-10-92c27cff-db89-8644-1ce4-b3e5e56fe234)[2](https://news.sophos.com/en-us/2019/12/09/snatch-ransomware-reboots-pcs-into-safe-mode-to-bypass-protection/)

Adversaries may abuse safe mode to disable endpoint defenses that may not start with a limited boot. Hosts can be forced into safe mode after the next reboot via modifications to Boot Configuration Data (BCD) stores, which are files that manage boot application settings.[3](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/bcdedit)

Adversaries may also add their malicious applications to the list of minimal services that start in safe mode by modifying relevant Registry values (i.e. [[T1112_Modify Registry|Modify Registry (T1112)]]). Malicious [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] (COM) objects may also be registered and loaded in safe mode.[2](https://news.sophos.com/en-us/2019/12/09/snatch-ransomware-reboots-pcs-into-safe-mode-to-bypass-protection/)[4](https://www.cyberark.com/resources/blog/cyberark-labs-from-safe-mode-to-domain-compromise)[5](https://www.cybereason.com/blog/medusalocker-ransomware)[6](https://www.bleepingcomputer.com/news/security/revil-ransomware-has-a-new-windows-safe-mode-encryption-mode/)

#### Downgrade Attack - T1562.010
[more on T1562.010](https://attack.mitre.org/techniques/T1562/010)

Adversaries may downgrade or use a version of system features that may be outdated, vulnerable, and/or does not support updated security controls such as logging. For example, [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] versions 5+ includes Script Block Logging (SBL) which can record executed script content. However, adversaries may attempt to execute a previous version of PowerShell that does not support SBL with the intent to [[T1562_Impair Defenses|Impair Defenses (T1562)]] while running malicious scripts that may have otherwise been detected.[1](https://www.crowdstrike.com/blog/how-falcon-complete-stopped-a-big-game-hunting-ransomware-attack/)[2](https://www.mandiant.com/resources/bring-your-own-land-novel-red-teaming-technique)

Adversaries may downgrade and use less-secure versions of various features of a system, such as [[T1059_Command and Scripting Interpreter|Command and Scripting Interpreter (T1059)]]s or even network protocols that can be abused to enable [[T1557_Adversary-in-the-Middle|Adversary-in-the-Middle (T1557)]].[3](https://www.praetorian.com/blog/man-in-the-middle-tls-ssl-protocol-downgrade-attack/)



