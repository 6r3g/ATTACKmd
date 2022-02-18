Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1584 

# Compromise Infrastructure - T1584
---
## Description
[more on T1584](https://attack.mitre.org/techniques/T1584)

Adversaries may compromise third-party infrastructure that can be used during targeting. Infrastructure solutions include physical or cloud servers, domains, and third-party web services. Instead of buying, leasing, or renting infrastructure an adversary may compromise infrastructure and use it during other phases of the adversary lifecycle.[1](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf)[2](https://www.icann.org/groups/ssac/documents/sac-007-en)[3](https://blog.talosintelligence.com/2018/11/dnspionage-campaign-targets-middle-east.html)[4](https://www.fireeye.com/blog/threat-research/2015/12/the-eps-awakens-part-two.html) Additionally, adversaries may compromise numerous machines to form a botnet they can leverage.

Use of compromised infrastructure allows an adversary to stage, launch, and execute an operation. Compromised infrastructure can help adversary operations blend in with traffic that is seen as normal, such as contact with high reputation or trusted sites. By using compromised infrastructure, adversaries may make it difficult to tie their actions back to them. Prior to targeting, adversaries may compromise the infrastructure of other adversaries.[5](https://media.defense.gov/2019/Oct/18/2002197242/-1/-1/0/NSA_CSA_Turla_20191021%20ver%204%20-%20nsa.gov.pdf)

---
## Sub-Techniques

#### Domains - T1584.001
[more on T1584.001](https://attack.mitre.org/techniques/T1584/001)

Adversaries may hijack domains and/or subdomains that can be used during targeting. Domain registration hijacking is the act of changing the registration of a domain name without the permission of the original registrant.[1](https://www.icann.org/groups/ssac/documents/sac-007-en) An adversary may gain access to an email account for the person listed as the owner of the domain. The adversary can then claim that they forgot their password in order to make changes to the domain registration. Other possibilities include social engineering a domain registration help desk to gain access to an account or taking advantage of renewal process gaps.

Subdomain hijacking can occur when organizations have DNS entries that point to non-existent or deprovisioned resources. In such cases, an adversary may take control of a subdomain to conduct operations with the benefit of the trust associated with that domain.[2](https://docs.microsoft.com/en-us/azure/security/fundamentals/subdomain-takeover)

#### DNS Server - T1584.002
[more on T1584.002](https://attack.mitre.org/techniques/T1584/002)

Adversaries may compromise third-party DNS servers that can be used during targeting. During post-compromise activity, adversaries may utilize DNS traffic for various tasks, including for Command and Control (ex: [[T1071_Application Layer Protocol|Application Layer Protocol (T1071)]]). Instead of setting up their own DNS servers, adversaries may compromise third-party DNS servers in support of operations.

By compromising DNS servers, adversaries can alter DNS records. Such control can allow for redirection of an organization's traffic, facilitating Collection and Credential Access efforts for the adversary.[1](https://blog.talosintelligence.com/2018/11/dnspionage-campaign-targets-middle-east.html)[2](https://www.fireeye.com/blog/threat-research/2019/01/global-dns-hijacking-campaign-dns-record-manipulation-at-scale.html) Adversaries may also be able to silently create subdomains pointed at malicious servers without tipping off the actual owner of the DNS server.[3](https://blogs.cisco.com/security/talos/angler-domain-shadowing)[4](https://www.proofpoint.com/us/threat-insight/post/The-Shadow-Knows)

#### Virtual Private Server - T1584.003
[more on T1584.003](https://attack.mitre.org/techniques/T1584/003)

Adversaries may compromise third-party Virtual Private Servers (VPSs) that can be used during targeting. There exist a variety of cloud service providers that will sell virtual machines/containers as a service. Adversaries may compromise VPSs purchased by third-party entities. By compromising a VPS to use as infrastructure, adversaries can make it difficult to physically tie back operations to themselves.[1](https://media.defense.gov/2019/Oct/18/2002197242/-1/-1/0/NSA_CSA_Turla_20191021%20ver%204%20-%20nsa.gov.pdf)

Compromising a VPS for use in later stages of the adversary lifecycle, such as Command and Control, can allow adversaries to benefit from the ubiquity and trust associated with higher reputation cloud service providers as well as that added by the compromised third-party.

#### Server - T1584.004
[more on T1584.004](https://attack.mitre.org/techniques/T1584/004)

Adversaries may compromise third-party servers that can be used during targeting. Use of servers allows an adversary to stage, launch, and execute an operation. During post-compromise activity, adversaries may utilize servers for various tasks, including for Command and Control. Instead of purchasing a [[T1583_Acquire Infrastructure#Server - T1583 004|Server (T1583.004)]] or [[T1583_Acquire Infrastructure#Virtual Private Server - T1583 003|Virtual Private Server (T1583.003)]], adversaries may compromise third-party servers in support of operations.

Adversaries may also compromise web servers to support watering hole operations, as in [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]].

#### Botnet - T1584.005
[more on T1584.005](https://attack.mitre.org/techniques/T1584/005)

Adversaries may compromise numerous third-party systems to form a botnet that can be used during targeting. A botnet is a network of compromised systems that can be instructed to perform coordinated tasks.[1](https://us.norton.com/internetsecurity-malware-what-is-a-botnet.html) Instead of purchasing/renting a botnet from a booter/stresser service[2](https://www.imperva.com/learn/ddos/booters-stressers-ddosers/), adversaries may build their own botnet by compromising numerous third-party systems. Adversaries may also conduct a takeover of an existing botnet, such as redirecting bots to adversary-controlled C2 servers.[3](https://www.secureworks.com/research/dridex-bugat-v5-botnet-takeover-operation) With a botnet at their disposal, adversaries may perform follow-on activity such as large-scale [[T1566_Phishing|Phishing (T1566)]] or Distributed Denial of Service (DDoS).

#### Web Services - T1584.006
[more on T1584.006](https://attack.mitre.org/techniques/T1584/006)

Adversaries may compromise access to third-party web services that can be used during targeting. A variety of popular websites exist for legitimate users to register for web-based services, such as GitHub, Twitter, Dropbox, Google, etc. Adversaries may try to take ownership of a legitimate user's access to a web service and use that web service as infrastructure in support of cyber operations. Such web services can be abused during later stages of the adversary lifecycle, such as during Command and Control ([[T1102_Web Service|Web Service (T1102)]]) or [[T1567_Exfiltration Over Web Service|Exfiltration Over Web Service (T1567)]]. Using common services, such as those offered by Google or Twitter, makes it easier for adversaries to hide in expected noise. By utilizing a web service, particularly when access is stolen from legitimate users, adversaries can make it difficult to physically tie back operations to them.

