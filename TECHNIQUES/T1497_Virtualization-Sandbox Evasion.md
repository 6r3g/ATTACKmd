Tactics: [[DEFENSE_EVASION]] - [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1497  

# Virtualization-Sandbox Evasion - T1497
---
## Description
[more on T1497](https://attack.mitre.org/techniques/T1497)

Adversaries may employ various means to detect and avoid virtualization and analysis environments. This may include changing behaviors based on the results of checks for the presence of artifacts indicative of a virtual machine environment (VME) or sandbox. If the adversary detects a VME, they may alter their malware to disengage from the victim or conceal the core functions of the implant. They may also search for VME artifacts before dropping secondary or additional payloads. Adversaries may use the information learned from [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]] during automated discovery to shape follow-on behaviors.[1](https://drive.google.com/file/d/1t0jn3xr4ff2fR30oQAUn_RsWSnMpOAQc)

Adversaries may use several methods to accomplish [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]] such as checking for security monitoring tools (e.g., Sysinternals, Wireshark, etc.) or other system artifacts associated with analysis or virtualization. Adversaries may also check for legitimate user activity to help determine if it is in an analysis environment. Additional methods include use of sleep timers or loops within malware code to avoid operating within a temporary sandbox.[2](https://unit42.paloaltonetworks.com/ups-observations-on-cve-2015-3113-prior-zero-days-and-the-pirpi-payload/)

---
## Sub-Techniques

#### System Checks - T1497.001
[more on T1497.001](https://attack.mitre.org/techniques/T1497/001)

Adversaries may employ various system checks to detect and avoid virtualization and analysis environments. This may include changing behaviors based on the results of checks for the presence of artifacts indicative of a virtual machine environment (VME) or sandbox. If the adversary detects a VME, they may alter their malware to disengage from the victim or conceal the core functions of the implant. They may also search for VME artifacts before dropping secondary or additional payloads. Adversaries may use the information learned from [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]] during automated discovery to shape follow-on behaviors.[1](https://drive.google.com/file/d/1t0jn3xr4ff2fR30oQAUn_RsWSnMpOAQc)

Specific checks will vary based on the target and/or adversary, but may involve behaviors such as [[T1047_Windows Management Instrumentation|Windows Management Instrumentation (T1047)]], [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]], [[T1082_System Information Discovery|System Information Discovery (T1082)]], and [[T1012_Query Registry|Query Registry (T1012)]] to obtain system information and search for VME artifacts. Adversaries may search for VME artifacts in memory, processes, file system, hardware, and/or the Registry. Adversaries may use scripting to automate these checks into one script and then have the program exit if it determines the system to be a virtual environment.

Checks could include generic system properties such as host/domain name and samples of network traffic. Adversaries may also check the network adapters addresses, CPU core count, and available memory/drive size.

Other common checks may enumerate services running that are unique to these applications, installed programs on the system, manufacturer/product fields for strings relating to virtual machine applications, and VME-specific hardware/processor instructions.[2](https://securingtomorrow.mcafee.com/other-blogs/mcafee-labs/stopping-malware-fake-virtual-machine/) In applications like VMWare, adversaries can also use a special I/O port to send commands and receive output.

Hardware checks, such as the presence of the fan, temperature, and audio devices, could also be used to gather evidence that can be indicative a virtual environment. Adversaries may also query for specific readings from these devices.[3](https://researchcenter.paloaltonetworks.com/2018/09/unit42-oilrig-targets-middle-eastern-government-adds-evasion-techniques-oopsie/)

#### User Activity Based Checks - T1497.002
[more on T1497.002](https://attack.mitre.org/techniques/T1497/002)

Adversaries may employ various user activity checks to detect and avoid virtualization and analysis environments. This may include changing behaviors based on the results of checks for the presence of artifacts indicative of a virtual machine environment (VME) or sandbox. If the adversary detects a VME, they may alter their malware to disengage from the victim or conceal the core functions of the implant. They may also search for VME artifacts before dropping secondary or additional payloads. Adversaries may use the information learned from [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]] during automated discovery to shape follow-on behaviors.[1](https://drive.google.com/file/d/1t0jn3xr4ff2fR30oQAUn_RsWSnMpOAQc)

Adversaries may search for user activity on the host based on variables such as the speed/frequency of mouse movements and clicks [2](https://www.sans.org/reading-room/whitepapers/forensics/detecting-malware-sandbox-evasion-techniques-36667) , browser history, cache, bookmarks, or number of files in common directories such as home or the desktop. Other methods may rely on specific user interaction with the system before the malicious code is activated, such as waiting for a document to close before activating a macro [3](https://unit42.paloaltonetworks.com/unit42-sofacy-continues-global-attacks-wheels-new-cannon-trojan/) or waiting for a user to double click on an embedded image to activate.[4](https://www.fireeye.com/blog/threat-research/2017/04/fin7-phishing-lnk.html)

#### Time Based Evasion - T1497.003
[more on T1497.003](https://attack.mitre.org/techniques/T1497/003)

Adversaries may employ various time-based methods to detect and avoid virtualization and analysis environments. This may include enumerating time-based properties, such as uptime or the system clock, as well as the use of timers or other triggers to avoid a virtual machine environment (VME) or sandbox, specifically those that are automated or only operate for a limited amount of time.

Adversaries may employ various time-based evasions, such as delaying malware functionality upon initial execution using programmatic sleep commands or native system scheduling functionality (ex: [[T1053_Scheduled Task-Job|Scheduled Task/Job (T1053)]]). Delays may also be based on waiting for specific victim conditions to be met (ex: system time, events, etc.) or employ scheduled [[T1104_Multi-Stage Channels|Multi-Stage Channels (T1104)]] to avoid analysis and scrutiny.[1](https://drive.google.com/file/d/1t0jn3xr4ff2fR30oQAUn_RsWSnMpOAQc)

Benign commands or other operations may also be used to delay malware execution. Loops or otherwise needless repetitions of commands, such as [Ping](https://attack.mitre.org/software/S0097)s, may be used to delay malware execution and potentially exceed time thresholds of automated analysis environments.[2](https://news.sophos.com/en-us/2021/07/04/independence-day-revil-uses-supply-chain-exploit-to-attack-hundreds-of-businesses/)[3](https://www.netskope.com/blog/nitol-botnet-makes-resurgence-evasive-sandbox-analysis-technique) Another variation, commonly referred to as API hammering, involves making various calls to [[T1106_Native API|Native API (T1106)]] functions in order to delay execution (while also potentially overloading analysis environments with junk data).[4](https://www.joesecurity.org/blog/3660886847485093803)[5](https://www.joesecurity.org/blog/498839998833561473)

Adversaries may also use time as a metric to detect sandboxes and analysis environments, particularly those that attempt to manipulate time mechanisms to simulate longer elapses of time. For example, an adversary may be able to identify a sandbox accelerating time by sampling and calculating the expected value for an environment's timestamp before and after execution of a sleep function.[6](https://www.isaca.org/resources/isaca-journal/issues/2017/volume-6/evasive-malware-tricks-how-malware-evades-detection-by-sandboxes)



