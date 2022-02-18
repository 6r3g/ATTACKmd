Tactics: [[PERSISTENCE]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1542  

# Pre-OS Boot - T1542
---
## Description
[more on T1542](https://attack.mitre.org/techniques/T1542)

Adversaries may abuse Pre-OS Boot mechanisms as a way to establish persistence on a system. During the booting process of a computer, firmware and various startup services are loaded before the operating system. These programs control flow of execution before the operating system takes control.[1](https://en.wikipedia.org/wiki/Booting)

Adversaries may overwrite data in boot drivers or firmware such as BIOS (Basic Input/Output System) and The Unified Extensible Firmware Interface (UEFI) to persist on systems at a layer below the operating system. This can be particularly difficult to detect as malware at this level will not be detected by host software-based defenses.

---
## Sub-Techniques

#### System Firmware - T1542.001
[more on T1542.001](https://attack.mitre.org/techniques/T1542/001)

Adversaries may modify system firmware to persist on systems.The BIOS (Basic Input/Output System) and The Unified Extensible Firmware Interface (UEFI) or Extensible Firmware Interface (EFI) are examples of system firmware that operate as the software interface between the operating system and hardware of a computer. [1](https://en.wikipedia.org/wiki/BIOS) [2](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface) [3](http://www.uefi.org/about)

System firmware like BIOS and (U)EFI underly the functionality of a computer and may be modified by an adversary to perform or assist in malicious activity. Capabilities exist to overwrite the system firmware, which may give sophisticated adversaries a means to install malicious firmware updates as a means of persistence on a system that may be difficult to detect.

#### Component Firmware - T1542.002
[more on T1542.002](https://attack.mitre.org/techniques/T1542/002)

Adversaries may modify component firmware to persist on systems. Some adversaries may employ sophisticated means to compromise computer components and install malicious firmware that will execute adversary code outside of the operating system and main system firmware or BIOS. This technique may be similar to [[T1542_Pre-OS Boot#System Firmware - T1542 001|System Firmware (T1542.001)]] but conducted upon other system components/devices that may not have the same capability or level of integrity checking.

Malicious component firmware could provide both a persistent level of access to systems despite potential typical failures to maintain access and hard disk re-images, as well as a way to evade host software-based defenses and integrity checks.

#### BootKit - T1542.003
[more on T1542.003](https://attack.mitre.org/techniques/T1542/003)

Adversaries may use bootkits to persist on systems. Bootkits reside at a layer below the operating system and may make it difficult to perform full remediation unless an organization suspects one was used and can act accordingly.

A bootkit is a malware variant that modifies the boot sectors of a hard drive, including the Master Boot Record (MBR) and Volume Boot Record (VBR). [1](https://www.fireeye.com/content/dam/fireeye-www/current-threats/pdfs/rpt-mtrends-2016.pdf) The MBR is the section of disk that is first loaded after completing hardware initialization by the BIOS. It is the location of the boot loader. An adversary who has raw access to the boot drive may overwrite this area, diverting execution during startup from the normal boot loader to adversary code. [2](http://www.symantec.com/connect/blogs/are-mbr-infections-back-fashion)

The MBR passes control of the boot process to the VBR. Similar to the case of MBR, an adversary who has raw access to the boot drive may overwrite the VBR to divert execution during startup to adversary code.

#### ROMMONkit - T1542.004
[more on T1542.004](https://attack.mitre.org/techniques/T1542/004)

Adversaries may abuse the ROM Monitor (ROMMON) by loading an unauthorized firmware with adversary code to provide persistent access and manipulate device behavior that is difficult to detect. [1](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices)[2](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

ROMMON is a Cisco network device firmware that functions as a boot loader, boot image, or boot helper to initialize hardware and software when the platform is powered on or reset. Similar to [[T1542_Pre-OS Boot#TFTP Boot - T1542 005|TFTP Boot (T1542.005)]], an adversary may upgrade the ROMMON image locally or remotely (for example, through TFTP) with adversary code and restart the device in order to overwrite the existing ROMMON image. This provides adversaries with the means to update the ROMMON to gain persistence on a system in a way that may be difficult to detect.

#### TFTP Boot - T1542.005
[more on T1542.005](https://attack.mitre.org/techniques/T1542/005)

Adversaries may abuse netbooting to load an unauthorized network device operating system from a Trivial File Transfer Protocol (TFTP) server. TFTP boot (netbooting) is commonly used by network administrators to load configuration-controlled network device images from a centralized management server. Netbooting is one option in the boot sequence and can be used to centralize, manage, and control device images.

Adversaries may manipulate the configuration on the network device specifying use of a malicious TFTP server, which may be used in conjunction with [[T1601_Modify System Image|Modify System Image (T1601)]] to load a modified image on device startup or reset. The unauthorized image allows adversaries to modify device configuration, add malicious capabilities to the device, and introduce backdoors to maintain control of the network device while minimizing detection through use of a standard functionality. This technique is similar to [[T1542_Pre-OS Boot#ROMMONkit - T1542 004|ROMMONkit (T1542.004)]] and may result in the network device running a modified image. [1](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

