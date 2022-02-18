Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1140  

# Deobfuscate/Decode Files or Information - T1140
---
## Description
[more on T1140](https://attack.mitre.org/techniques/T1140)

Adversaries may use [[T1027_Obfuscated Files or Information|Obfuscated Files or Information (T1027)]] to hide artifacts of an intrusion from analysis. They may require separate mechanisms to decode or deobfuscate that information depending on how they intend to use it. Methods for doing that include built-in functionality of malware or by using utilities present on the system.

One such example is use of [certutil](https://attack.mitre.org/software/S0160) to decode a remote access tool portable executable file that has been hidden inside a certificate file. [1](https://blog.malwarebytes.com/cybercrime/social-engineering-cybercrime/2017/03/new-targeted-attack-saudi-arabia-government/) Another example is using the Windows `copy /b` command to reassemble binary fragments into a malicious payload. [2](https://www.carbonblack.com/2016/09/23/security-advisory-variants-well-known-adware-families-discovered-include-sophisticated-obfuscation-techniques-previously-associated-nation-state-attacks/)

Sometimes a user's action may be required to open it for deobfuscation or decryption as part of [[T1204_User Execution|User Execution (T1204)]]. The user may also be required to input a password to open a password protected compressed/encrypted file that was provided by the adversary. [3](https://www.volexity.com/blog/2016/11/09/powerduke-post-election-spear-phishing-campaigns-targeting-think-tanks-and-ngos/)

---
## Sub-Techniques

#### none