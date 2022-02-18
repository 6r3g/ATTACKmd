Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1202  

# Indirect Command Execution - T1202
---
## Description
[more on T1202](https://attack.mitre.org/techniques/T1202)

Adversaries may abuse utilities that allow for command execution to bypass security restrictions that limit the use of command-line interpreters. Various Windows utilities may be used to execute commands, possibly without invoking [cmd](https://attack.mitre.org/software/S0106). For example, [Forfiles](https://attack.mitre.org/software/S0193), the Program Compatibility Assistant (pcalua.exe), components of the Windows Subsystem for Linux (WSL), as well as other utilities may invoke the execution of programs and commands from a [[T1059_Command and Scripting Interpreter|Command and Scripting Interpreter (T1059)]] , Run window, or via scripts. [1](https://twitter.com/vector_sec/status/896049052642533376) [2](https://twitter.com/Evi1cg/status/935027922397573120)

Adversaries may abuse these features for [Defense Evasion](https://attack.mitre.org/tactics/TA0005), specifically to perform arbitrary execution while subverting detections and/or mitigation controls (such as Group Policy) that limit/prevent the usage of [cmd](https://attack.mitre.org/software/S0106) or file extensions more commonly associated with malicious payloads.

---
## Sub-Techniques

#### none
