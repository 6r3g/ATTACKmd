Tactics: [[PERSISTENCE]] - [[DEFENSE_EVASION]] - [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1205  

# Traffic Signaling - T1205
---
## Description
[more on T1205](https://attack.mitre.org/techniques/T1205)

Adversaries may use traffic signaling to hide open ports or other malicious functionality used for persistence or command and control. Traffic signaling involves the use of a magic value or sequence that must be sent to a system to trigger a special response, such as opening a closed port or executing a malicious task. This may take the form of sending a series of packets with certain characteristics before a port will be opened that the adversary can use for command and control. Usually this series of packets consists of attempted connections to a predefined sequence of closed ports (i.e. [[T1205_Traffic Signaling#Port Knocking - T1205 001|Port Knocking (T1205.001)]]), but can involve unusual flags, specific strings, or other unique characteristics. After the sequence is completed, opening a port may be accomplished by the host-based firewall, but could also be implemented by custom software.

Adversaries may also communicate with an already open port, but the service listening on that port will only respond to commands or trigger other malicious functionality if passed the appropriate magic value(s).

The observation of the signal packets to trigger the communication can be conducted through different methods. One means, originally implemented by Cd00r [1](https://www.giac.org/paper/gcih/342/handle-cd00r-invisible-backdoor/103631), is to use the libpcap libraries to sniff for the packets in question. Another method leverages raw sockets, which enables the malware to use ports that are already open for use by other programs.

On network devices, adversaries may use crafted packets to enable [[T1556_Modify Authentication Process#Network Device Authentication - T1556 004|Network Device Authentication (T1556.004)]] for standard services offered by the device such as telnet. Such signaling may also be used to open a closed service port such as telnet, or to trigger module modification of malware implants on the device, adding, removing, or changing malicious capabilities.[2](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices) [3](https://www.fireeye.com/blog/threat-research/2015/09/synful_knock_-_acis.html) [4](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954) To enable this traffic signaling on embedded devices, adversaries must first achieve and leverage [[T1601_Modify System Image#Patch System Image - T1601 001|Patch System Image (T1601.001)]] due to the monolithic nature of the architecture.

Adversaries may also use the Wake-on-LAN feature to turn on powered off systems. Wake-on-LAN is a hardware feature that allows a powered down system to be powered on, or woken up, by sending a magic packet to it. Once the system is powered on, it may become a target for lateral movement.[5](https://www.bleepingcomputer.com/news/security/ryuk-ransomware-uses-wake-on-lan-to-encrypt-offline-devices/) [6](https://www.amd.com/system/files/TechDocs/20213.pdf)

---
## Sub-Techniques

#### Port Knocking - T1205.001
[more on T1205.001](https://attack.mitre.org/techniques/T1205/001)

Adversaries may use port knocking to hide open ports used for persistence or command and control. To enable a port, an adversary sends a series of attempted connections to a predefined sequence of closed ports. After the sequence is completed, opening a port is often accomplished by the host based firewall, but could also be implemented by custom software.

This technique has been observed to both for the dynamic opening of a listening port as well as the initiating of a connection to a listening server on a different system.

The observation of the signal packets to trigger the communication can be conducted through different methods. One means, originally implemented by Cd00r [1](https://www.giac.org/paper/gcih/342/handle-cd00r-invisible-backdoor/103631), is to use the libpcap libraries to sniff for the packets in question. Another method leverages raw sockets, which enables the malware to use ports that are already open for use by other programs.

#### Socket Filters - T1205.002
[more on T1205.002](https://attack.mitre.org/techniques/T1205/002)

Adversaries may attach filters to a network socket to monitor then activate backdoors used for persistence or command and control. With elevated permissions, adversaries can use features such as the `libpcap` library to open sockets and install filters to allow or disallow certain types of data to come through the socket. The filter may apply to all traffic passing through the specified network interface (or every interface if not specified). When the network interface receives a packet matching the filter criteria, additional actions can be triggered on the host, such as activation of a reverse shell.

To establish a connection, an adversary sends a crafted packet to the targeted host that matches the installed filter criteria. [1](http://recursos.aldabaknocking.com/libpcapHakin9LuisMartinGarcia.pdf) Adversaries have used these socket filters to trigger the installation of implants, conduct ping backs, and to invoke command shells. Communication with these socket filters may also be used in conjunction with [[T1572_Protocol Tunneling|Protocol Tunneling]]. [2](https://exatrack.com/public/Tricephalic_Hellkeeper.pdf) [3](https://www.leonardo.com/documents/20142/10868623/Malware+Technical+Insight+_Turla+%E2%80%9CPenquin_x64%E2%80%9D.pdf)

Filters can be installed on any Unix-like platform with `libpcap` installed or on Windows hosts using `Winpcap`. Adversaries may use either `libpcap` with `pcap_setfilter` or the standard library function `setsockopt` with `SO_ATTACH_FILTER` options. Since the socket connection is not active until the packet is received, this behavior may be difficult to detect due to the lack of activity on a host, low CPU overhead, and limited visibility into raw socket usage.

