Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1016  

# System Network Configuration Discovery - T1016
---
## Description
[more on T1016](https://attack.mitre.org/techniques/T1016)

Adversaries may look for details about the network configuration and settings, such as IP and/or MAC addresses, of systems they access or through information [[discovery]] of remote systems. Several operating system administration utilities exist that can be used to gather this information. Examples include [Arp](https://attack.mitre.org/software/S0099), [ipconfig](https://attack.mitre.org/software/S0100)/[ifconfig](https://attack.mitre.org/software/S0101), [nbtstat](https://attack.mitre.org/software/S0102), and [route](https://attack.mitre.org/software/S0103).

Adversaries may use the information from [[T1016_System Network Configuration Discovery|System Network Configuration Discovery (T1016)]] during automated [[discovery]] to shape follow-on behaviors, including determining certain access within the target network and what actions to do next.

---
## Sub-Techniques

#### Internet Connection Discovery - T1016.001
[more on T1016.001](https://attack.mitre.org/techniques/T1016/001)

Adversaries may check for Internet connectivity on compromised systems. This may be performed during automated [[discovery]] and can be accomplished in numerous ways such as using [Ping](https://attack.mitre.org/software/S0097), `tracert`, and GET requests to websites.

Adversaries may use the results and responses from these requests to determine if the system is capable of communicating with their C2 servers before attempting to connect to them. The results may also be used to identify routes, redirectors, and proxy servers.

#### Wi-Fi Discovery - T1016.002
[more on T1016.002](https://attack.mitre.org/techniques/T1016/002)

Adversaries may search for information about Wi-Fi networks, such as network names and passwords, on compromised systems. Adversaries may use Wi-Fi information as part of [[T1087_Account Discovery|Account Discovery]] , [[T1018_Remote System Discovery|Remote System Discovery]] , and other discovery or [[CREDENTIAL_ACCESS|Credential Access]] activity to support both ongoing and future campaigns.

Adversaries may collect various types of information about Wi-Fi networks from hosts. For example, on Windows names and passwords of all Wi-Fi networks a device has previously connected to may be available through `netsh wlan show profiles` to enumerate Wi-Fi names and then `netsh wlan show profile "Wi-Fi name" key=clear` to show a Wi-Fi network’s corresponding password.[1](https://www.bleepingcomputer.com/news/security/hackers-steal-wifi-passwords-using-upgraded-agent-tesla-malware/) [2](https://www.malwarebytes.com/blog/news/2020/04/new-agenttesla-variant-steals-wifi-credentials) [3](https://research.checkpoint.com/2022/apt35-exploits-log4j-vulnerability-to-distribute-new-modular-powershell-toolkit/) Additionally, names and other details of locally reachable Wi-Fi networks can be discovered using calls to `wlanAPI.dll` [[T1106_Native API|Native API]] functions.[4](https://www.binarydefense.com/resources/blog/emotet-evolves-with-new-wi-fi-spreader/)

On Linux, names and passwords of all Wi-Fi-networks a device has previously connected to may be available in files under `/etc/NetworkManager/system-connections/`.[5](https://www.geeksforgeeks.org/wi-fi-password-connected-networks-windowslinux/) On macOS, the password of a known Wi-Fi may be identified with `security find-generic-password -wa wifiname` (requires admin username/password).[6](https://mackeeper.com/blog/find-wi-fi-password-on-mac/)
