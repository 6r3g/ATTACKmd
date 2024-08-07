Tactics: [[RESOURCES_DEVELOPMENT]]
Tags: #mitre/attack/techniques/T1585 

# Establish Accounts - T1585
---
## Description
[more on T1585](https://attack.mitre.org/techniques/T1585)

Adversaries may create and cultivate accounts with services that can be used during targeting. Adversaries can create accounts that can be used to build a persona to further operations. Persona development consists of the development of public information, presence, history and appropriate affiliations. This development could be applied to social media, website, or other publicly available information that could be referenced and scrutinized for legitimacy over the course of an operation using that persona or identity.[1](https://www.securityweek.com/iranian-hackers-targeted-us-officials-elaborate-social-media-attack-operation)[2](http://media.blackhat.com/bh-us-10/whitepapers/Ryan/BlackHat-USA-2010-Ryan-Getting-In-Bed-With-Robin-Sage-v1.0.pdf)

For operations incorporating social engineering, the utilization of an online persona may be important. These personas may be fictitious or impersonate real people. The persona may exist on a single site or across multiple sites (ex: Facebook, LinkedIn, Twitter, Google, GitHub, Docker Hub, etc.). Establishing a persona may require development of additional documentation to make them seem real. This could include filling out profile information, developing social networks, or incorporating photos.[1](https://www.securityweek.com/iranian-hackers-targeted-us-officials-elaborate-social-media-attack-operation)[2](http://media.blackhat.com/bh-us-10/whitepapers/Ryan/BlackHat-USA-2010-Ryan-Getting-In-Bed-With-Robin-Sage-v1.0.pdf)

Establishing accounts can also include the creation of accounts with email providers, which may be directly leveraged for [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1566_Phishing|Phishing (T1566)]].[3](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf)

---
## Sub-Techniques

#### Social Media Accounts - T1585.001
[more on T1585.001](https://attack.mitre.org/techniques/T1585/001)

Adversaries may create and cultivate social media accounts that can be used during targeting. Adversaries can create social media accounts that can be used to build a persona to further operations. Persona development consists of the development of public information, presence, history and appropriate affiliations.[1](https://www.securityweek.com/iranian-hackers-targeted-us-officials-elaborate-social-media-attack-operation)[2](http://media.blackhat.com/bh-us-10/whitepapers/Ryan/BlackHat-USA-2010-Ryan-Getting-In-Bed-With-Robin-Sage-v1.0.pdf)

For operations incorporating social engineering, the utilization of a persona on social media may be important. These personas may be fictitious or impersonate real people. The persona may exist on a single social media site or across multiple sites (ex: Facebook, LinkedIn, Twitter, etc.). Establishing a persona on social media may require development of additional documentation to make them seem real. This could include filling out profile information, developing social networks, or incorporating photos.

Once a persona has been developed an adversary can use it to create connections to targets of interest. These connections may be direct or may include trying to connect through others.[1](https://www.securityweek.com/iranian-hackers-targeted-us-officials-elaborate-social-media-attack-operation)[2](http://media.blackhat.com/bh-us-10/whitepapers/Ryan/BlackHat-USA-2010-Ryan-Getting-In-Bed-With-Robin-Sage-v1.0.pdf) These accounts may be leveraged during other phases of the adversary lifecycle, such as during Initial Access (ex: [[T1566_Phishing#Spearphishing via Service - T1566 003|Spearphishing via Service (T1566.003)]]).

#### Email Accounts - T1585.002
[more on T1585.002](https://attack.mitre.org/techniques/T1585/002)

Adversaries may create email accounts that can be used during targeting. Adversaries can use accounts created with email providers to further their operations, such as leveraging them to conduct [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1566_Phishing|Phishing (T1566)]].[1](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf) Adversaries may also take steps to cultivate a persona around the email account, such as through use of [[T1585_Establish Accounts#Social Media Accounts - T1585 001|Social Media Accounts (T1585.001)]], to increase the chance of success of follow-on behaviors. Created email accounts can also be used in the acquisition of infrastructure (ex: [[T1583_Acquire Infrastructure#Domains - T1583 001|Domains (T1583.001)]]).[1](https://www.fireeye.com/content/dam/fireeye-www/services/pdfs/mandiant-apt1-report.pdf)

To decrease the chance of physically tying back operations to themselves, adversaries may make use of disposable email services.[2](https://blog.trendmicro.com/trendlabs-security-intelligence/r980-ransomware-disposable-email-service/)


#### Cloud Accounts - T1583.003
[more on T1585.003](https://attack.mitre.org/techniques/T1585/003)

Adversaries may create accounts with cloud providers that can be used during targeting. Adversaries can use cloud accounts to further their operations, including leveraging cloud storage services such as Dropbox, MEGA, Microsoft OneDrive, or AWS S3 buckets for [[T1567_Exfiltration Over Web Service#Exfiltration to Cloud Storage - T1567.002|Exfiltration to Cloud Storage]] or to [[T1608_Stage Capabilities#Upload Tool - T1608.002|Upload Tool]]s. Cloud accounts can also be used in the acquisition of infrastructure, such as [[T1583_Acquire Infrastructure#Virtual Private Server - T1583.003|Virtual Private Server]]s or [[T1583_Acquire Infrastructure#Serverless - T1583.007|Serverless]] infrastructure. Establishing cloud accounts may allow adversaries to develop sophisticated capabilities without managing their own servers. [1](https://awakesecurity.com/blog/threat-hunting-series-detecting-command-control-in-the-cloud/)

Creating [[T1585_Establish Accounts#Cloud Accounts - T1583.003|Cloud Accounts]] may also require adversaries to establish [[T1585_Establish Accounts#Email Accounts - T1585.002|Email Accounts]] to register with the cloud provider.

