Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1482  

# Domain Trust Discovery - T1482
---
## Description
[more on T1482](https://attack.mitre.org/techniques/T1482)

Adversaries may attempt to gather information on domain trust relationships that may be used to identify lateral movement opportunities in Windows multi-domain/forest environments. Domain trusts provide a mechanism for a domain to allow access to resources based on the authentication procedures of another domain.[1](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc759554(v=ws.10)) Domain trusts allow the users of the trusted domain to access resources in the trusting domain. The information discovered may help the adversary conduct [[T1134_Access Token Manipulation#SID-History Injection - T1134 005|SID-History Injection (T1134.005)]], [[T1550_Use Alternate Authentication Material#Pass the Ticket - T1550 003|Pass the Ticket (T1550.003)]], and [[T1558_Steal or Forge Kerberos Tickets#Kerberoasting - T1558 003|Kerberoasting (T1558.003)]].[2](https://adsecurity.org/?p=1588)[3](http://www.harmj0y.net/blog/redteaming/a-guide-to-attacking-domain-trusts/) Domain trusts can be enumerated using the `DSEnumerateDomainTrusts()` Win32 API call, .NET methods, and LDAP.[3](http://www.harmj0y.net/blog/redteaming/a-guide-to-attacking-domain-trusts/) The Windows utility [Nltest](https://attack.mitre.org/software/S0359) is known to be used by adversaries to enumerate domain trusts.[4](https://www.microsoft.com/security/blog/2017/05/04/windows-defender-atp-thwarts-operation-wilysupply-software-supply-chain-cyberattack/)

---
## Sub-Techniques

#### none
