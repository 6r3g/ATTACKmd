Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1207  

# Rogue Domain Controller - T1207
---
## Description
[more on T1207](https://attack.mitre.org/techniques/T1207)

Adversaries may register a rogue Domain Controller to enable manipulation of Active Directory data. DCShadow may be used to create a rogue Domain Controller (DC). DCShadow is a method of manipulating Active Directory (AD) data, including objects and schemas, by registering (or reusing an inactive registration) and simulating the behavior of a DC. [1](https://www.dcshadow.com/) Once registered, a rogue DC may be able to inject and replicate changes into AD infrastructure for any domain object, including credentials and keys.

Registering a rogue DC involves creating a new server and nTDSDSA objects in the Configuration partition of the AD schema, which requires Administrator privileges (either Domain or local to the DC) or the KRBTGT hash. [2](https://adsecurity.org/?page_id=1821)

This technique may bypass system logging and security monitors such as security information and event management (SIEM) products (since actions taken on a rogue DC may not be reported to these sensors). [1](https://www.dcshadow.com/) The technique may also be used to alter and delete replication and other associated metadata to obstruct forensic analysis. Adversaries may also utilize this technique to perform [[T1134_Access Token Manipulation#SID-History Injection - T1134 005|SID-History Injection (T1134.005)]] and/or manipulate AD objects (such as accounts, access control lists, schemas) to establish backdoors for Persistence. [1](https://www.dcshadow.com/)

---
## Sub-Techniques

#### none
