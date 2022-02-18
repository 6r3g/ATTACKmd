Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1614  

# System Location Discovery - T1614
---
## Description
[more on T1614](https://attack.mitre.org/techniques/T1614)

Adversaries may gather information in an attempt to calculate the geographical location of a victim host. Adversaries may use the information from [[T1614_System Location Discovery|System Location Discovery (T1614)]] during automated discovery to shape follow-on behaviors, including whether or not the adversary fully infects the target and/or attempts specific actions.

Adversaries may attempt to infer the location of a system using various system checks, such as time zone, keyboard layout, and/or language settings.[1](https://assets.documentcloud.org/documents/20413525/fbi-flash-indicators-of-compromise-ragnar-locker-ransomware-11192020-bc.pdf)[2](https://news.sophos.com/en-us/2016/05/03/location-based-ransomware-threat-research/)[3](https://www.bleepingcomputer.com/news/security/new-rat-malware-gets-commands-via-discord-has-ransomware-feature/) Windows API functions such as `GetLocaleInfoW` can also be used to determine the locale of the host.[1](https://assets.documentcloud.org/documents/20413525/fbi-flash-indicators-of-compromise-ragnar-locker-ransomware-11192020-bc.pdf) In cloud environments, an instance's availability zone may also be discovered by accessing the instance metadata service from the instance.[4](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html)[5](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service?tabs=windows)

Adversaries may also attempt to infer the location of a victim host using IP addressing, such as via online geolocation IP-lookup services.[6](https://securelist.com/transparent-tribe-part-1/98127/)[2](https://news.sophos.com/en-us/2016/05/03/location-based-ransomware-threat-research/)

---
## Sub-Techniques

#### System Language Discovery - T1614.001
[[T1614_System Location Discovery#System Language Discovery - T1614 001|System Language Discovery (T1614.001)]]

Adversaries may attempt to gather information about the system language of a victim in order to infer the geographical location of that host. This information may be used to shape follow-on behaviors, including whether the adversary infects the target and/or attempts specific actions. This decision may be employed by malware developers and operators to reduce their risk of attracting the attention of specific law enforcement agencies or prosecution/scrutiny from other entities.[1](https://www.welivesecurity.com/2009/01/15/malware-trying-to-avoid-some-countries/)

There are various sources of data an adversary could use to infer system language, such as system defaults and keyboard layouts. Specific checks will vary based on the target and/or adversary, but may involve behaviors such as [[T1012_Query Registry|Query Registry (T1012)]] and calls to [[T1106_Native API|Native API (T1106)]] functions.[2](https://www.crowdstrike.com/blog/big-game-hunting-with-ryuk-another-lucrative-targeted-ransomware/)

For example, on a Windows system adversaries may attempt to infer the language of a system by querying the registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language` or parsing the outputs of Windows API functions `GetUserDefaultUILanguage`, `GetSystemDefaultUILanguage`, `GetKeyboardLayoutList` and `GetUserDefaultLangID`.[3](https://www.cybereason.com/blog/cybereason-vs-darkside-ransomware)[4](https://securelist.com/evolution-of-jsworm-ransomware/102428/)[5](https://securelist.com/synack-targeted-ransomware-uses-the-doppelganging-technique/85431/)

On a macOS or Linux system, adversaries may query `locale` to retrieve the value of the `$LANG` environment variable.



