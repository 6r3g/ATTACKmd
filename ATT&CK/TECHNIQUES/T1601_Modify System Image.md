Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1601  

# Modify System Image - T1601
---
## Description
[more on T1601](https://attack.mitre.org/techniques/T1601)

Adversaries may make changes to the operating system of embedded network devices to weaken defenses and provide new capabilities for themselves. On such devices, the operating systems are typically monolithic and most of the device functionality and capabilities are contained within a single file.

To change the operating system, the adversary typically only needs to affect this one file, replacing or modifying it. This can either be done live in memory during system runtime for immediate effect, or in storage to implement the change on the next boot of the network device.

---
## Sub-Techniques

#### Patch System Image - T1601.001
[more on T1601.001](https://attack.mitre.org/techniques/T1601/001)

Adversaries may modify the operating system of a network device to introduce new capabilities or weaken existing defenses.[1](https://drwho.virtadpt.net/images/killing_the_myth_of_cisco_ios_rootkits.pdf) [2](https://www.usenix.org/legacy/event/woot/tech/final_files/Cui.pdf) [3](http://2015.zeronights.org/assets/files/05-Nosenko.pdf) [4](https://www.recurity-labs.com/research/RecurityLabs_Developments_in_IOS_Forensics.pdf) [5](https://www.blackhat.com/presentations/bh-usa-09/NEILSON/BHUSA09-Neilson-NetscreenDead-SLIDES.pdf) Some network devices are built with a monolithic architecture, where the entire operating system and most of the functionality of the device is contained within a single file. Adversaries may change this file in storage, to be loaded in a future boot, or in memory during runtime.

To change the operating system in storage, the adversary will typically use the standard procedures available to device operators. This may involve downloading a new file via typical protocols used on network devices, such as TFTP, FTP, SCP, or a console connection. The original file may be overwritten, or a new file may be written alongside of it and the device reconfigured to boot to the compromised image.

To change the operating system in memory, the adversary typically can use one of two methods. In the first, the adversary would make use of native debug commands in the original, unaltered running operating system that allow them to directly modify the relevant memory addresses containing the running operating system. This method typically requires administrative level access to the device.

In the second method for changing the operating system in memory, the adversary would make use of the boot loader. The boot loader is the first piece of software that loads when the device starts that, in turn, will launch the operating system. Adversaries may use malicious code previously implanted in the boot loader, such as through the [[T1542_Pre-OS Boot#ROMMONkit - T1542 004|ROMMONkit (T1542.004)]] method, to directly manipulate running operating system code in memory. This malicious code in the bootloader provides the capability of direct memory manipulation to the adversary, allowing them to patch the live operating system during runtime.

By modifying the instructions stored in the system image file, adversaries may either weaken existing defenses or provision new capabilities that the device did not have before. Examples of existing defenses that can be impeded include encryption, via [[T1600_Weaken Encryption|Weaken Encryption (T1600)]], authentication, via [[T1556_Modify Authentication Process#Network Device Authentication - T1556 004|Network Device Authentication (T1556.004)]], and perimeter defenses, via [[T1599_Network Boundary Bridging|Network Boundary Bridging (T1599)]]. Adding new capabilities for the adversary’s purpose include [[T1056_Input Capture#Keylogging - T1056 001|Keylogging (T1056.001)]], [[T1090_Proxy#Multi-hop Proxy - T1090 003|Multi-hop Proxy (T1090.003)]], and [[T1205_Traffic Signaling#Port Knocking - T1205 001|Port Knocking (T1205.001)]].

Adversaries may also compromise existing commands in the operating system to produce false output to mislead defenders. When this method is used in conjunction with [[T1601_Modify System Image#Downgrade System Image - T1601 002|Downgrade System Image (T1601.002)]], one example of a compromised system command may include changing the output of the command that shows the version of the currently running operating system. By patching the operating system, the adversary can change this command to instead display the original, higher revision number that they replaced through the system downgrade.

When the operating system is patched in storage, this can be achieved in either the resident storage (typically a form of flash memory, which is non-volatile) or via [[T1542_Pre-OS Boot#TFTP Boot - T1542 005|TFTP Boot (T1542.005)]].

When the technique is performed on the running operating system in memory and not on the stored copy, this technique will not survive across reboots. However, live memory modification of the operating system can be combined with [[T1542_Pre-OS Boot#ROMMONkit - T1542 004|ROMMONkit (T1542.004)]] to achieve persistence.

#### Downgrade System Image - T1601.002
[more on T1601.002](https://attack.mitre.org/techniques/T1601/002)

Adversaries may install an older version of the operating system of a network device to weaken security. Older operating system versions on network devices often have weaker encryption ciphers and, in general, fewer/less updated defensive features. [1](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices)

On embedded devices, downgrading the version typically only requires replacing the operating system file in storage. With most embedded devices, this can be achieved by downloading a copy of the desired version of the operating system file and reconfiguring the device to boot from that file on next system restart. The adversary could then restart the device to implement the change immediately or they could wait until the next time the system restarts.

Downgrading the system image to an older versions may allow an adversary to evade defenses by enabling behaviors such as [[T1600_Weaken Encryption|Weaken Encryption (T1600)]]. Downgrading of a system image can be done on its own, or it can be used in conjunction with [[T1601_Modify System Image#Patch System Image - T1601 001|Patch System Image (T1601.001)]].



