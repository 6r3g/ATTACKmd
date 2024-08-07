Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1654

# Log Enumeration - T1654
---
## Description
[more on T1654](https://attack.mitre.org/techniques/T1654)

Adversaries may enumerate system and service logs to find useful data. These logs may highlight various types of valuable insights for an adversary, such as user authentication records ([[T1087_Account Discovery|Account Discovery]]), security or vulnerable software ([[T1518_Software Discovery|Software Discovery]]), or hosts within a compromised network ([[T1018_Remote System Discovery|Remote System Discovery]]).

Host binaries may be leveraged to collect system logs. Examples include using `wevtutil.exe` or [[T1059_Command and Scripting Interpreter#Powershell - T1059.001|PowerShell]] on Windows to access and/or export security event information. [1](https://labs.withsecure.com/content/dam/labs/docs/WithSecure-Lazarus-No-Pineapple-Threat-Intelligence-Report-2023.pdf) [2](https://www.microsoft.com/en-us/security/blog/2023/06/14/cadet-blizzard-emerges-as-a-novel-and-distinct-russian-threat-actor/) In cloud environments, adversaries may leverage utilities such as the Azure VM Agent’s `CollectGuestLogs.exe` to collect security logs from cloud hosted infrastructure. [3](https://www.mandiant.com/resources/blog/sim-swapping-abuse-azure-serial)

Adversaries may also target centralized logging infrastructure such as SIEMs. Logs may also be bulk exported and sent to adversary-controlled infrastructure for offline analysis.