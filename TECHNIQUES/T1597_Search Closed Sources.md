Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1597 

# Search Closed Sources - T1597
---
## Description
[more on T1597](https://attack.mitre.org/techniques/T1597)

Adversaries may search and gather information about victims from closed sources that can be used during targeting. Information about victims may be available for purchase from reputable private sources and databases, such as paid subscriptions to feeds of technical/threat intelligence data.[1](https://d3security.com/blog/10-of-the-best-open-source-threat-intelligence-feeds/) Adversaries may also purchase information from less-reputable sources such as dark web or cybercrime blackmarkets.[2](https://www.zdnet.com/article/a-hacker-group-is-selling-more-than-73-million-user-records-on-the-dark-web/)

Adversaries may search in different closed databases depending on what information they seek to gather. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1078_Valid Accounts|Valid Accounts (T1078)]]).

---
## Sub-Techniques

#### Threat Intel Vendors - T1597.001
[more on T1597.001](https://attack.mitre.org/techniques/T1597/001)

Adversaries may search private data from threat intelligence vendors for information that can be used during targeting. Threat intelligence vendors may offer paid feeds or portals that offer more data than what is publicly reported. Although sensitive details (such as customer names and other identifiers) may be redacted, this information may contain trends regarding breaches such as target industries, attribution claims, and successful TTPs/countermeasures.[1](https://d3security.com/blog/10-of-the-best-open-source-threat-intelligence-feeds/)

Adversaries may search in private threat intelligence vendor data to gather actionable information. Threat actors may seek information/indicators gathered about their own campaigns, as well as those conducted by other adversaries that may align with their target industries, capabilities/objectives, or other operational concerns. Information reported by vendors may also reveal opportunities other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]] or [[T1133_External Remote Services|External Remote Services (T1133)]]).

#### Purchase Technical Data - T1597.002
[more on T1597.002](https://attack.mitre.org/techniques/T1597/002)

Adversaries may purchase technical information about victims that can be used during targeting. Information about victims may be available for purchase within reputable private sources and databases, such as paid subscriptions to feeds of scan databases or other data aggregation services. Adversaries may also purchase information from less-reputable sources such as dark web or cybercrime blackmarkets.

Adversaries may purchase information about their already identified targets, or use purchased data to discover opportunities for successful breaches. Threat actors may gather various technical details from purchased data, including but not limited to employee contact information, credentials, or specifics regarding a victim’s infrastructure.[1](https://www.zdnet.com/article/a-hacker-group-is-selling-more-than-73-million-user-records-on-the-dark-web/) Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1078_Valid Accounts|Valid Accounts (T1078)]]).

