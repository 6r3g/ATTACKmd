Tactics: [[CREDENTIAL_ACCESS]] - [[COLLECTION]]
Tags: #mitre/attack/techniques/T1557  

# Adversary-in-the-Middle - T1557
---
## Description
[more on T1557](https://attack.mitre.org/techniques/T1557)

Adversaries may attempt to position themselves between two or more networked devices using an adversary-in-the-middle (AiTM) technique to support follow-on behaviors such as [[T1040_Network Sniffing|Network Sniffing (T1040)]] or [[T1565_Data Manipulation#Transmitted Data Manipulation - T1565 002|Transmitted Data Manipulation (T1565.002)]]. By abusing features of common networking protocols that can determine the flow of network traffic (e.g. ARP, DNS, LLMNR, etc.), adversaries may force a device to communicate through an adversary controlled system so they can collect information or perform additional actions.[1](https://www.rapid7.com/fundamentals/man-in-the-middle-attacks/)

Adversaries may leverage the AiTM position to attempt to modify traffic, such as in [[T1565_Data Manipulation#Transmitted Data Manipulation - T1565 002|Transmitted Data Manipulation (T1565.002)]]. Adversaries can also stop traffic from flowing to the appropriate destination, causing denial of service.

---
## Sub-Techniques

#### LLMNR/NBT-NS Poisoning and SMB Relay - T1557.001
[more on T1557.001](https://attack.mitre.org/techniques/T1557/001)

By responding to LLMNR/NBT-NS network traffic, adversaries may spoof an authoritative source for name resolution to force communication with an adversary controlled system. This activity may be used to collect or relay authentication materials.

Link-Local Multicast Name Resolution (LLMNR) and NetBIOS Name Service (NBT-NS) are Microsoft Windows components that serve as alternate methods of host identification. LLMNR is based upon the Domain Name System (DNS) format and allows hosts on the same local link to perform name resolution for other hosts. NBT-NS identifies systems on a local network by their NetBIOS name. [1](https://en.wikipedia.org/wiki/Link-Local_Multicast_Name_Resolution) [2](https://technet.microsoft.com/library/cc958811.aspx)

Adversaries can spoof an authoritative source for name resolution on a victim network by responding to LLMNR (UDP 5355)/NBT-NS (UDP 137) traffic as if they know the identity of the requested host, effectively poisoning the service so that the victims will communicate with the adversary controlled system. If the requested host belongs to a resource that requires identification/authentication, the username and NTLMv2 hash will then be sent to the adversary controlled system. The adversary can then collect the hash information sent over the wire through tools that monitor the ports for traffic or through [[T1040_Network Sniffing|Network Sniffing (T1040)]] and crack the hashes offline through [[T1110_Brute Force|Brute Force (T1110)]] to obtain the plaintext passwords. In some cases where an adversary has access to a system that is in the authentication path between systems or when automated scans that use credentials attempt to authenticate to an adversary controlled system, the NTLMv2 hashes can be intercepted and relayed to access and execute code against a target system. The relay step can happen in conjunction with poisoning but may also be independent of it. [3](https://byt3bl33d3r.github.io/practical-guide-to-ntlm-relaying-in-2017-aka-getting-a-foothold-in-under-5-minutes.html)[4](https://blog.secureideas.com/2018/04/ever-run-a-relay-why-smb-relays-should-be-on-your-mind.html)

Several tools exist that can be used to poison name services within local networks such as NBNSpoof, Metasploit, and [Responder](https://attack.mitre.org/software/S0174). [5](https://github.com/nomex/nbnspoof) [6](https://www.rapid7.com/db/modules/auxiliary/spoof/llmnr/llmnr_response) [7](https://github.com/SpiderLabs/Responder)

#### ARP Cache Poisoning - T1557.002
[more on T1557.002](https://attack.mitre.org/techniques/T1557/002)

Adversaries may poison Address Resolution Protocol (ARP) caches to position themselves between the communication of two or more networked devices. This activity may be used to enable follow-on behaviors such as [[T1040_Network Sniffing|Network Sniffing (T1040)]] or [[T1565_Data Manipulation#Transmitted Data Manipulation - T1565 002|Transmitted Data Manipulation (T1565.002)]].

The ARP protocol is used to resolve IPv4 addresses to link layer addresses, such as a media access control (MAC) address.[1](https://tools.ietf.org/html/rfc826) Devices in a local network segment communicate with each other by using link layer addresses. If a networked device does not have the link layer address of a particular networked device, it may send out a broadcast ARP request to the local network to translate the IP address to a MAC address. The device with the associated IP address directly replies with its MAC address. The networked device that made the ARP request will then use as well as store that information in its ARP cache.

An adversary may passively wait for an ARP request to poison the ARP cache of the requesting device. The adversary may reply with their MAC address, thus deceiving the victim by making them believe that they are communicating with the intended networked device. For the adversary to poison the ARP cache, their reply must be faster than the one made by the legitimate IP address owner. Adversaries may also send a gratuitous ARP reply that maliciously announces the ownership of a particular IP address to all the devices in the local network segment.

The ARP protocol is stateless and does not require authentication. Therefore, devices may wrongly add or update the MAC address of the IP address in their ARP cache.[2](https://pen-testing.sans.org/resources/papers/gcih/real-world-arp-spoofing-105411)[3](https://web.archive.org/web/20200302085133/https://www.cylance.com/content/dam/cylance/pages/operation-cleaver/Cylance_Operation_Cleaver_Report.pdf)

Adversaries may use ARP cache poisoning as a means to intercept network traffic. This activity may be used to collect and/or relay data such as credentials, especially those sent over an insecure, unencrypted protocol.[2](https://pen-testing.sans.org/resources/papers/gcih/real-world-arp-spoofing-105411)



