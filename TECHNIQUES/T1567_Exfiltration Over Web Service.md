Tactics: [[EXFILTRATION]]
Tags: #mitre/attack/techniques/T1567  

# Exfiltration Over Web Service - T1567
---
## Description
[more on T1567](https://attack.mitre.org/techniques/T1567)

Adversaries may use an existing, legitimate external Web service to exfiltrate data rather than their primary command and control channel. Popular Web services acting as an exfiltration mechanism may give a significant amount of cover due to the likelihood that hosts within a network are already communicating with them prior to compromise. Firewall rules may also already exist to permit traffic to these services.

Web service providers also commonly use SSL/TLS encryption, giving adversaries an added level of protection.

---
## Sub-Techniques

#### Exfiltration to Code Repository - T1567.001
[more on T1567.001](https://attack.mitre.org/techniques/T1567/001)

Adversaries may exfiltrate data to a code repository rather than over their primary command and control channel. Code repositories are often accessible via an API (ex: https://api.github.com). Access to these APIs are often over HTTPS, which gives the adversary an additional level of protection.

Exfiltration to a code repository can also provide a significant amount of cover to the adversary if it is a popular service already used by hosts within the network.

#### Exfiltration to Cloud Storage - T1567.002
[more on T1567.002](https://attack.mitre.org/techniques/T1567/002)

Adversaries may exfiltrate data to a cloud storage service rather than over their primary command and control channel. Cloud storage services allow for the storage, edit, and retrieval of data from a remote cloud storage server over the Internet.

Examples of cloud storage services include Dropbox and Google Docs. Exfiltration to these cloud storage services can provide a significant amount of cover to the adversary if hosts within the network are already communicating with the service.

