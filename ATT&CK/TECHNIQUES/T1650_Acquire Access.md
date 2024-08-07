Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1650

# Acquire Access - T1650
---
## Description
[more on T1650](https://attack.mitre.org/techniques/T1650)

Adversaries may purchase or otherwise acquire an existing access to a target system or network. A variety of online services and initial access broker networks are available to sell access to previously compromised systems. [1](https://www.microsoft.com/en-us/security/blog/2022/05/09/ransomware-as-a-service-understanding-the-cybercrime-gig-economy-and-how-to-protect-yourself/) [2](https://www.crowdstrike.com/blog/access-brokers-targets-and-worth/) [3](https://krebsonsecurity.com/2012/10/service-sells-access-to-fortune-500-firms/) In some cases, adversary groups may form partnerships to share compromised systems with each other. [4](https://www.cisa.gov/news-events/cybersecurity-advisories/aa22-152a)

Footholds to compromised systems may take a variety of forms, such as access to planted backdoors (e.g., [[T1505_Server Software Component#Web Shell - T1505.003|Web Shell]]) or established access via [[T1133_External Remote Services|External Remote Services]]. In some cases, access brokers will implant compromised systems with a "load" that can be used to install additional malware for paying customers. [1](https://www.microsoft.com/en-us/security/blog/2022/05/09/ransomware-as-a-service-understanding-the-cybercrime-gig-economy-and-how-to-protect-yourself/)

By leveraging existing access broker networks rather than developing or obtaining their own initial access capabilities, an adversary can potentially reduce the resources required to gain a foothold on a target network and focus their efforts on later stages of compromise. Adversaries may prioritize acquiring access to systems that have been determined to lack security monitoring or that have high privileges, or systems that belong to organizations in a particular sector. [1](https://www.microsoft.com/en-us/security/blog/2022/05/09/ransomware-as-a-service-understanding-the-cybercrime-gig-economy-and-how-to-protect-yourself/) [2](https://www.crowdstrike.com/blog/access-brokers-targets-and-worth/)

In some cases, purchasing access to an organization in sectors such as IT contracting, software development, or telecommunications may allow an adversary to compromise additional victims via a [[T1199_Trusted Relationship|Trusted Relationship]], [[T1111_Two-Factor Authentication Interception|Multi-Factor Authentication Interception]], or even [[T1195_Supply Chain Compromise|Supply Chain Compromise]].

**Note:** while this technique is distinct from other behaviors such as [[T1597_Search Closed Sources#Purchase Technical Data - T1597.002|Purchase Technical Data]] and [[T1589_Gather Victim Identity Information#Credentials - T1589.001|Credentials]], they may often be used in conjunction (especially where the acquired foothold requires [[T1078_Valid Accounts|Valid Accounts]]).

