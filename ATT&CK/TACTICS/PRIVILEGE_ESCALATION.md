Tactics: [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/tactics/TA0004 

# Privilege Escalation - TA0004
---
## Description
[more on Privilege Escalation](https://attack.mitre.org/tactics/TA0004)

**The adversary is trying to gain higher-level permissions.**

Privilege Escalation consists of techniques that adversaries use to gain higher-level permissions on a system or network. Adversaries can often enter and explore a network with unprivileged access but require elevated permissions to follow through on their objectives. Common approaches are to take advantage of system weaknesses, misconfigurations, and vulnerabilities. Examples of elevated access include:

-   SYSTEM/root level
-   local administrator
-   user account with admin-like access
-   user accounts with access to specific system or perform specific function

These techniques often overlap with Persistence techniques, as OS features that let an adversary persist can execute in an elevated context.

---
## Techniques

| 00  | Technique ( A to Z )                            |     |
| --- | :---------------------------------------------- | --- |
| 01  | [[T1548_Abuse Elevation Control Mechanism]]     |     |
| 02  | [[T1134_Access Token Manipulation]]             |     |
| 03  | [[T1547_Boot or Logon Autostart Execution]]     |     |
| 04  | [[T1037_Boot or Logon Initialization Scripts]]  |     |
| 05  | [[T1543_Create or Modify System Process]]       |     |
| 06  | [[T1484_Domain Policy Modification]]            |     |
| 07  | [[T1611_Escape to Host]]                        |     |
| 08  | [[T1546_Event Triggered Execution]]             |     |
| 09  | [[T1068_Exploitation for Privilege Escalation]] |     |
| 10  | [[T1574_Hijack Execution Flow]]                 |     |
| 11  | [[T1055_Process Injection]]                     |     |
| 12  | [[T1053_Scheduled Task-Job]]                    |     |
| 13  | [[T1078_Valid Accounts]]                        |     |
| 14  | [[T1098_Account Manipulation]]                  |     |



