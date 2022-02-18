Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1589 

# Gather Victim Identity Information - T1589
---
## Description
[more on T1589](https://attack.mitre.org/techniques/T1589)

Adversaries may gather information about the victim's identity that can be used during targeting. Information about identities may include a variety of details, including personal data (ex: employee names, email addresses, etc.) as well as sensitive details such as credentials.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about victims may also be exposed to adversaries via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://www.opm.gov/cybersecurity/cybersecurity-incidents/)[2](https://www.theregister.com/2017/09/26/deloitte_leak_github_and_google/)[3](https://www.theregister.com/2015/02/28/uber_subpoenas_github_for_hacker_details/)[4](https://labs.detectify.com/2016/04/28/slack-bot-token-leakage-exposing-business-critical-information/)[5](https://www.forbes.com/sites/runasandvik/2014/01/14/attackers-scrape-github-for-cloud-service-credentials-hijack-account-to-mine-virtual-currency/#242c479d3196)[6](https://github.com/dxa4481/truffleHog)[7](https://github.com/michenriksen/gitrob)[8](https://www.cnet.com/news/massive-breach-leaks-773-million-emails-21-million-passwords/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]] or [[T1078_Valid Accounts|Valid Accounts (T1078)]]).

---
## Sub-Techniques

#### Credentials - T1589.001
[more on T1589.001](https://attack.mitre.org/techniques/T1589/001)

Adversaries may gather credentials that can be used during targeting. Account credentials gathered by adversaries may be those directly associated with the target victim organization or attempt to take advantage of the tendency for users to use the same passwords across personal and business accounts.

Adversaries may gather credentials from potential victims in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Adversaries may also compromise sites then include malicious content designed to collect website authentication cookies from visitors.[1](https://cybersecurity.att.com/blogs/labs-research/scanbox-a-reconnaissance-framework-used-on-watering-hole-attacks) Credential information may also be exposed to adversaries via leaks to online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Search Engines - T1593 002|Search Engines (T1593.002)]], breach dumps, code repositories, etc.).[2](https://www.theregister.com/2017/09/26/deloitte_leak_github_and_google/)[3](https://www.theregister.com/2015/02/28/uber_subpoenas_github_for_hacker_details/)[4](https://labs.detectify.com/2016/04/28/slack-bot-token-leakage-exposing-business-critical-information/)[5](https://www.forbes.com/sites/runasandvik/2014/01/14/attackers-scrape-github-for-cloud-service-credentials-hijack-account-to-mine-virtual-currency/#242c479d3196)[6](https://github.com/dxa4481/truffleHog)[7](https://github.com/michenriksen/gitrob)[8](https://www.cnet.com/news/massive-breach-leaks-773-million-emails-21-million-passwords/) Adversaries may also purchase credentials from dark web or other black-markets. Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1133_External Remote Services|External Remote Services (T1133)]] or [[T1078_Valid Accounts|Valid Accounts (T1078)]]).

#### Email Addresses - T1589.002
[more on T1589.002](https://attack.mitre.org/techniques/T1589/002)

Adversaries may gather email addresses that can be used during targeting. Even if internal instances exist, organizations may have public-facing email infrastructure and addresses for employees.

Adversaries may easily gather email addresses, since they may be readily available and exposed via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://www.hackers-arise.com/email-scraping-and-maltego)[2](https://www.cnet.com/news/massive-breach-leaks-773-million-emails-21-million-passwords/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1586_Compromise Accounts#Email Accounts - T1586 002|Email Accounts (T1586.002)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]]).

#### Employee Names - T1589.003
[more on T1589.003](https://attack.mitre.org/techniques/T1589/003)

Adversaries may gather employee names that can be used during targeting. Employee names be used to derive email addresses as well as to help guide other reconnaissance efforts and/or craft more-believable lures.

Adversaries may easily gather employee names, since they may be readily available and exposed via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://www.opm.gov/cybersecurity/cybersecurity-incidents/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1598_Phishing for Information|Phishing for Information (T1598)]]), establishing operational resources (ex: [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]] or [[T1078_Valid Accounts|Valid Accounts (T1078)]]).