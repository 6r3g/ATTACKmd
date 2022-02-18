Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1599  

# Network Boundary Bridging - T1599
---
## Description
[more on T1599](https://attack.mitre.org/techniques/T1599)

Adversaries may bridge network boundaries by compromising perimeter network devices. Breaching these devices may enable an adversary to bypass restrictions on traffic routing that otherwise separate trusted and untrusted networks.

Devices such as routers and firewalls can be used to create boundaries between trusted and untrusted networks. They achieve this by restricting traffic types to enforce organizational policy in an attempt to reduce the risk inherent in such connections. Restriction of traffic can be achieved by prohibiting IP addresses, layer 4 protocol ports, or through deep packet inspection to identify applications. To participate with the rest of the network, these devices can be directly addressable or transparent, but their mode of operation has no bearing on how the adversary can bypass them when compromised.

When an adversary takes control of such a boundary device, they can bypass its policy enforcement to pass normally prohibited traffic across the trust boundary between the two separated networks without hinderance. By achieving sufficient rights on the device, an adversary can reconfigure the device to allow the traffic they want, allowing them to then further achieve goals such as command and control via [[T1090_Proxy#Multi-hop Proxy - T1090 003|Multi-hop Proxy (T1090.003)]] or exfiltration of data via [[T1020_Automated Exfiltration#Traffic Duplication - T1020 001|Traffic Duplication (T1020.001)]]. In the cases where a border device separates two separate organizations, the adversary can also facilitate lateral movement into new victim environments.

---
## Sub-Techniques

#### Network Address Translation Traversal - T1599.001
[more on T1599.001](https://attack.mitre.org/techniques/T1599/001)

Adversaries may bridge network boundaries by modifying a network device’s Network Address Translation (NAT) configuration. Malicious modifications to NAT may enable an adversary to bypass restrictions on traffic routing that otherwise separate trusted and untrusted networks.

Network devices such as routers and firewalls that connect multiple networks together may implement NAT during the process of passing packets between networks. When performing NAT, the network device will rewrite the source and/or destination addresses of the IP address header. Some network designs require NAT for the packets to cross the border device. A typical example of this is environments where internal networks make use of non-Internet routable addresses.[1](https://tools.ietf.org/html/rfc1918)

When an adversary gains control of a network boundary device, they can either leverage existing NAT configurations to send traffic between two separated networks, or they can implement NAT configurations of their own design. In the case of network designs that require NAT to function, this enables the adversary to overcome inherent routing limitations that would normally prevent them from accessing protected systems behind the border device. In the case of network designs that do not require NAT, address translation can be used by adversaries to obscure their activities, as changing the addresses of packets that traverse a network boundary device can make monitoring data transmissions more challenging for defenders.

Adversaries may use [[T1601_Modify System Image#Patch System Image - T1601 001|Patch System Image (T1601.001)]] to change the operating system of a network device, implementing their own custom NAT mechanisms to further obscure their activities



