Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1588 

# Obtain Capabilities - T1588
---
## Description
[more on T1588](https://attack.mitre.org/techniques/T1588)

Adversaries may buy and/or steal capabilities that can be used during targeting. Rather than developing their own capabilities in-house, adversaries may purchase, freely download, or steal them. Activities may include the acquisition of malware, software (including licenses), exploits, certificates, and information relating to vulnerabilities. Adversaries may obtain capabilities to support their operations throughout numerous phases of the adversary lifecycle.

In addition to downloading free malware, software, and exploits from the internet, adversaries may purchase these capabilities from third-party entities. Third-party entities can include technology companies that specialize in malware and exploits, criminal marketplaces, or from individuals.[1](https://www.nytimes.com/2013/07/14/world/europe/nations-buying-as-hackers-sell-computer-flaws.html)[2](https://citizenlab.ca/2016/08/million-dollar-dissident-iphone-zero-day-nso-group-uae/)

In addition to purchasing capabilities, adversaries may steal capabilities from third-party entities (including other adversaries). This can include stealing software licenses, malware, SSL/TLS and code-signing certificates, or raiding closed databases of vulnerabilities or exploits.[3](https://threatpost.com/final-report-diginotar-hack-shows-total-compromise-ca-servers-103112/77170/)

---
## Sub-Techniques

#### Malware - T1588.001
[more on T1588.001](https://attack.mitre.org/techniques/T1588/001)

Adversaries may buy, steal, or download malware that can be used during targeting. Malicious software can include payloads, droppers, post-compromise tools, backdoors, packers, and C2 protocols. Adversaries may acquire malware to support their operations, obtaining a means for maintaining control of remote machines, evading defenses, and executing post-compromise behaviors.

In addition to downloading free malware from the internet, adversaries may purchase these capabilities from third-party entities. Third-party entities can include technology companies that specialize in malware development, criminal marketplaces (including Malware-as-a-Service, or MaaS), or from individuals. In addition to purchasing malware, adversaries may steal and repurpose malware from third-party entities (including other adversaries).

#### Tool - T1588.002
[more on T1588.002](https://attack.mitre.org/techniques/T1588/002)

Adversaries may buy, steal, or download software tools that can be used during targeting. Tools can be open or closed source, free or commercial. A tool can be used for malicious purposes by an adversary, but (unlike malware) were not intended to be used for those purposes (ex: [PsExec](https://attack.mitre.org/software/S0029)). Tool acquisition can involve the procurement of commercial software licenses, including for red teaming tools such as [Cobalt Strike](https://attack.mitre.org/software/S0154). Commercial software may be obtained through purchase, stealing licenses (or licensed copies of the software), or cracking trial versions.[1](https://www.recordedfuture.com/identifying-cobalt-strike-servers/)

Adversaries may obtain tools to support their operations, including to support execution of post-compromise behaviors. In addition to freely downloading or purchasing software, adversaries may steal software and/or software licenses from third-party entities (including other adversaries).

#### Code Signing Certificates - T1588.003
[more on T1588.003](https://attack.mitre.org/techniques/T1588/003)

Adversaries may buy and/or steal code signing certificates that can be used during targeting. Code signing is the process of digitally signing executables and scripts to confirm the software author and guarantee that the code has not been altered or corrupted. Code signing provides a level of authenticity for a program from the developer and a guarantee that the program has not been tampered with.[1](https://en.wikipedia.org/wiki/Code_signing) Users and/or security tools may trust a signed piece of code more than an unsigned piece of code even if they don't know who issued the certificate or who the author is.

Prior to [[T1553_Subvert Trust Controls#Code Signing - T1553 002|Code Signing (T1553.002)]], adversaries may purchase or steal code signing certificates for use in operations. The purchase of code signing certificates may be done using a front organization or using information stolen from a previously compromised entity that allows the adversary to validate to a certificate provider as that entity. Adversaries may also steal code signing materials directly from a compromised third-party.

#### Digital Certificates - T1588.004
[more on T1588.004](https://attack.mitre.org/techniques/T1588/004)

Adversaries may buy and/or steal SSL/TLS certificates that can be used during targeting. SSL/TLS certificates are designed to instill trust. They include information about the key, information about its owner's identity, and the digital signature of an entity that has verified the certificate's contents are correct. If the signature is valid, and the person examining the certificate trusts the signer, then they know they can use that key to communicate with its owner.

Adversaries may purchase or steal SSL/TLS certificates to further their operations, such as encrypting C2 traffic (ex: [[T1573_Encrypted Channel#Asymmetric Cryptography - T1573 002|Asymmetric Cryptography (T1573.002)]] with [[T1071_Application Layer Protocol#Web Protocols - T1071 001|Web Protocols (T1071.001)]]) or even enabling [[T1557_Adversary-in-the-Middle|Adversary-in-the-Middle (T1557)]] if the certificate is trusted or otherwise added to the root of trust (i.e. [[T1553_Subvert Trust Controls#Install Root Certificate - T1553 004|Install Root Certificate (T1553.004)]]). The purchase of digital certificates may be done using a front organization or using information stolen from a previously compromised entity that allows the adversary to validate to a certificate provider as that entity. Adversaries may also steal certificate materials directly from a compromised third-party, including from certificate authorities.[1](https://threatpost.com/final-report-diginotar-hack-shows-total-compromise-ca-servers-103112/77170/) Adversaries may register or hijack domains that they will later purchase an SSL/TLS certificate for.

Certificate authorities exist that allow adversaries to acquire SSL/TLS certificates, such as domain validation certificates, for free.[2](https://letsencrypt.org/docs/faq/)

After obtaining a digital certificate, an adversary may then install that certificate (see [[T1608_Stage Capabilities#Install Digital Certificate - T1608 003|Install Digital Certificate (T1608.003)]]) on infrastructure under their control.

#### Exploits - T1588.005
[more on T1588.005](https://attack.mitre.org/techniques/T1588/005)

Adversaries may buy, steal, or download exploits that can be used during targeting. An exploit takes advantage of a bug or vulnerability in order to cause unintended or unanticipated behavior to occur on computer hardware or software. Rather than developing their own exploits, an adversary may find/modify exploits from online or purchase them from exploit vendors.[1](https://www.exploit-db.com/)[2](https://www.wired.co.uk/article/darkhotel-hacking-team-cyber-espionage)[3](https://www.nytimes.com/2013/07/14/world/europe/nations-buying-as-hackers-sell-computer-flaws.html)

In addition to downloading free exploits from the internet, adversaries may purchase exploits from third-party entities. Third-party entities can include technology companies that specialize in exploit development, criminal marketplaces (including exploit kits), or from individuals.[4](https://citizenlab.ca/2016/08/million-dollar-dissident-iphone-zero-day-nso-group-uae/)[5](https://www.vice.com/en/article/3kx5y3/uzbekistan-hacking-operations-uncovered-due-to-spectacularly-bad-opsec) In addition to purchasing exploits, adversaries may steal and repurpose exploits from third-party entities (including other adversaries).[2](https://www.wired.co.uk/article/darkhotel-hacking-team-cyber-espionage)

An adversary may monitor exploit provider forums to understand the state of existing, as well as newly discovered, exploits. There is usually a delay between when an exploit is discovered and when it is made public. An adversary may target the systems of those known to conduct exploit research and development in order to gain that knowledge for use during a subsequent operation.

Adversaries may use exploits during various phases of the adversary lifecycle (i.e. [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]], [[T1203_Exploitation for Client Execution|Exploitation for Client Execution (T1203)]], [[T1068_Exploitation for Privilege Escalation|Exploitation for Privilege Escalation (T1068)]], [[T1211_Exploitation for Defense Evasion|Exploitation for Defense Evasion (T1211)]], [[T1212_Exploitation for Credential Access|Exploitation for Credential Access (T1212)]], [[T1210_Exploitation of Remote Services|Exploitation of Remote Services (T1210)]], and [[T1499_Endpoint Denial of Service#Application or System Exploitation - T1499 004|Application or System Exploitation (T1499.004)]]).

#### Vulnerabilities - T1588.006
[more on T1588.006](https://attack.mitre.org/techniques/T1588/006)

Adversaries may acquire information about vulnerabilities that can be used during targeting. A vulnerability is a weakness in computer hardware or software that can, potentially, be exploited by an adversary to cause unintended or unanticipated behavior to occur. Adversaries may find vulnerability information by searching open databases or gaining access to closed vulnerability databases.[1](https://nvd.nist.gov/)

An adversary may monitor vulnerability disclosures/databases to understand the state of existing, as well as newly discovered, vulnerabilities. There is usually a delay between when a vulnerability is discovered and when it is made public. An adversary may target the systems of those known to conduct vulnerability research (including commercial vendors). Knowledge of a vulnerability may cause an adversary to search for an existing exploit (i.e. [[T1588_Obtain Capabilities#Exploits - T1588 005|Exploits (T1588.005)]]) or to attempt to develop one themselves (i.e. [[T1587_Develop Capabilities#Exploits - T1587 004|Exploits (T1587.004)]]).


