Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1657

# Financial Theft - T1657
---
## Description
[more on T1657](https://attack.mitre.org/techniques/T1657)

Adversaries may steal monetary resources from targets through extortion, social engineering, technical theft, or other methods aimed at their own financial gain at the expense of the availability of these resources for victims. Financial theft is the ultimate objective of several popular campaign types including extortion by ransomware, [1](https://www.cisa.gov/sites/default/files/Ransomware_Trifold_e-version.pdf) business email compromise (BEC) and fraud, [2](https://www.fbi.gov/file-repository/fy-2022-fbi-congressional-report-business-email-compromise-and-real-estate-wire-fraud-111422.pdf/view) "pig butchering," [3](https://www.wired.com/story/pig-butchering-fbi-ic3-2022-report/) bank hacking, [4](https://www.justice.gov/usao-cdca/pr/3-north-korean-military-hackers-indicted-wide-ranging-scheme-commit-cyber-attacks-and) and exploiting cryptocurrency networks. [5](https://www.bbc.com/news/technology-60933174)

Adversaries may [Compromise Accounts](https://attack.mitre.org/techniques/T1586) to conduct unauthorized transfers of funds. [6](https://www.ic3.gov/Media/PDF/AnnualReport/2022_IC3Report.pdf) In the case of business email compromise or email fraud, an adversary may utilize [Impersonation](https://attack.mitre.org/techniques/T1656) of a trusted entity. Once the social engineering is successful, victims can be deceived into sending money to financial accounts controlled by an adversary. [2](https://www.fbi.gov/file-repository/fy-2022-fbi-congressional-report-business-email-compromise-and-real-estate-wire-fraud-111422.pdf/view) This creates the potential for multiple victims (i.e., compromised accounts as well as the ultimate monetary loss) in incidents involving financial theft. [7](https://www.cloudflare.com/learning/email-security/what-is-vendor-email-compromise/#:~:text=Vendor%20email%20compromise%2C%20also%20referred,steal%20from%20that%20vendor%27s%20customers.)

Extortion by ransomware may occur, for example, when an adversary demands payment from a victim after [Data Encrypted for Impact](https://attack.mitre.org/techniques/T1486)  [8](https://www.nytimes.com/2021/05/13/technology/colonial-pipeline-ransom.html) and [Exfiltration](https://attack.mitre.org/tactics/TA0010) of data, followed by threatening to leak sensitive data to the public unless payment is made to the adversary. [9](https://www.mandiant.com/resources/blog/ransomware-extortion-ot-docs) Adversaries may use dedicated leak sites to distribute victim data. [10](https://www.crowdstrike.com/blog/double-trouble-ransomware-data-leak-extortion-part-1/)

Due to the potentially immense business impact of financial theft, an adversary may abuse the possibility of financial theft and seeking monetary gain to divert attention from their true goals such as [Data Destruction](https://attack.mitre.org/techniques/T1485) and business disruption. [11](https://apnews.com/article/russia-ukraine-technology-business-europe-hacking-ce7a8aca506742ab8e8873e7f9f229c2)

