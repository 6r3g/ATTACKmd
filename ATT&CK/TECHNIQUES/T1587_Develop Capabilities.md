Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1587 

# Develop Capabilities - T1587
---
## Description
[more on T1587](https://attack.mitre.org/techniques/T1587)

Adversaries may build capabilities that can be used during targeting. Rather than purchasing, freely downloading, or stealing capabilities, adversaries may develop their own capabilities in-house. This is the process of identifying development requirements and building solutions such as malware, exploits, and self-signed certificates. Adversaries may develop capabilities to support their operations throughout numerous phases of the adversary lifecycle.[1](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf)[2](https://securelist.com/sofacy-apt-hits-high-profile-targets-with-updated-toolset/72924/)[3](https://www.bitdefender.com/files/News/CaseStudies/study/353/Bitdefender-Whitepaper-StrongPity-APT.pdf)[4](https://blog.talosintelligence.com/2020/06/promethium-extends-with-strongpity3.html)

As with legitimate development efforts, different skill sets may be required for developing capabilities. The skills needed may be located in-house, or may need to be contracted out. Use of a contractor may be considered an extension of that adversary's development capabilities, provided the adversary plays a role in shaping requirements and maintains a degree of exclusivity to the capability.

---
## Sub-Techniques

#### Malware - T1587.001 
[more on T1587.001](https://attack.mitre.org/techniques/T1587/001)

Adversaries may develop malware and malware components that can be used during targeting. Building malicious software can include the development of payloads, droppers, post-compromise tools, backdoors (including backdoored images), packers, C2 protocols, and the creation of infected removable media. Adversaries may develop malware to support their operations, creating a means for maintaining control of remote machines, evading defenses, and executing post-compromise behaviors.[1](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf)[2](https://securelist.com/sofacy-apt-hits-high-profile-targets-with-updated-toolset/72924/)[3](https://arstechnica.com/information-technology/2014/06/active-malware-operation-let-attackers-sabotage-us-energy-industry/)[4](https://www.losangeles.va.gov/documents/MI-000120-MW.pdf)

As with legitimate development efforts, different skill sets may be required for developing malware. The skills needed may be located in-house, or may need to be contracted out. Use of a contractor may be considered an extension of that adversary's malware development capabilities, provided the adversary plays a role in shaping requirements and maintains a degree of exclusivity to the malware.

Some aspects of malware development, such as C2 protocol development, may require adversaries to obtain additional infrastructure. For example, malware developed that will communicate with Twitter for C2, may require use of [[T1583_Acquire Infrastructure#Web Services - T1583 006|Web Services (T1583.006)]].[5](https://www2.fireeye.com/rs/848-DID-242/images/rpt-apt29-hammertoss.pdf)

#### Code Signing Certificate - T1587.002
[more on T1587.002](https://attack.mitre.org/techniques/T1587/002)

Adversaries may create self-signed code signing certificates that can be used during targeting. Code signing is the process of digitally signing executables and scripts to confirm the software author and guarantee that the code has not been altered or corrupted. Code signing provides a level of authenticity for a program from the developer and a guarantee that the program has not been tampered with.[1](https://en.wikipedia.org/wiki/Code_signing) Users and/or security tools may trust a signed piece of code more than an unsigned piece of code even if they don't know who issued the certificate or who the author is.

Prior to [[T1553_Subvert Trust Controls#Code Signing - T1553 002|Code Signing (T1553.002)]], adversaries may develop self-signed code signing certificates for use in operations.

#### Digital Certificates - T1587.003
[more on T1587.003](https://attack.mitre.org/techniques/T1587/003)

Adversaries may create self-signed SSL/TLS certificates that can be used during targeting. SSL/TLS certificates are designed to instill trust. They include information about the key, information about its owner's identity, and the digital signature of an entity that has verified the certificate's contents are correct. If the signature is valid, and the person examining the certificate trusts the signer, then they know they can use that key to communicate with its owner. In the case of self-signing, digital certificates will lack the element of trust associated with the signature of a third-party certificate authority (CA).

Adversaries may create self-signed SSL/TLS certificates that can be used to further their operations, such as encrypting C2 traffic (ex: [[T1573_Encrypted Channel#Asymmetric Cryptography - T1573 002|Asymmetric Cryptography (T1573.002)]] with [[T1071_Application Layer Protocol#Web Protocols - T1071 001|Web Protocols (T1071.001)]]) or even enabling [[T1557_Adversary-in-the-Middle|Adversary-in-the-Middle (T1557)]] if added to the root of trust (i.e. [[T1553_Subvert Trust Controls#Install Root Certificate - T1553 004|Install Root Certificate (T1553.004)]]).

After creating a digital certificate, an adversary may then install that certificate (see [[T1608_Stage Capabilities#Install Digital Certificate - T1608 003|Install Digital Certificate (T1608.003)]]) on infrastructure under their control.

#### Exploits - T1587.004
[more on T1587.004](https://attack.mitre.org/techniques/T1587/004)

Adversaries may develop exploits that can be used during targeting. An exploit takes advantage of a bug or vulnerability in order to cause unintended or unanticipated behavior to occur on computer hardware or software. Rather than finding/modifying exploits from online or purchasing them from exploit vendors, an adversary may develop their own exploits.[1](https://www.nytimes.com/2011/01/16/world/middleeast/16stuxnet.html) Adversaries may use information acquired via [[T1588_Obtain Capabilities#Vulnerabilities - T1588 006|Vulnerabilities (T1588.006)]] to focus exploit development efforts. As part of the exploit development process, adversaries may uncover exploitable vulnerabilities through methods such as fuzzing and patch analysis.[2](https://www.irongeek.com/i.php?page=videos/bsidescharm2017/bsidescharm-2017-t111-microsoft-patch-analysis-for-exploitation-stephen-sims)

As with legitimate development efforts, different skill sets may be required for developing exploits. The skills needed may be located in-house, or may need to be contracted out. Use of a contractor may be considered an extension of that adversary's exploit development capabilities, provided the adversary plays a role in shaping requirements and maintains an initial degree of exclusivity to the exploit.

Adversaries may use exploits during various phases of the adversary lifecycle (i.e. [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]], [[T1203_Exploitation for Client Execution|Exploitation for Client Execution (T1203)]], [[T1068_Exploitation for Privilege Escalation|Exploitation for Privilege Escalation (T1068)]], [[T1211_Exploitation for Defense Evasion|Exploitation for Defense Evasion (T1211)]], [[T1212_Exploitation for Credential Access|Exploitation for Credential Access (T1212)]], [[T1210_Exploitation of Remote Services|Exploitation of Remote Services (T1210)]], and [[T1499_Endpoint Denial of Service#Application or System Exploitation - T1499 004|Application or System Exploitation (T1499.004)]]).


