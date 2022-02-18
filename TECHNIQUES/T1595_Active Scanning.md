Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1595 

# Active Scanning - T1595
---
## Description
[more on T1595](https://attack.mitre.org/techniques/T1595)

Adversaries may execute active reconnaissance scans to gather information that can be used during targeting. Active scans are those where the adversary probes victim infrastructure via network traffic, as opposed to other forms of reconnaissance that do not involve direct interaction.

Adversaries may perform different forms of active scanning depending on what information they seek to gather. These scans can also be performed in various ways, including using native features of network protocols such as ICMP.[1](https://www.caida.org/publications/papers/2012/analysis_slash_zero/analysis_slash_zero.pdf)[2](https://wiki.owasp.org/index.php/OAT-004_Fingerprinting) Information from these scans may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]]).

---
## Sub-Techniques

#### Scanning IP Blocks  - T1595.001
[more on T1595.001](https://attack.mitre.org/techniques/T1595/001)

Adversaries may scan victim IP blocks to gather information that can be used during targeting. Public IP addresses may be allocated to organizations by block, or a range of sequential addresses.

Adversaries may scan IP blocks in order to [[T1590_Gather Victim Network Information|Gather Victim Network Information (T1590)]], such as which IP addresses are actively in use as well as more detailed information about hosts assigned these addresses. Scans may range from simple pings (ICMP requests and responses) to more nuanced scans that may reveal host software/versions via server banners or other network artifacts.[1](https://www.caida.org/publications/papers/2012/analysis_slash_zero/analysis_slash_zero.pdf) Information from these scans may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Gather Victim Network Information (T1593)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]]).

#### Vulnerability Scanning  - T1595.002
[xVulnerabilty Scanning](https://attack.mitre.org/techniques/T1595/002)

Adversaries may scan victims for vulnerabilities that can be used during targeting. Vulnerability scans typically check if the configuration of a target host/application (ex: software and version) potentially aligns with the target of a specific exploit the adversary may seek to use.

These scans may also include more broad attempts to [[T1592_Gather Victim Host Information|Gather Victim Host Information (T1592)]] that can be used to identify more commonly known, exploitable vulnerabilities. Vulnerability scans typically harvest running software and version numbers via server banners, listening ports, or other network artifacts.[1](https://wiki.owasp.org/index.php/OAT-014_Vulnerability_Scanning) Information from these scans may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]]).
