Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1652

# Device Driver Discovery - T1652
---
## Description
[more on T1652](https://attack.mitre.org/techniques/T1652)

Adversaries may attempt to enumerate local device drivers on a victim host. Information about device drivers may highlight various insights that shape follow-on behaviors, such as the function/purpose of the host, present security tools (i.e. [[T1518_Software Discovery#Security Software Discovery - T1518.001|Security Software Discovery]]) or other defenses (e.g., [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion]]), as well as potential exploitable vulnerabilities (e.g., [[T1068_Exploitation for Privilege Escalation|Exploitation for Privilege Escalation]]).

Many OS utilities may provide information about local device drivers, such as `driverquery.exe` and the `EnumDeviceDrivers()` API function on Windows. [1](https://learn.microsoft.com/windows-server/administration/windows-commands/driverquery) [2](https://learn.microsoft.com/windows/win32/api/psapi/nf-psapi-enumdevicedrivers) Information about device drivers (as well as associated services, i.e., [[T1007_System Service Discovery|System Service Discovery]]) may also be available in the Registry. [3](https://learn.microsoft.com/windows-hardware/drivers/install/overview-of-registry-trees-and-keys)

On Linux/macOS, device drivers (in the form of kernel modules) may be visible within `/dev` or using utilities such as `lsmod` and `modinfo`. [4](https://www.tldp.org/LDP/lkmpg/2.4/lkmpg.pdf) [5](https://man7.org/linux/man-pages/man8/lsmod.8.html) [6](https://linux.die.net/man/8/modinfo)

