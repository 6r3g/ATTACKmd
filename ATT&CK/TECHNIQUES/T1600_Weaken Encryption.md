Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1600  

# Weaken Encryption - T1600
---
## Description
[more on T1600](https://attack.mitre.org/techniques/T1600)

Adversaries may compromise a network device’s encryption capability in order to bypass encryption that would otherwise protect data communications. [1](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices)

Encryption can be used to protect transmitted network traffic to maintain its confidentiality (protect against unauthorized disclosure) and integrity (protect against unauthorized changes). Encryption ciphers are used to convert a plaintext message to ciphertext and can be computationally intensive to decipher without the associated decryption key. Typically, longer keys increase the cost of cryptanalysis, or decryption without the key.

Adversaries can compromise and manipulate devices that perform encryption of network traffic. For example, through behaviors such as [[T1601_Modify System Image|Modify System Image (T1601)]], [[T1600_Weaken Encryption#Reduce Key Space - T1600 001|Reduce Key Space (T1600.001)]], and [[T1600_Weaken Encryption#Disable Crypto Hardware - T1600 002|Disable Crypto Hardware (T1600.002)]], an adversary can negatively effect and/or eliminate a device’s ability to securely encrypt network traffic. This poses a greater risk of unauthorized disclosure and may help facilitate data manipulation, Credential Access, or Collection efforts. [2](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

---
## Sub-Techniques

#### Reduce Key-Space - T1600.001
[more on T1600.001](https://attack.mitre.org/techniques/T1600/001)

Adversaries may reduce the level of effort required to decrypt data transmitted over the network by reducing the cipher strength of encrypted communications.[1](https://blogs.cisco.com/security/evolution-of-attacks-on-cisco-ios-devices)

Adversaries can weaken the encryption software on a compromised network device by reducing the key size used by the software to convert plaintext to ciphertext (e.g., from hundreds or thousands of bytes to just a couple of bytes). As a result, adversaries dramatically reduce the amount of effort needed to decrypt the protected information without the key.

Adversaries may modify the key size used and other encryption parameters using specialized commands in a [[T1059_Command and Scripting Interpreter#Network Device CLI - T1059 008|Network Device CLI (T1059.008)]] introduced to the system through [[T1601_Modify System Image|Modify System Image (T1601)]] to change the configuration of the device. [2](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

#### Disable Crypto Hardware - T1600.002
[more on T1600.002](https://attack.mitre.org/techniques/T1600/002)

Adversaries disable a network device’s dedicated hardware encryption, which may enable them to leverage weaknesses in software encryption in order to reduce the effort involved in collecting, manipulating, and exfiltrating transmitted data.

Many network devices such as routers, switches, and firewalls, perform encryption on network traffic to secure transmission across networks. Often, these devices are equipped with special, dedicated encryption hardware to greatly increase the speed of the encryption process as well as to prevent malicious tampering. When an adversary takes control of such a device, they may disable the dedicated hardware, for example, through use of [[T1601_Modify System Image|Modify System Image (T1601)]], forcing the use of software to perform encryption on general processors. This is typically used in conjunction with attacks to weaken the strength of the cipher in software (e.g., [[T1600_Weaken Encryption#Reduce Key Space - T1600 001|Reduce Key Space (T1600.001)]]). [1](https://community.cisco.com/t5/security-blogs/attackers-continue-to-target-legacy-devices/ba-p/4169954)

