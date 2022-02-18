Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1485  

# Data Destruction - T1485
---
## Description
[more on T1485](https://attack.mitre.org/techniques/T1485)

Adversaries may destroy data and files on specific systems or in large numbers on a network to interrupt availability to systems, services, and network resources. Data destruction is likely to render stored data irrecoverable by forensic techniques through overwriting files or data on local and remote drives.[1](https://www.symantec.com/connect/blogs/shamoon-attacks)[2](https://www.fireeye.com/blog/threat-research/2016/11/fireeye_respondsto.html)[3](http://researchcenter.paloaltonetworks.com/2016/11/unit42-shamoon-2-return-disttrack-wiper/)[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/07180722/Report_Shamoon_StoneDrill_final.pdf)[5](https://unit42.paloaltonetworks.com/shamoon-3-targets-oil-gas-organization/)[6](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html) Common operating system file deletion commands such as `del` and `rm` often only remove pointers to files without wiping the contents of the files themselves, making the files recoverable by proper forensic methodology. This behavior is distinct from [[T1561_Disk Wipe#Disk Content Wipe - T1561 001|Disk Content Wipe (T1561.001)]] and [[T1561_Disk Wipe#Disk Structure Wipe - T1561 002|Disk Structure Wipe (T1561.002)]] because individual files are destroyed rather than sections of a storage disk or the disk's logical structure.

Adversaries may attempt to overwrite files and directories with randomly generated data to make it irrecoverable.[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/07180722/Report_Shamoon_StoneDrill_final.pdf)[5](https://unit42.paloaltonetworks.com/shamoon-3-targets-oil-gas-organization/) In some cases politically oriented image files have been used to overwrite data.[2](https://www.fireeye.com/blog/threat-research/2016/11/fireeye_respondsto.html)[3](http://researchcenter.paloaltonetworks.com/2016/11/unit42-shamoon-2-return-disttrack-wiper/)[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/07180722/Report_Shamoon_StoneDrill_final.pdf)

To maximize impact on the target organization in operations where network-wide availability interruption is the goal, malware designed for destroying data may have worm-like features to propagate across a network by leveraging additional techniques like [[T1078_Valid Accounts|Valid Accounts (T1078)]], [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]], and [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]].[1](https://www.symantec.com/connect/blogs/shamoon-attacks)[2](https://www.fireeye.com/blog/threat-research/2016/11/fireeye_respondsto.html)[3](http://researchcenter.paloaltonetworks.com/2016/11/unit42-shamoon-2-return-disttrack-wiper/)[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/07180722/Report_Shamoon_StoneDrill_final.pdf)[6](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html).

In cloud environments, adversaries may leverage access to delete cloud storage, cloud storage accounts, machine images, and other infrastructure crucial to operations to damage an organization or their customers.[7](https://threatpost.com/hacker-puts-hosting-service-code-spaces-out-of-business/106761/)[8](https://www.justice.gov/usao-ndca/pr/san-jose-man-pleads-guilty-damaging-cisco-s-network)

---
## Sub-Techniques

#### none

