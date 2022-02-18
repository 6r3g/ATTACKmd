Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1591 

# Gather Victim Org Information - T1591
---
## Description
[more on T1591](https://attack.mitre.org/techniques/T1591)

Adversaries may gather information about the victim's organization that can be used during targeting. Information about an organization may include a variety of details, including the names of divisions/departments, specifics of business operations, as well as the roles and responsibilities of key employees.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about an organization may also be exposed to adversaries via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://threatpost.com/broadvoice-leaks-350m-records-voicemail-transcripts/160158/)[2](https://www.sec.gov/edgar/search-and-access) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]] or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

---
## Sub-Techniques

#### Determine Physical Locations - T1591.001
[more on T1591.001](https://attack.mitre.org/techniques/T1591/001)

Adversaries may gather the victim's physical location(s) that can be used during targeting. Information about physical locations of a target organization may include a variety of details, including where key resources and infrastructure are housed. Physical locations may also indicate what legal jurisdiction and/or authorities the victim operates within.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Physical locations of a target organization may also be exposed to adversaries via online or other accessible data sets (ex: [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]] or [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]]).[1](https://threatpost.com/broadvoice-leaks-350m-records-voicemail-transcripts/160158/)[2](https://www.sec.gov/edgar/search-and-access) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1587_Develop Capabilities|Develop Capabilities (T1587)]] or [[T1588_Obtain Capabilities|Obtain Capabilities (T1588)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]] or [[T1200_Hardware Additions|Hardware Additions (T1200)]]).

#### Business Relationships - T1591.002
[more on T1591.002](https://attack.mitre.org/techniques/T1591/002)

Adversaries may gather information about the victim's business relationships that can be used during targeting. Information about an organization’s business relationships may include a variety of details, including second or third-party organizations/domains (ex: managed service providers, contractors, etc.) that have connected (and potentially elevated) network access. This information may also reveal supply chains and shipment paths for the victim’s hardware and software resources.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about business relationships may also be exposed to adversaries via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://threatpost.com/broadvoice-leaks-350m-records-voicemail-transcripts/160158/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1195_Supply Chain Compromise|Supply Chain Compromise (T1195)]], [[T1189_Drive-by Compromise|Drive-by Compromise (T1189)]] , or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]]).

#### Identify Business Tempo - T1591.003
[more on T1591.003](https://attack.mitre.org/techniques/T1591/003)

Adversaries may gather information about the victim's business tempo that can be used during targeting. Information about an organization’s business tempo may include a variety of details, including operational hours/days of the week. This information may also reveal times/dates of purchases and shipments of the victim’s hardware and software resources.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about business tempo may also be exposed to adversaries via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://threatpost.com/broadvoice-leaks-350m-records-voicemail-transcripts/160158/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1195_Supply Chain Compromise|Supply Chain Compromise (T1195)]] or [[T1199_Trusted Relationship|Trusted Relationship (T1199)]])

#### Identify Roles - T1591.004
[more on T1591.004](https://attack.mitre.org/techniques/T1591/004)

Adversaries may gather information about identities and roles within the victim organization that can be used during targeting. Information about business roles may reveal a variety of targetable details, including identifiable information for key personnel as well as what data/resources they have access to.

Adversaries may gather this information in various ways, such as direct elicitation via [[T1598_Phishing for Information|Phishing for Information (T1598)]]. Information about business roles may also be exposed to adversaries via online or other accessible data sets (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]).[1](https://threatpost.com/broadvoice-leaks-350m-records-voicemail-transcripts/160158/) Gathering this information may reveal opportunities for other forms of reconnaissance (ex: [[T1598_Phishing for Information|Phishing for Information (T1598)]] or [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]]), establishing operational resources (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]), and/or initial access (ex: [[T1566_Phishing|Phishing (T1566)]]).