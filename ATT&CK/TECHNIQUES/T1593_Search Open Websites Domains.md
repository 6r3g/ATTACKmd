Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1593 

# Search Open Websites Domains - T1593
---
## Description
[more on T1593](https://attack.mitre.org/techniques/T1593)

Adversaries may search freely available websites and/or domains for information about victims that can be used during targeting. Information about victims may be available in various online sites, such as social media, new sites, or those hosting information about business operations such as hiring or requested/rewarded contracts.[1](https://cyware.com/news/how-hackers-exploit-social-media-to-break-into-your-company-88e8da8e)[2](https://securitytrails.com/blog/google-hacking-techniques)[3](https://www.exploit-db.com/google-hacking-database)

Adversaries may search in different online sites depending on what information they seek to gather. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases (T1596)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1566_Phishing|Phishing (T1566)]]).

---
## Sub-Techniques

#### Social Media - T1593.001
[more on T1593.001](https://attack.mitre.org/techniques/T1593/001)

Adversaries may search social media for information about victims that can be used during targeting. Social media sites may contain various information about a victim organization, such as business announcements as well as information about the roles, locations, and interests of staff.

Adversaries may search in different social media sites depending on what information they seek to gather. Threat actors may passively harvest data from these sites, as well as use information gathered to create fake profiles/groups to elicit victim’s into revealing specific information (i.e. [[T1598_Phishing for Information#Spearphishing Service - T1598 001|Spearphishing Service (T1598.001)]]).[1](https://cyware.com/news/how-hackers-exploit-social-media-to-break-into-your-company-88e8da8e) Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases (T1596)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1566_Phishing#Spearphishing via Service - T1566 003|Spearphishing via Service (T1566.003)]]).

#### Search Engines - T1593.002
[more on T1593.002](https://attack.mitre.org/techniques/T1593/002)

Adversaries may use search engines to collect information about victims that can be used during targeting. Search engine services typical crawl online sites to index context and may provide users with specialized syntax to search for specific keywords or specific types of content (i.e. filetypes).[1](https://securitytrails.com/blog/google-hacking-techniques)[2](https://www.exploit-db.com/google-hacking-database)

Adversaries may craft various search engine queries depending on what information they seek to gather. Threat actors may use search engines to harvest general information about victims, as well as use specialized queries to look for spillages/leaks of sensitive information such as network details or credentials. Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1596_Search Open Technical Databases|Search Open Technical Databases (T1596)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1078_Valid Accounts|Valid Accounts (T1078)]] or [[T1566_Phishing|Phishing (T1566)]]).


#### Code Repositories - T1593.003
[more on T1593.003](https://attack.mitre.org/techniques/T1593/003)

Adversaries may search public code repositories for information about victims that can be used during targeting. Victims may store code in repositories on various third-party websites such as GitHub, GitLab, SourceForge, and BitBucket. Users typically interact with code repositories through a web application or command-line utilities such as git.

Adversaries may search various public code repositories for various information about a victim. Public code repositories can often be a source of various general information about victims, such as commonly used programming languages and libraries as well as the names of employees. Adversaries may also identify more sensitive data, including accidentally leaked credentials or API keys. [1](https://www.forbes.com/sites/runasandvik/2014/01/14/attackers-scrape-github-for-cloud-service-credentials-hijack-account-to-mine-virtual-currency/) Information from these sources may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information]]), establishing operational resources (ex: [[T1586_Compromise Accounts|Compromise Accounts]] or [[T1584_Compromise Infrastructure|Compromise Infrastructure]]), and/or initial access (ex: [[T1078_Valid Accounts|Valid Accounts]] or [[T1566_Phishing|Phishing]]).

**Note:** This is distinct from [[T1213_Data from Information Repositories#Code Repositories - T1213.003|Code Repositories]], which focuses on [[COLLECTION|Collection]] from private and internally hosted code repositories.

