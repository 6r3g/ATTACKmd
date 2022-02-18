Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1620  

# Reflective Code Loading - T1620
---
## Description
[xReflective Code Loading](https://attack.mitre.org/techniques/T1620)

Adversaries may reflectively load code into a process in order to conceal the execution of malicious payloads. Reflective loading involves allocating then executing payloads directly within the memory of the process, vice creating a thread or process backed by a file path on disk. Reflectively loaded payloads may be compiled binaries, anonymous files (only present in RAM), or just snubs of fileless executable code (ex: position-independent shellcode).[1](https://thewover.github.io/Introducing-Donut/)[2](https://www.sentinelone.com/blog/building-a-custom-tool-for-shellcode-analysis/)[3](https://magisterquis.github.io/2018/03/31/in-memory-only-elf-execution.html)[4](https://0x00sec.org/t/super-stealthy-droppers/3715)[5](https://www.mandiant.com/resources/bring-your-own-land-novel-red-teaming-technique)

Reflective code injection is very similar to [[T1055_Process Injection|Process Injection (T1055)]] except that the "injection" loads code into the processes’ own memory instead of that of a separate process. Reflective loading may evade process-based detections since the execution of the arbitrary code may be masked within a legitimate or otherwise benign process. Reflectively loading payloads directly into memory may also avoid creating files or other artifacts on disk, while also enabling malware to keep these payloads encrypted (or otherwise obfuscated) until execution.[3](https://magisterquis.github.io/2018/03/31/in-memory-only-elf-execution.html)[4](https://0x00sec.org/t/super-stealthy-droppers/3715)[6](https://www.intezer.com/blog/research/acbackdoor-analysis-of-a-new-multiplatform-backdoor/)[7](https://www.sentinelone.com/blog/teaching-an-old-rat-new-tricks/)

---
## Sub-Techniques

#### none
