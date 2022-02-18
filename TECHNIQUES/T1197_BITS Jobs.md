Tactics: [[PERSISTENCE]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1197  

# BITS Jobs - T1197
---
## Description
[more on T1197](https://attack.mitre.org/techniques/T1197)

Adversaries may abuse BITS jobs to persistently execute or clean up after malicious payloads. Windows Background Intelligent Transfer Service (BITS) is a low-bandwidth, asynchronous file transfer mechanism exposed through [[T1559_Inter-Process Communication#Component Object Model - T1559 001|Component Object Model (T1559.001)]] (COM).[1](https://msdn.microsoft.com/library/windows/desktop/ms680573.aspx)[2](https://msdn.microsoft.com/library/windows/desktop/bb968799.aspx) BITS is commonly used by updaters, messengers, and other applications preferred to operate in the background (using available idle bandwidth) without interrupting other networked applications. File transfer tasks are implemented as BITS jobs, which contain a queue of one or more file operations.

The interface to create and manage BITS jobs is accessible through [[T1059_Command and Scripting Interpreter#PowerShell - T1059 001|PowerShell (T1059.001)]] and the [BITSAdmin](https://attack.mitre.org/software/S0190) tool.[2](https://msdn.microsoft.com/library/windows/desktop/bb968799.aspx)[3](https://msdn.microsoft.com/library/aa362813.aspx)

Adversaries may abuse BITS to download, execute, and even clean up after running malicious code. BITS tasks are self-contained in the BITS job database, without new files or registry modifications, and often permitted by host firewalls.[4](https://www.secureworks.com/blog/malware-lingers-with-bits)[5](https://arstechnica.com/information-technology/2007/05/malware-piggybacks-on-windows-background-intelligent-transfer-service/)[6](https://www.symantec.com/connect/blogs/malware-update-windows-update) BITS enabled execution may also enable persistence by creating long-standing jobs (the default maximum lifetime is 90 days and extendable) or invoking an arbitrary program when a job completes or errors (including after system reboots).[7](https://researchcenter.paloaltonetworks.com/2017/11/unit42-uboatrat-navigates-east-asia/)[4](https://www.secureworks.com/blog/malware-lingers-with-bits)

BITS upload functionalities can also be used to perform [[T1048_Exfiltration Over Alternative Protocol|Exfiltration Over Alternative Protocol (T1048)]].[4](https://www.secureworks.com/blog/malware-lingers-with-bits)

---
## Sub-Techniques

#### none