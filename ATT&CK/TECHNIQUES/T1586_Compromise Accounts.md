Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1586 

# Compromise Accounts - T1586
---
## Description
[more on T1586](https://attack.mitre.org/techniques/T1586)

Adversaries may compromise accounts with services that can be used during targeting. For operations incorporating social engineering, the utilization of an online persona may be important. Rather than creating and cultivating accounts (i.e. [[T1585_Establish Accounts|Establish Accounts (T1585)]], adversaries may compromise existing accounts. Utilizing an existing persona may engender a level of trust in a potential victim if they have a relationship, or knowledge of, the compromised persona.

A variety of methods exist for compromising accounts, such as gathering credentials via [[T1598_Phishing for Information|Phishing for Information (T1598)]], purchasing credentials from third-party sites, or by brute forcing credentials (ex: password reuse from breach credential dumps).[1](https://arstechnica.com/tech-policy/2011/02/anonymous-speaks-the-inside-story-of-the-hbgary-hack/) Prior to compromising accounts, adversaries may conduct Reconnaissance to inform decisions about which accounts to compromise to further their operation.

Personas may exist on a single site or across multiple sites (ex: Facebook, LinkedIn, Twitter, Google, etc.). Compromised accounts may require additional development, this could include filling out or modifying profile information, further developing social networks, or incorporating photos.

Adversaries may directly leverage compromised email accounts for [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1566_Phishing|Phishing (T1566)]].

---
## Sub-Techniques

#### Social Media Accounts - T1586.001
[more on T1586.001](https://attack.mitre.org/techniques/T1586/001)

Adversaries may compromise social media accounts that can be used during targeting. For operations incorporating social engineering, the utilization of an online persona may be important. Rather than creating and cultivating social media profiles (i.e. [[T1585_Establish Accounts#Social Media Accounts - T1585 001|Social Media Accounts (T1585.001)]]), adversaries may compromise existing social media accounts. Utilizing an existing persona may engender a level of trust in a potential victim if they have a relationship, or knowledge of, the compromised persona.

A variety of methods exist for compromising social media accounts, such as gathering credentials via [[T1598_Phishing for Information|Phishing for Information (T1598)]], purchasing credentials from third-party sites, or by brute forcing credentials (ex: password reuse from breach credential dumps).[1](https://arstechnica.com/tech-policy/2011/02/anonymous-speaks-the-inside-story-of-the-hbgary-hack/) Prior to compromising social media accounts, adversaries may conduct Reconnaissance to inform decisions about which accounts to compromise to further their operation.

Personas may exist on a single site or across multiple sites (ex: Facebook, LinkedIn, Twitter, etc.). Compromised social media accounts may require additional development, this could include filling out or modifying profile information, further developing social networks, or incorporating photos.

Adversaries can use a compromised social media profile to create new, or hijack existing, connections to targets of interest. These connections may be direct or may include trying to connect through others.[2](https://www.securityweek.com/iranian-hackers-targeted-us-officials-elaborate-social-media-attack-operation)[3](http://media.blackhat.com/bh-us-10/whitepapers/Ryan/BlackHat-USA-2010-Ryan-Getting-In-Bed-With-Robin-Sage-v1.0.pdf) Compromised profiles may be leveraged during other phases of the adversary lifecycle, such as during Initial Access (ex: [[T1566_Phishing#Spearphishing via Service - T1566 003|Spearphishing via Service (T1566.003)]]).

#### Email Accounts - T1586.002
[more on T1586.002](https://attack.mitre.org/techniques/T1586/002)

Adversaries may compromise email accounts that can be used during targeting. Adversaries can use compromised email accounts to further their operations, such as leveraging them to conduct [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1566_Phishing|Phishing (T1566)]]. Utilizing an existing persona with a compromised email account may engender a level of trust in a potential victim if they have a relationship, or knowledge of, the compromised persona. Compromised email accounts can also be used in the acquisition of infrastructure (ex: [[T1583_Acquire Infrastructure#Domains - T1583 001|Domains (T1583.001)]]).

A variety of methods exist for compromising email accounts, such as gathering credentials via [[T1598_Phishing for Information|Phishing for Information (T1598)]], purchasing credentials from third-party sites, or by brute forcing credentials (ex: password reuse from breach credential dumps).[1](https://arstechnica.com/tech-policy/2011/02/anonymous-speaks-the-inside-story-of-the-hbgary-hack/) Prior to compromising email accounts, adversaries may conduct Reconnaissance to inform decisions about which accounts to compromise to further their operation.

Adversaries can use a compromised email account to hijack existing email threads with targets of interest.

#### Cloud Accounts - T1586.003
[more on T1586.003](https://attack.mitre.org/techniques/T1586/003)

Adversaries may compromise cloud accounts that can be used during targeting. Adversaries can use compromised cloud accounts to further their operations, including leveraging cloud storage services such as Dropbox, Microsoft OneDrive, or AWS S3 buckets for [[T1567_Exfiltration Over Web Service#Exfiltration to Cloud Storage - T1567.002|Exfiltration to Cloud Storage]] or to [[T1608_Stage Capabilities#Upload Tool - T1608.002|Upload Tool]]s. Cloud accounts can also be used in the acquisition of infrastructure, such as [[T1583_Acquire Infrastructure#Virtual Private Server - T1583.003|Virtual Private Server]]s or [[T1583_Acquire Infrastructure#Serverless - T1583.007|Serverless]] infrastructure. Compromising cloud accounts may allow adversaries to develop sophisticated capabilities without managing their own servers. [1](https://awakesecurity.com/blog/threat-hunting-series-detecting-command-control-in-the-cloud/)

A variety of methods exist for compromising cloud accounts, such as gathering credentials via [[T1598_Phishing for Information|Phishing for Information]], purchasing credentials from third-party sites, conducting [[T1110_Brute Force#Password Spraying - T1110.003|Password Spraying]] attacks, or attempting to [[T1528_Steal Application Access Token|Steal Application Access Token]]s. [2](https://www.microsoft.com/security/blog/2021/10/25/nobelium-targeting-delegated-administrative-privileges-to-facilitate-broader-attacks/) Prior to compromising cloud accounts, adversaries may conduct Reconnaissance to inform decisions about which accounts to compromise to further their operation. In some cases, adversaries may target privileged service provider accounts with the intent of leveraging a [[T1199_Trusted Relationship|Trusted Relationship]] between service providers and their customers. [2](https://www.microsoft.com/security/blog/2021/10/25/nobelium-targeting-delegated-administrative-privileges-to-facilitate-broader-attacks/)

