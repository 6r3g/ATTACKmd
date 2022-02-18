Tactics: [[EXFILTRATION]]
Tags: #mitre/attack/techniques/T1048  

# Exfiltration Over Alternative Protocol - T1048
---
## Description
[more on T1048](https://attack.mitre.org/techniques/T1048)

Adversaries may steal data by exfiltrating it over a different protocol than that of the existing command and control channel. The data may also be sent to an alternate network location from the main command and control server.

Alternate protocols include FTP, SMTP, HTTP/S, DNS, SMB, or any other network protocol not being used as the main command and control channel. Different protocol channels could also include Web services such as cloud storage. Adversaries may also opt to encrypt and/or obfuscate these alternate channels.

[[T1048_Exfiltration Over Alternative Protocol|Exfiltration Over Alternative Protocol (T1048)]] can be done using various common operating system utilities such as [Net](https://attack.mitre.org/software/S0039)/SMB or FTP.[1](http://researchcenter.paloaltonetworks.com/2016/10/unit42-oilrig-malware-campaign-updates-toolset-and-expands-targets/) On macOS and Linux `curl` may be used to invoke protocols such as HTTP/S or FTP/S to exfiltrate data from a system.[2](https://labs.sentinelone.com/20-common-tools-techniques-used-by-macos-threat-actors-malware/)

---
## Sub-Techniques

#### Exfiltration Over Symmetric Encrypted Non-C2 Protocol - T1048.001
[more on T1048.001](https://attack.mitre.org/techniques/T1048/001)

Adversaries may steal data by exfiltrating it over a symmetrically encrypted network protocol other than that of the existing command and control channel. The data may also be sent to an alternate network location from the main command and control server.

Symmetric encryption algorithms are those that use shared or the same keys/secrets on each end of the channel. This requires an exchange or pre-arranged agreement/possession of the value used to encrypt and decrypt data.

Network protocols that use asymmetric encryption often utilize symmetric encryption once keys are exchanged, but adversaries may opt to manually share keys and implement symmetric cryptographic algorithms (ex: RC4, AES) vice using mechanisms that are baked into a protocol. This may result in multiple layers of encryption (in protocols that are natively encrypted such as HTTPS) or encryption in protocols that not typically encrypted (such as HTTP or FTP).

#### Exfiltration Over Asymmetric Encrypted Non-C2 Protocol - T1048.002
[more on T1048.002](https://attack.mitre.org/techniques/T1048/002)

Adversaries may steal data by exfiltrating it over an asymmetrically encrypted network protocol other than that of the existing command and control channel. The data may also be sent to an alternate network location from the main command and control server.

Asymmetric encryption algorithms are those that use different keys on each end of the channel. Also known as public-key cryptography, this requires pairs of cryptographic keys that can encrypt/decrypt data from the corresponding key. Each end of the communication channels requires a private key (only in the procession of that entity) and the public key of the other entity. The public keys of each entity are exchanged before encrypted communications begin.

Network protocols that use asymmetric encryption (such as HTTPS/TLS/SSL) often utilize symmetric encryption once keys are exchanged. Adversaries may opt to use these encrypted mechanisms that are baked into a protocol.

#### Exfiltration Over Unencrypted/Obfuscated Non-C2 Protocol - T10148.003
[more on T1048.003](https://attack.mitre.org/techniques/T1048/003)

Adversaries may steal data by exfiltrating it over an un-encrypted network protocol other than that of the existing command and control channel. The data may also be sent to an alternate network location from the main command and control server.

Adversaries may opt to obfuscate this data, without the use of encryption, within network protocols that are natively unencrypted (such as HTTP, FTP, or DNS). This may include custom or publicly available encoding/compression algorithms (such as base64) as well as embedding data within protocol headers and fields.


