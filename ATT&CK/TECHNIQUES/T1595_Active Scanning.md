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
[more on T1595.002](https://attack.mitre.org/techniques/T1595/002)

Adversaries may scan victims for vulnerabilities that can be used during targeting. Vulnerability scans typically check if the configuration of a target host/application (ex: software and version) potentially aligns with the target of a specific exploit the adversary may seek to use.

These scans may also include more broad attempts to [[T1592_Gather Victim Host Information|Gather Victim Host Information (T1592)]] that can be used to identify more commonly known, exploitable vulnerabilities. Vulnerability scans typically harvest running software and version numbers via server banners, listening ports, or other network artifacts.[1](https://wiki.owasp.org/index.php/OAT-014_Vulnerability_Scanning) Information from these scans may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]]).

#### Wordlist Scanning - T1595.003
[more on T1595.003](https://attack.mitre.org/techniques/T1595/003)

Adversaries may iteratively probe infrastructure using brute-forcing and crawling techniques. While this technique employs similar methods to [[T1110_Brute Force|Brute Force]], its goal is the identification of content and infrastructure rather than the discovery of valid credentials. Wordlists used in these scans may contain generic, commonly used names and file extensions or terms specific to a particular software. Adversaries may also create custom, target-specific wordlists using data gathered from other Reconnaissance techniques (ex: [[T1591_Gather Victim Org Information|Gather Victim Org Information]], or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites]]).

For example, adversaries may use web content discovery tools such as Dirb, DirBuster, and GoBuster and generic or custom wordlists to enumerate a website’s pages and directories. [1](https://www.clearskysec.com/wp-content/uploads/2021/01/Lebanese-Cedar-APT.pdf) This can help them to discover old, vulnerable pages or hidden administrative portals that could become the target of further operations (ex: [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application]] or [[T1110_Brute Force|Brute Force]]).

As cloud storage solutions typically use globally unique names, adversaries may also use target-specific wordlists and tools such as s3recon and GCPBucketBrute to enumerate public and private buckets on cloud infrastructure. [2](https://github.com/clarketm/s3recon) [3](https://rhinosecuritylabs.com/gcp/google-cloud-platform-gcp-bucket-enumeration/) Once storage objects are discovered, adversaries may leverage [[T1530_Data from Cloud Storage Object|Data from Cloud Storage]] to access valuable information that can be exfiltrated or used to escalate privileges and move laterally.

