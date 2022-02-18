Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1124  

# System Time Discovery - T1124
---
## Description
[more on T1124](https://attack.mitre.org/techniques/T1124)

An adversary may gather the system time and/or time zone from a local or remote system. The system time is set and stored by the Windows Time Service within a domain to maintain time synchronization between systems and services in an enterprise network. [1](https://msdn.microsoft.com/ms724961.aspx) [2](https://technet.microsoft.com/windows-server-docs/identity/ad-ds/get-started/windows-time-service/windows-time-service-tools-and-settings)

System time information may be gathered in a number of ways, such as with [Net](https://attack.mitre.org/software/S0039) on Windows by performing `net time \hostname` to gather the system time on a remote system. The victim's time zone may also be inferred from the current system time or gathered by using `w32tm /tz`. [2](https://technet.microsoft.com/windows-server-docs/identity/ad-ds/get-started/windows-time-service/windows-time-service-tools-and-settings)

This information could be useful for performing other techniques, such as executing a file with a [[T1053_Scheduled Task-Job|Scheduled Task/Job (T1053)]] [3](https://www.rsaconference.com/writable/presentations/file_upload/ht-209_rivner_schwartz.pdf), or to discover locality information based on time zone to assist in victim targeting (i.e. [[T1614_System Location Discovery|System Location Discovery (T1614)]]). Adversaries may also use knowledge of system time as part of a time bomb, or delaying execution until a specified date/time.[4](https://any.run/cybersecurity-blog/time-bombs-malware-with-delayed-execution/)

---
## Sub-Techniques

#### none
