Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1560  

# Archive Collected Data - T1560
---
## Description
[more on T1560](https://attack.mitre.org/techniques/T1560)

An adversary may compress and/or encrypt data that is collected prior to exfiltration. Compressing the data can help to obfuscate the collected data and minimize the amount of data sent over the network. Encryption can be used to hide information that is being exfiltrated from detection or make exfiltration less conspicuous upon inspection by a defender.

Both compression and encryption are done prior to exfiltration, and can be performed using a utility, 3rd party library, or custom method.

---
## Sub-Techniques

#### Archive via Utility - T1560.001
[more on T1560.001](https://attack.mitre.org/techniques/T1560/001)

An adversary may compress or encrypt data that is collected prior to exfiltration using 3rd party utilities. Many utilities exist that can archive data, including 7-Zip[1](https://www.7-zip.org/), WinRAR[2](https://www.rarlab.com/), and WinZip[3](https://www.winzip.com/win/en/). Most utilities include functionality to encrypt and/or compress data.

Some 3rd party utilities may be preinstalled, such as `tar` on Linux and macOS or `zip` on Windows systems.

#### Archive via Library - T1560.002
[more on T1560.002](https://attack.mitre.org/techniques/T1560/002)

An adversary may compress or encrypt data that is collected prior to exfiltration using 3rd party libraries. Many libraries exist that can archive data, including [[T1059_Command and Scripting Interpreter#Python - T1059 006|Python (T1059.006)]] rarfile [1](https://pypi.org/project/rarfile/), libzip [2](https://libzip.org/), and zlib [3](https://github.com/madler/zlib). Most libraries include functionality to encrypt and/or compress data.

Some archival libraries are preinstalled on systems, such as bzip2 on macOS and Linux, and zip on Windows. Note that the libraries are different from the utilities. The libraries can be linked against when compiling, while the utilities require spawning a subshell, or a similar execution mechanism.

#### Archive via Custom Method - T1560.003
[more on T1560.003](https://attack.mitre.org/techniques/T1560/003)

An adversary may compress or encrypt data that is collected prior to exfiltration using a custom method. Adversaries may choose to use custom archival methods, such as encryption with XOR or stream ciphers implemented with no external library or utility references. Custom implementations of well-known compression algorithms have also been used.[1](http://www.welivesecurity.com/wp-content/uploads/2016/10/eset-sednit-part-2.pdf)



