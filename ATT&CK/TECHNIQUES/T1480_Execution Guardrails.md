Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1480  

# Execution Guardrails - T1480
---
## Description
[more on T1480](https://attack.mitre.org/techniques/T1480)

Adversaries may use execution guardrails to constrain execution or actions based on adversary supplied and environment specific conditions that are expected to be present on the target. Guardrails ensure that a payload only executes against an intended target and reduces collateral damage from an adversary’s campaign.[1](https://www.cyberscoop.com/kevin-mandia-fireeye-u-s-malware-nice/) Values an adversary can provide about a target system or environment to use as guardrails may include specific network share names, attached physical devices, files, joined Active Directory (AD) domains, and local/external IP addresses.[2](https://www.fireeye.com/blog/threat-research/2019/12/breaking-the-rules-tough-outlook-for-home-page-attacks.html)

Guardrails can be used to prevent exposure of capabilities in environments that are not intended to be compromised or operated within. This use of guardrails is distinct from typical [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]]. While use of [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]] may involve checking for known sandbox values and continuing with execution only if there is no match, the use of guardrails will involve checking for an expected target-specific value and only continuing with execution if there is such a match.

---
## Sub-Techniques

#### Environmental Keying - T1480.001
[more on T1480.001](https://attack.mitre.org/techniques/T1480/001)

Adversaries may environmentally key payloads or other features of malware to evade defenses and constraint execution to a specific target environment. Environmental keying uses cryptography to constrain execution or actions based on adversary supplied environment specific conditions that are expected to be present on the target. Environmental keying is an implementation of [[T1480_Execution Guardrails|Execution Guardrails (T1480)]] that utilizes cryptographic techniques for deriving encryption/decryption keys from specific types of values in a given computing environment.[1](https://www.schneier.com/academic/paperfiles/paper-clueless-agents.pdf)

Values can be derived from target-specific elements and used to generate a decryption key for an encrypted payload. Target-specific values can be derived from specific network shares, physical devices, software/software versions, files, joined AD domains, system time, and local/external IP addresses.[2](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/20134940/kaspersky-lab-gauss.pdf)[3](https://www.proofpoint.com/us/threat-insight/post/home-routers-under-attack-malvertising-windows-android-devices)[4](https://pdfs.semanticscholar.org/2721/3d206bc3c1e8c229fb4820b6af09e7f975da.pdf)[5](https://research.nccgroup.com/2017/08/08/smuggling-hta-files-in-internet-explorer-edge/)[6](https://github.com/Genetic-Malware/Ebowla/blob/master/Eko_2016_Morrow_Pitts_Master.pdf) By generating the decryption keys from target-specific environmental values, environmental keying can make sandbox detection, anti-virus detection, crowdsourcing of information, and reverse engineering difficult.[2](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/20134940/kaspersky-lab-gauss.pdf)[6](https://github.com/Genetic-Malware/Ebowla/blob/master/Eko_2016_Morrow_Pitts_Master.pdf) These difficulties can slow down the incident response process and help adversaries hide their tactics, techniques, and procedures (TTPs).

Similar to [[T1027_Obfuscated Files or Information|Obfuscated Files or Information (T1027)]], adversaries may use environmental keying to help protect their TTPs and evade detection. Environmental keying may be used to deliver an encrypted payload to the target that will use target-specific values to decrypt the payload before execution.[2](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/20134940/kaspersky-lab-gauss.pdf)[4](https://pdfs.semanticscholar.org/2721/3d206bc3c1e8c229fb4820b6af09e7f975da.pdf)[5](https://research.nccgroup.com/2017/08/08/smuggling-hta-files-in-internet-explorer-edge/)[6](https://github.com/Genetic-Malware/Ebowla/blob/master/Eko_2016_Morrow_Pitts_Master.pdf)[7](https://github.com/nccgroup/demiguise/blob/master/examples/virginkey.js) By utilizing target-specific values to decrypt the payload the adversary can avoid packaging the decryption key with the payload or sending it over a potentially monitored network connection. Depending on the technique for gathering target-specific values, reverse engineering of the encrypted payload can be exceptionally difficult.[2](https://media.kasperskycontenthub.com/wp-content/uploads/sites/43/2018/03/20134940/kaspersky-lab-gauss.pdf) This can be used to prevent exposure of capabilities in environments that are not intended to be compromised or operated within.

Like other [[T1480_Execution Guardrails|Execution Guardrails (T1480)]], environmental keying can be used to prevent exposure of capabilities in environments that are not intended to be compromised or operated within. This activity is distinct from typical [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]]. While use of [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion (T1497)]] may involve checking for known sandbox values and continuing with execution only if there is no match, the use of environmental keying will involve checking for an expected target-specific value that must match for decryption and subsequent execution to be successful.
