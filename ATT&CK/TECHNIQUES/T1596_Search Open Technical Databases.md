Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1596 

# Search Open Technical Databases - T1596
---
## Description
[more on T1596](https://attack.mitre.org/techniques/T1596)

Adversaries may search freely available technical databases for information about victims that can be used during targeting. Information about victims may be available in online databases and repositories, such as registrations of domains/certificates as well as public collections of network data/artifacts gathered from traffic and/or scans.[1](https://www.whois.net/)[2](https://dnsdumpster.com/)[3](https://www.circl.lu/services/passive-dns/)[4](https://medium.com/@menakajain/export-download-ssl-certificate-from-server-site-url-bcfc41ea46a2)[5](https://www.sslshopper.com/ssl-checker.html)[6](https://www.digitalshadows.com/blog-and-research/content-delivery-networks-cdns-can-leave-you-exposed-how-you-might-be-affected-and-what-you-can-do-about-it/)[7](https://shodan.io)

Adversaries may search in different open databases depending on what information they seek to gather. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

---
## Sub-Techniques

#### DNS/Passive DNS - T1596.001
[more on T1596.001](https://attack.mitre.org/techniques/T1596/001)

Adversaries may search DNS data for information about victims that can be used during targeting. DNS information may include a variety of details, including registered name servers as well as records that outline addressing for a target’s subdomains, mail servers, and other hosts.

Adversaries may search DNS data to gather actionable information. Threat actors can query nameservers for a target organization directly, or search through centralized repositories of logged DNS query responses (known as passive DNS).[1](https://dnsdumpster.com/)[2](https://www.circl.lu/services/passive-dns/) Adversaries may also seek and target DNS misconfigurations/leaks that reveal information about internal networks. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

#### WHOIS - T1596.002
[more on T1596.002](https://attack.mitre.org/techniques/T1596/002)

Adversaries may search public WHOIS data for information about victims that can be used during targeting. WHOIS data is stored by regional Internet registries (RIR) responsible for allocating and assigning Internet resources such as domain names. Anyone can query WHOIS servers for information about a registered domain, such as assigned IP blocks, contact information, and DNS nameservers.[1](https://www.whois.net/)

Adversaries may search WHOIS data to gather actionable information. Threat actors can use online resources or command-line utilities to pillage through WHOIS data for information about potential victims. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

#### Digital Certificates - T1596.003
[more on T1596.003](https://attack.mitre.org/techniques/T1596/003)

Adversaries may search public digital certificate data for information about victims that can be used during targeting. Digital certificates are issued by a certificate authority (CA) in order to cryptographically verify the origin of signed content. These certificates, such as those used for encrypted web traffic (HTTPS SSL/TLS communications), contain information about the registered organization such as name and location.

Adversaries may search digital certificate data to gather actionable information. Threat actors can use online resources and lookup tools to harvest information about certificates.[1](https://www.sslshopper.com/ssl-checker.html) Digital certificate data may also be available from artifacts signed by the organization (ex: certificates used from encrypted web traffic are served with content).[2](https://medium.com/@menakajain/export-download-ssl-certificate-from-server-site-url-bcfc41ea46a2) Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

#### CDNs - T1596.004
[more on T1596.004](https://attack.mitre.org/techniques/T1596/004)

Adversaries may search content delivery network (CDN) data about victims that can be used during targeting. CDNs allow an organization to host content from a distributed, load balanced array of servers. CDNs may also allow organizations to customize content delivery based on the requestor’s geographical region.

Adversaries may search CDN data to gather actionable information. Threat actors can use online resources and lookup tools to harvest information about content servers within a CDN. Adversaries may also seek and target CDN misconfigurations that leak sensitive information not intended to be hosted and/or do not have the same protection mechanisms (ex: login portals) as the content hosted on the organization’s website.[1](https://www.digitalshadows.com/blog-and-research/content-delivery-networks-cdns-can-leave-you-exposed-how-you-might-be-affected-and-what-you-can-do-about-it/) Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1583_Acquire Infrastructure|Acquire Infrastructure (T1583)]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure (T1584)]]), and/or initial access (ex: [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]]).

#### Scan Databases - T1596.005
[more on T1596.005](https://attack.mitre.org/techniques/T1596/005)

Adversaries may search within public scan databases for information about victims that can be used during targeting. Various online services continuously publish the results of Internet scans/surveys, often harvesting information such as active IP addresses, hostnames, open ports, certificates, and even server banners.[1](https://shodan.io)

Adversaries may search scan databases to gather actionable information. Threat actors can use online resources and lookup tools to harvest information from these services. Adversaries may seek information about their already identified targets, or use these datasets to discover opportunities for successful breaches. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1595_Active Scanning|Active Scanning (T1595)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1190_Exploit Public-Facing Application|Exploit Public-Facing Application (T1190)]]).


