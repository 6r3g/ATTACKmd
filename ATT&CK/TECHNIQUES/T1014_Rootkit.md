Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1014  

# Rootkit - T1014
---
## Description
[more on T1014](https://attack.mitre.org/techniques/T1014)

Adversaries may use rootkits to hide the presence of programs, files, network connections, services, drivers, and other system components. Rootkits are programs that hide the existence of malware by intercepting/hooking and modifying operating system API calls that supply system information. [1](https://www.symantec.com/avcenter/reference/windows.rootkit.overview.pdf)

Rootkits or rootkit enabling functionality may reside at the user or kernel level in the operating system or lower, to include a hypervisor, Master Boot Record, or [[T1542_Pre-OS Boot#System Firmware - T1542 001|System Firmware (T1542.001)]]. [2](https://en.wikipedia.org/wiki/Rootkit) Rootkits have been seen for Windows, Linux, and Mac OS X systems. [3](https://www.crowdstrike.com/blog/http-iframe-injecting-linux-rootkit/) [4](http://www.blackhat.com/docs/asia-14/materials/Tsai/WP-Asia-14-Tsai-You-Cant-See-Me-A-Mac-OS-X-Rootkit-Uses-The-Tricks-You-Havent-Known-Yet.pdf)

---
## Sub-Techniques

#### none