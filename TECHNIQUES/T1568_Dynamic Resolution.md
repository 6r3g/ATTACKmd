Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1568  

# Dynamic Resolution - T1568
---
## Description
[more on T1568](https://attack.mitre.org/techniques/T1568)

Adversaries may dynamically establish connections to command and control infrastructure to evade common detections and remediations. This may be achieved by using malware that shares a common algorithm with the infrastructure the adversary uses to receive the malware's communications. These calculations can be used to dynamically adjust parameters such as the domain name, IP address, or port number the malware uses for command and control.

Adversaries may use dynamic resolution for the purpose of [[T1008_Fallback Channels|Fallback Channels (T1008)]]. When contact is lost with the primary command and control server malware may employ dynamic resolution as a means to reestablishing command and control.[1](http://blog.talosintelligence.com/2017/09/avast-distributes-malware.html)[2](https://www.fireeye.com/blog/threat-research/2017/03/dissecting_one_ofap.html)[3](https://www.welivesecurity.com/2017/12/21/sednit-update-fancy-bear-spent-year/)

---
## Sub-Techniques

#### Fast Flux DNS - T1568.001
[more on T1568.001](https://attack.mitre.org/techniques/T1568/001)

Adversaries may use Fast Flux DNS to hide a command and control channel behind an array of rapidly changing IP addresses linked to a single domain resolution. This technique uses a fully qualified domain name, with multiple IP addresses assigned to it which are swapped with high frequency, using a combination of round robin IP addressing and short Time-To-Live (TTL) for a DNS resource record.[1](https://resources.infosecinstitute.com/fast-flux-networks-working-detection-part-1/#gref)[2](https://resources.infosecinstitute.com/fast-flux-networks-working-detection-part-2/#gref)[3](https://www.welivesecurity.com/2017/01/12/fast-flux-networks-work/)

The simplest, "single-flux" method, involves registering and de-registering an addresses as part of the DNS A (address) record list for a single DNS name. These registrations have a five-minute average lifespan, resulting in a constant shuffle of IP address resolution.[3](https://www.welivesecurity.com/2017/01/12/fast-flux-networks-work/)

In contrast, the "double-flux" method registers and de-registers an address as part of the DNS Name Server record list for the DNS zone, providing additional resilience for the connection. With double-flux additional hosts can act as a proxy to the C2 host, further insulating the true source of the C2 channel.

#### Domain Generation Algorithms - T1568.002
[more on T1568.002](https://attack.mitre.org/techniques/T1568/002)

Adversaries may make use of Domain Generation Algorithms (DGAs) to dynamically identify a destination domain for command and control traffic rather than relying on a list of static IP addresses or domains. This has the advantage of making it much harder for defenders block, track, or take over the command and control channel, as there potentially could be thousands of domains that malware can check for instructions.[1](http://go.cybereason.com/rs/996-YZT-709/images/Cybereason-Lab-Analysis-Dissecting-DGAs-Eight-Real-World-DGA-Variants.pdf)[2](https://umbrella.cisco.com/blog/2016/10/10/domain-generation-algorithms-effective/)[3](https://unit42.paloaltonetworks.com/threat-brief-understanding-domain-generation-algorithms-dga/)

DGAs can take the form of apparently random or "gibberish" strings (ex: istgmxdejdnxuyla.ru) when they construct domain names by generating each letter. Alternatively, some DGAs employ whole words as the unit by concatenating words together instead of letters (ex: cityjulydish.net). Many DGAs are time-based, generating a different domain for each time period (hourly, daily, monthly, etc). Others incorporate a seed value as well to make predicting future domains more difficult for defenders.[1](http://go.cybereason.com/rs/996-YZT-709/images/Cybereason-Lab-Analysis-Dissecting-DGAs-Eight-Real-World-DGA-Variants.pdf)[2](https://umbrella.cisco.com/blog/2016/10/10/domain-generation-algorithms-effective/)[4](http://blog.talosintelligence.com/2017/09/avast-distributes-malware.html)[5](https://blogs.akamai.com/2018/01/a-death-match-of-domain-generation-algorithms.html)

Adversaries may use DGAs for the purpose of [[T1008_Fallback Channels|Fallback Channels (T1008)]]. When contact is lost with the primary command and control server malware may employ a DGA as a means to reestablishing command and control.[4](http://blog.talosintelligence.com/2017/09/avast-distributes-malware.html)[6](https://www.fireeye.com/blog/threat-research/2017/03/dissecting_one_ofap.html)[7](https://www.welivesecurity.com/2017/12/21/sednit-update-fancy-bear-spent-year/)

#### DNS Calculation - T1568.003
[more on T1568.003](https://attack.mitre.org/techniques/T1568/003)

Adversaries may perform calculations on addresses returned in DNS results to determine which port and IP address to use for command and control, rather than relying on a predetermined port number or the actual returned IP address. A IP and/or port number calculation can be used to bypass egress filtering on a C2 channel.[1](http://www.crowdstrike.com/blog/whois-numbered-panda/)

One implementation of [[T1568_Dynamic Resolution#DNS Calculation - T1568 003|DNS Calculation (T1568.003)]] is to take the first three octets of an IP address in a DNS response and use those values to calculate the port for command and control traffic.[1](http://www.crowdstrike.com/blog/whois-numbered-panda/)[2](https://www.fireeye.com/blog/threat-research/2014/09/darwins-favorite-apt-group-2.html)[3](https://blog.rapid7.com/2013/08/26/upcoming-g20-summit-fuels-espionage-operations/)



