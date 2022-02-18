Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1529  

# System Shutdown-Reboot - T1529
---
## Description
[more on T1529](https://attack.mitre.org/techniques/T1529)

Adversaries may shutdown/reboot systems to interrupt access to, or aid in the destruction of, those systems. Operating systems may contain commands to initiate a shutdown/reboot of a machine. In some cases, these commands may also be used to initiate a shutdown/reboot of a remote computer.[1](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/shutdown) Shutting down or rebooting systems may disrupt access to computer resources for legitimate users.

Adversaries may attempt to shutdown/reboot a system after impacting it in other ways, such as [[T1561_Disk Wipe#Disk Structure Wipe - T1561 002|Disk Structure Wipe (T1561.002)]] or [[T1490_Inhibit System Recovery|Inhibit System Recovery (T1490)]], to hasten the intended effects on system availability.[2](https://blog.talosintelligence.com/2017/06/worldwide-ransomware-variant.html)[3](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html)

---
## Sub-Techniques

#### none
