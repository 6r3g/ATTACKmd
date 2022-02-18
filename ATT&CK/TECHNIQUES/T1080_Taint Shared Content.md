Tactics: [[LATERAL_MOVEMENT]]
Tags: #mitre/attack/techniques/T1080  

# Taint Shared Content - T1080
---
## Description
[more on T1080](https://attack.mitre.org/techniques/T1080)

Adversaries may deliver payloads to remote systems by adding content to shared storage locations, such as network drives or internal code repositories. Content stored on network drives or in other shared locations may be tainted by adding malicious programs, scripts, or exploit code to otherwise valid files. Once a user opens the shared tainted content, the malicious portion can be executed to run the adversary's code on a remote system. Adversaries may use tainted shared content to move laterally.

A directory share pivot is a variation on this technique that uses several other techniques to propagate malware when users access a shared network directory. It uses [[T1547_Boot or Logon Autostart Execution#Shortcut Modification - T1547 009|Shortcut Modification (T1547.009)]] of directory .LNK files that use [[T1036_Masquerading|Masquerading (T1036)]] to look like the real directories, which are hidden through [[T1564_Hide Artifacts#Hidden Files and Directories - T1564 001|Hidden Files and Directories (T1564.001)]]. The malicious .LNK-based directories have an embedded command that executes the hidden malware file in the directory and then opens the real intended directory so that the user's expected action still occurs. When used with frequently used network directories, the technique may result in frequent reinfections and broad access to systems and potentially to new and higher privileged accounts. [1](https://rewtin.blogspot.ch/2017/11/abusing-user-shares-for-efficient.html)

Adversaries may also compromise shared network directories through binary infections by appending or prepending its code to the healthy binary on the shared network directory. The malware may modify the original entry point (OEP) of the healthy binary to ensure that it is executed before the legitimate code. The infection could continue to spread via the newly infected file when it is executed by a remote system. These infections may target both binary and non-binary formats that end with extensions including, but not limited to, .EXE, .DLL, .SCR, .BAT, and/or .VBS.

---
## Sub-Techniques

#### none
