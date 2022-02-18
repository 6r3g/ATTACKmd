Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1573  

# Encrypted Channel - T1573
---
## Description
[more on T1573](https://attack.mitre.org/techniques/T1573)

Adversaries may employ a known encryption algorithm to conceal command and control traffic rather than relying on any inherent protections provided by a communication protocol. Despite the use of a secure algorithm, these implementations may be vulnerable to reverse engineering if secret keys are encoded and/or generated within malware samples/configuration files.

---
## Sub-Techniques

#### Symmetric Cryptography - T1573.001
[more on T1573.001](https://attack.mitre.org/techniques/T1573/001)

Adversaries may employ a known symmetric encryption algorithm to conceal command and control traffic rather than relying on any inherent protections provided by a communication protocol. Symmetric encryption algorithms use the same key for plaintext encryption and ciphertext decryption. Common symmetric encryption algorithms include AES, DES, 3DES, Blowfish, and RC4.

#### Asymmetric Cryptography - T1573.002
[more on T1573.002](https://attack.mitre.org/techniques/T1573/002)

Adversaries may employ a known asymmetric encryption algorithm to conceal command and control traffic rather than relying on any inherent protections provided by a communication protocol. Asymmetric cryptography, also known as public key cryptography, uses a keypair per party: one public that can be freely distributed, and one private. Due to how the keys are generated, the sender encrypts data with the receiver’s public key and the receiver decrypts the data with their private key. This ensures that only the intended recipient can read the encrypted data. Common public key encryption algorithms include RSA and ElGamal.

For efficiency, many protocols (including SSL/TLS) use symmetric cryptography once a connection is established, but use asymmetric cryptography to establish or transmit a key. As such, these protocols are classified as [[T1573_Encrypted Channel#Asymmetric Cryptography - T1573 002|Asymmetric Cryptography (T1573.002)]].



