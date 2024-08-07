Tactics: [[DEFENSE_EVASION]] - [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1622

# Debugger Evasion - T1622
---
## Description
[more on T1622](https://attack.mitre.org/techniques/T1622)

Adversaries may employ various means to detect and avoid debuggers. Debuggers are typically used by defenders to trace and/or analyze the execution of potential malware payloads. [1](https://github.com/processhacker/processhacker)

Debugger evasion may include changing behaviors based on the results of the checks for the presence of artifacts indicative of a debugged environment. Similar to [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion]], if the adversary detects a debugger, they may alter their malware to disengage from the victim or conceal the core functions of the implant. They may also search for debugger artifacts before dropping secondary or additional payloads.

Specific checks will vary based on the target and/or adversary, but may involve [[T1106_Native API|Native API]] function calls such as `IsDebuggerPresent()` and `NtQueryInformationProcess()`, or manually checking the `BeingDebugged` flag of the Process Environment Block (PEB). Other checks for debugging artifacts may also seek to enumerate hardware breakpoints, interrupt assembly opcodes, time checks, or measurements if exceptions are raised in the current process (assuming a present debugger would "swallow" or handle the potential error). [2](https://github.com/hasherezade/malware_training_vol1/blob/main/slides/module3/Module3_2_fingerprinting.pdf) [3](https://github.com/LordNoteworthy/al-khaser/tree/master/al-khaser/AntiDebug) [4](https://github.com/vxunderground/VX-API/tree/main/Anti%20Debug)

Adversaries may use the information learned from these debugger checks during automated discovery to shape follow-on behaviors. Debuggers can also be evaded by detaching the process or flooding debug logs with meaningless data via messages produced by looping [[T1106_Native API|Native API]] function calls such as `OutputDebugStringW()`. [5](https://objective-see.com/blog/blog_0x60.html) [6](https://research.checkpoint.com/2021/stopping-serial-killer-catching-the-next-strike/)

