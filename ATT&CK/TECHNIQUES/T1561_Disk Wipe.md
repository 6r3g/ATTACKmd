Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1561  

# Disk Wipe - T1561
---
## Description
[more on T1561](https://attack.mitre.org/techniques/T1561)

Adversaries may wipe or corrupt raw disk data on specific systems or in large numbers in a network to interrupt availability to system and network resources. With direct write access to a disk, adversaries may attempt to overwrite portions of disk data. Adversaries may opt to wipe arbitrary portions of disk data and/or wipe disk structures like the master boot record (MBR). A complete wipe of all disk sectors may be attempted.

To maximize impact on the target organization in operations where network-wide availability interruption is the goal, malware used for wiping disks may have worm-like features to propagate across a network by leveraging additional techniques like [[T1078_Valid Accounts|Valid Accounts (T1078)]], [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]], and [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]].[1](https://operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Destructive-Malware-Report.pdf)

---
## Sub-Techniques

#### Disk Content Wipe - T1561.001
[more on T1561.001](https://attack.mitre.org/techniques/T1561/001)

Adversaries may erase the contents of storage devices on specific systems or in large numbers in a network to interrupt availability to system and network resources.

Adversaries may partially or completely overwrite the contents of a storage device rendering the data irrecoverable through the storage interface.[1](https://www.operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Report.pdf)[2](https://operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Destructive-Malware-Report.pdf)[3](https://www.justice.gov/opa/press-release/file/1092091/download) Instead of wiping specific disk structures or files, adversaries with destructive intent may wipe arbitrary portions of disk content. To wipe disk content, adversaries may acquire direct access to the hard drive in order to overwrite arbitrarily sized portions of disk with random data.[2](https://operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Destructive-Malware-Report.pdf) Adversaries have been observed leveraging third-party drivers like [RawDisk](https://attack.mitre.org/software/S0364) to directly access disk content.[1](https://www.operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Report.pdf)[2](https://operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Destructive-Malware-Report.pdf) This behavior is distinct from [[T1485_Data Destruction|Data Destruction (T1485)]] because sections of the disk are erased instead of individual files.

To maximize impact on the target organization in operations where network-wide availability interruption is the goal, malware used for wiping disk content may have worm-like features to propagate across a network by leveraging additional techniques like [[T1078_Valid Accounts|Valid Accounts (T1078)]], [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]], and [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]].[2](https://operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Destructive-Malware-Report.pdf)

#### Disk Structure Wipe - T1561.002
[more on T1561.002](https://attack.mitre.org/techniques/T1561/002)

Adversaries may corrupt or wipe the disk data structures on a hard drive necessary to boot a system; targeting specific critical systems or in large numbers in a network to interrupt availability to system and network resources.

Adversaries may attempt to render the system unable to boot by overwriting critical data located in structures such as the master boot record (MBR) or partition table.[1](https://www.symantec.com/connect/blogs/shamoon-attacks)[2](https://www.fireeye.com/blog/threat-research/2016/11/fireeye_respondsto.html)[3](http://researchcenter.paloaltonetworks.com/2016/11/unit42-shamoon-2-return-disttrack-wiper/)[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/07180722/Report_Shamoon_StoneDrill_final.pdf)[5](https://unit42.paloaltonetworks.com/shamoon-3-targets-oil-gas-organization/) The data contained in disk structures may include the initial executable code for loading an operating system or the location of the file system partitions on disk. If this information is not present, the computer will not be able to load an operating system during the boot process, leaving the computer unavailable. [[T1561_Disk Wipe#Disk Structure Wipe - T1561 002|Disk Structure Wipe (T1561.002)]] may be performed in isolation, or along with [[T1561_Disk Wipe#Disk Content Wipe - T1561 001|Disk Content Wipe (T1561.001)]] if all sectors of a disk are wiped.

To maximize impact on the target organization, malware designed for destroying disk structures may have worm-like features to propagate across a network by leveraging other techniques like [[T1078_Valid Accounts|Valid Accounts (T1078)]], [[T1003_OS Credential Dumping|OS Credential Dumping (T1003)]], and [[T1021_Remote Services#SMB/Windows Admin Shares - T1021 002|SMB/Windows Admin Shares (T1021.002)]].[1](https://www.symantec.com/connect/blogs/shamoon-attacks)[2](https://www.fireeye.com/blog/threat-research/2016/11/fireeye_respondsto.html)[3](http://researchcenter.paloaltonetworks.com/2016/11/unit42-shamoon-2-return-disttrack-wiper/)[4](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/07180722/Report_Shamoon_StoneDrill_final.pdf)



