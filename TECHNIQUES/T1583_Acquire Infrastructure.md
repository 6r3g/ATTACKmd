Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1583 

# Acquire Infrastructure - T1583
---
## Description
[more on T1583](https://attack.mitre.org/techniques/T1583)

Adversaries may buy, lease, or rent infrastructure that can be used during targeting. A wide variety of infrastructure exists for hosting and orchestrating adversary operations. Infrastructure solutions include physical or cloud servers, domains, and third-party web services.[1](https://documents.trendmicro.com/assets/wp/wp-criminal-hideouts-for-lease.pdf) Additionally, botnets are available for rent or purchase.

Use of these infrastructure solutions allows an adversary to stage, launch, and execute an operation. Solutions may help adversary operations blend in with traffic that is seen as normal, such as contact to third-party web services. Depending on the implementation, adversaries may use infrastructure that makes it difficult to physically tie back to them as well as utilize infrastructure that can be rapidly provisioned, modified, and shut down.

---
## Sub-Techniques

#### Domains - T1583.001
[more on T1583.001](https://attack.mitre.org/techniques/T1583/001)

Adversaries may purchase domains that can be used during targeting. Domain names are the human readable names used to represent one or more IP addresses. They can be purchased or, in some cases, acquired for free.

Adversaries can use purchased domains for a variety of purposes, including for [[T1566_Phishing|Phishing (T1566)]], [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]], and Command and Control.[1](https://us-cert.cisa.gov/ncas/alerts/aa20-258a) Adversaries may choose domains that are similar to legitimate domains, including through use of homoglyphs or use of a different top-level domain (TLD).[2](https://www.fireeye.com/content/dam/fireeye-www/global/en/current-threats/pdfs/rpt-apt28.pdf)[3](https://www.zdnet.com/article/paypal-alert-beware-the-paypai-scam-5000109103/) Typosquatting may be used to aid in delivery of payloads via [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]]. Adversaries can also use internationalized domain names (IDNs) to create visually similar lookalike domains for use in operations.[4](https://us-cert.cisa.gov/ncas/tips/ST05-016)

Domain registrars each maintain a publicly viewable database that displays contact information for every registered domain. Private WHOIS services display alternative information, such as their own company data, rather than the owner of the domain. Adversaries may use such private WHOIS services to obscure information about who owns a purchased domain. Adversaries may further interrupt efforts to track their infrastructure by using varied registration information and purchasing domains with different domain registrars.[5](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf)

#### DNS Server - T1583.002
[more on T1583.002](https://attack.mitre.org/techniques/T1583/002)

Adversaries may set up their own Domain Name System (DNS) servers that can be used during targeting. During post-compromise activity, adversaries may utilize DNS traffic for various tasks, including for Command and Control (ex: [[T1071_Application Layer Protocol|Application Layer Protocol (T1071)]]). Instead of hijacking existing DNS servers, adversaries may opt to configure and run their own DNS servers in support of operations.

By running their own DNS servers, adversaries can have more control over how they administer server-side DNS C2 traffic ([[T1071_Application Layer Protocol#DNS - T1071 004|DNS (T1071.004)]]). With control over a DNS server, adversaries can configure DNS applications to provide conditional responses to malware and, generally, have more flexibility in the structure of the DNS-based C2 channel.[1](https://unit42.paloaltonetworks.com/dns-tunneling-how-dns-can-be-abused-by-malicious-actors/)

#### Virtual Private Server - T1583.003
[more on T1583.003](https://attack.mitre.org/techniques/T1583/003)

Adversaries may rent Virtual Private Servers (VPSs) that can be used during targeting. There exist a variety of cloud service providers that will sell virtual machines/containers as a service. By utilizing a VPS, adversaries can make it difficult to physically tie back operations to them. The use of cloud infrastructure can also make it easier for adversaries to rapidly provision, modify, and shut down their infrastructure.

Acquiring a VPS for use in later stages of the adversary lifecycle, such as Command and Control, can allow adversaries to benefit from the ubiquity and trust associated with higher reputation cloud service providers. Adversaries may also acquire infrastructure from VPS service providers that are known for renting VPSs with minimal registration information, allowing for more anonymous acquisitions of infrastructure.[1](https://documents.trendmicro.com/assets/wp/wp-criminal-hideouts-for-lease.pdf)

#### Server - T1583.004
[more on T1583.004](https://attack.mitre.org/techniques/T1583/004)

Adversaries may buy, lease, or rent physical servers that can be used during targeting. Use of servers allows an adversary to stage, launch, and execute an operation. During post-compromise activity, adversaries may utilize servers for various tasks, including for Command and Control. Instead of compromising a third-party [[T1584_Compromise Infrastructure#Server - T1584 004|Server (T1584.004)]] or renting a [[T1583_Acquire Infrastructure#Virtual Private Server - T1583 003|Virtual Private Server (T1583.003)]], adversaries may opt to configure and run their own servers in support of operations.

Adversaries may only need a lightweight setup if most of their activities will take place using online infrastructure. Or, they may need to build extensive infrastructure if they want to test, communicate, and control other aspects of their activities on their own systems.[1](https://www.nytimes.com/2011/01/16/world/middleeast/16stuxnet.html)

#### Botnet - T1583.005
[more on T1583.005](https://attack.mitre.org/techniques/T1583/005)

Adversaries may buy, lease, or rent a network of compromised systems that can be used during targeting. A botnet is a network of compromised systems that can be instructed to perform coordinated tasks.[1](https://us.norton.com/internetsecurity-malware-what-is-a-botnet.html) Adversaries may purchase a subscription to use an existing botnet from a booter/stresser service. With a botnet at their disposal, adversaries may perform follow-on activity such as large-scale [[T1566_Phishing|Phishing (T1566)]] or Distributed Denial of Service (DDoS).[2](https://www.imperva.com/learn/ddos/booters-stressers-ddosers/)[3](https://krebsonsecurity.com/2017/01/who-is-anna-senpai-the-mirai-worm-author/)[4](https://krebsonsecurity.com/2016/10/hackforums-shutters-booter-service-bazaar/)[5](https://krebsonsecurity.com/2016/10/are-the-days-of-booter-services-numbered/)

#### Web Services - T1583.006
[more on T1583.006](https://attack.mitre.org/techniques/T1583/006)

Adversaries may register for web services that can be used during targeting. A variety of popular websites exist for adversaries to register for a web-based service that can be abused during later stages of the adversary lifecycle, such as during Command and Control ([[T1102_Web Service|Web Service (T1102)]]) or [[T1567_Exfiltration Over Web Service|Exfiltration over Web Service (T1567)]] . Using common services, such as those offered by Google or Twitter, makes it easier for adversaries to hide in expected noise. By utilizing a web service, adversaries can make it difficult to physically tie back operations to them.

