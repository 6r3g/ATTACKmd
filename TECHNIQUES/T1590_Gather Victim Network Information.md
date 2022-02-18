Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1590 

# Gather Victim Network Information - T1590
--- 
## Description

[more on T1590](https://attack.mitre.org/techniques/T1590)

Adversaries may gather information about the victim's networks that can be used during targeting. Information about networks may include a variety of details, including administrative data (ex: IP ranges, domain names, etc.) as well as specifics regarding its topology and operations.

Adversaries may gather this information in various ways, such as direct collection actions via [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about networks may also be exposed to adversaries via online or other accessible data sets (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]).[1](https://www.whois.net/)[2](https://dnsdumpster.com/)[3](https://www.circl.lu/services/passive-dns/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

---
## Sub-Techniques

#### Domain Properties - T1590.001
[more on T1590.001](https://attack.mitre.org/techniques/T1590/001)

Adversaries may gather information about the victim's network domain(s) that can be used during targeting. Information about domains and their properties may include a variety of details, including what domain(s) the victim owns as well as administrative data (ex: name, registrar, etc.) and more directly actionable information such as contacts (email addresses and phone numbers), business addresses, and name servers.

Adversaries may gather this information in various ways, such as direct collection actions via [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about victim domains and their properties may also be exposed to adversaries via online or other accessible data sets (ex: [[T1596_Search Open Technical Databases#WHOIS - T1596 002|WHOIS (T1596.002)]]).[1](https://www.whois.net/)[2](https://dnsdumpster.com/)[3](https://www.circl.lu/services/passive-dns/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]], [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]], or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]]).

#### DNS - T1590.002
[more on T1590.002](https://attack.mitre.org/techniques/T1590/002)

Adversaries may gather information about the victim's DNS that can be used during targeting. DNS information may include a variety of details, including registered name servers as well as records that outline addressing for a target’s subdomains, mail servers, and other hosts.

Adversaries may gather this information in various ways, such as querying or otherwise collecting details via [[T1596_Search Open Technical Databases#DNS/Passive DNS - T1596 001|DNS/Passive DNS (T1596.001)]]. DNS information may also be exposed to adversaries via online or other accessible data sets (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]).[1](https://dnsdumpster.com/)[2](https://www.circl.lu/services/passive-dns/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]], [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]], or [[T1595_Active Scanning|Active Scanning (T1595)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]]).

#### Network Trust Dependencies - T1590.003
[more on T1590.003](https://attack.mitre.org/techniques/T1590/003)

Adversaries may gather information about the victim's network trust dependencies that can be used during targeting. Information about network trusts may include a variety of details, including second or third-party organizations/domains (ex: managed service providers, contractors, etc.) that have connected (and potentially elevated) network access.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about network trusts may also be exposed to adversaries via online or other accessible data sets (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]).[1](https://www.slideshare.net/rootedcon/carlos-garca-pentesting-active-directory-forests-rooted2019) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

#### Network Topology - T1590.004
[more on T1590.004](https://attack.mitre.org/techniques/T1590/004)

Adversaries may gather information about the victim's network topology that can be used during targeting. Information about network topologies may include a variety of details, including the physical and/or logical arrangement of both external-facing and internal network environments. This information may also include specifics regarding network devices (gateways, routers, etc.) and other infrastructure.

Adversaries may gather this information in various ways, such as direct collection actions via [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about network topologies may also be exposed to adversaries via online or other accessible data sets (ex: [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://dnsdumpster.com/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]]).

#### IP Addresses - T1590.005
[more on T1590.005](https://attack.mitre.org/techniques/T1590/005)

Adversaries may gather the victim's IP addresses that can be used during targeting. Public IP addresses may be allocated to organizations by block, or a range of sequential addresses. Information about assigned IP addresses may include a variety of details, such as which IP addresses are in use. IP addresses may also enable an adversary to derive other details about a victim, such as organizational size, physical location(s), Internet service provider, and or where/how their publicly-facing infrastructure is hosted.

Adversaries may gather this information in various ways, such as direct collection actions via [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about assigned IP addresses may also be exposed to adversaries via online or other accessible data sets (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]]).[1](https://www.whois.net/)[2](https://dnsdumpster.com/)[3](https://www.circl.lu/services/passive-dns/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]]).

#### Network Security Appliances - T1590.006
[more on T1590.006](https://attack.mitre.org/techniques/T1590/006)

Adversaries may gather information about the victim's network security appliances that can be used during targeting. Information about network security appliances may include a variety of details, such as the existence and specifics of deployed firewalls, content filters, and proxies/bastion hosts. Adversaries may also target information about victim network-based intrusion detection systems (NIDS) or other appliances related to defensive cybersecurity operations.

Adversaries may gather this information in various ways, such as direct collection actions via [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]].[1](https://nmap.org/book/firewalls.html) Information about network security appliances may also be exposed to adversaries via online or other accessible data sets (ex: [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]). Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1596_Search Open Technical Databases|Search Open Technical Databases(T1596)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]]).

