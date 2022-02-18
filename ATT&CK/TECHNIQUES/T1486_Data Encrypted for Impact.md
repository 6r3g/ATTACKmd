Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1486  

# Data Encrypted for Impact - T1486
---
## Description
[more on T1486](https://attack.mitre.org/techniques/T1486)

Adversaries may encrypt data on target systems or on large numbers of systems in a network to interrupt availability to system and network resources. They can attempt to render stored data inaccessible by encrypting files or data on local and remote drives and withholding access to a decryption key. This may be done in order to extract monetary compensation from a victim in exchange for decryption or a decryption key (ransomware) or to render data permanently inaccessible in cases where the key is not saved or transmitted.[1](https://www.us-cert.gov/ncas/alerts/TA16-091A)[2](https://www.fireeye.com/blog/threat-research/2017/05/wannacry-malware-profile.html)[3](https://www.us-cert.gov/ncas/alerts/TA17-181A)[4](https://www.us-cert.gov/ncas/alerts/AA18-337A) In the case of ransomware, it is typical that common user files like Office documents, PDFs, images, videos, audio, text, and source code files will be encrypted. In some cases, adversaries may encrypt critical system files, disk partitions, and the MBR.[3](https://www.us-cert.gov/ncas/alerts/TA17-181A)

To maximize impact on the target organization, malware designed for encrypting data may have worm-like features to propagate across a network by leveraging other attack techniques like [[T1078_Valid Accounts|Valid Accounts (T1078)]], [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]], and [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]].[2](https://www.fireeye.com/blog/threat-research/2017/05/wannacry-malware-profile.html)[3](https://www.us-cert.gov/ncas/alerts/TA17-181A)

In cloud environments, storage objects within compromised accounts may also be encrypted.[5](https://rhinosecuritylabs.com/aws/s3-ransomware-part-1-attack-vector/)

---
## Sub-Techniques

#### none
