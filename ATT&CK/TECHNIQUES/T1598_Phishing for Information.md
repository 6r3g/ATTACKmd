Tactics: [[RECONNAISSANCE]]
Tags: #mitre/attack/techniques/T1598  

# Phishing for Information - T1598
---
## Description
[more on T1598](https://attack.mitre.org/techniques/T1598)

Adversaries may send phishing messages to elicit sensitive information that can be used during targeting. Phishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information. Phishing for information is different from [[T1566_Phishing|Phishing (T1566)]] in that the objective is gathering data from the victim rather than executing malicious code.

All forms of phishing are electronically delivered social engineering. Phishing can be targeted, known as spearphishing. In spearphishing, a specific individual, company, or industry will be targeted by the adversary. More generally, adversaries can conduct non-targeted phishing, such as in mass credential harvesting campaigns.

Adversaries may also try to obtain information directly through the exchange of emails, instant messages, or other electronic conversation means.[1](https://threatpost.com/facebook-launching-pad-phishing-attacks/160351/)[2](https://www.trendmicro.com/en_us/research/20/i/tricky-forms-of-phishing.html)[3](https://www.pcmag.com/news/hackers-try-to-phish-united-nations-staffers-with-fake-login-pages)[4](https://nakedsecurity.sophos.com/2020/10/02/serious-security-phishing-without-links-when-phishers-bring-along-their-own-web-pages/)[5](https://github.com/ryhanson/phishery) Phishing for information frequently involves social engineering techniques, such as posing as a source with a reason to collect information (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]]) and/or sending multiple, seemingly urgent messages.

---
## Sub-Techniques

#### Spearphishing Service - T1598.001
[more on T1598.001](https://attack.mitre.org/techniques/T1598/001)

Adversaries may send spearphishing messages via third-party services to elicit sensitive information that can be used during targeting. Spearphishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information. Spearphishing for information frequently involves social engineering techniques, such as posing as a source with a reason to collect information (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]] and/or sending multiple, seemingly urgent messages.

All forms of spearphishing are electronically delivered social engineering targeted at a specific individual, company, or industry. In this scenario, adversaries send messages through various social media services, personal webmail, and other non-enterprise controlled services.[1](https://threatpost.com/facebook-launching-pad-phishing-attacks/160351/) These services are more likely to have a less-strict security policy than an enterprise. As with most kinds of spearphishing, the goal is to generate rapport with the target or get the target's interest in some way. Adversaries may create fake social media accounts and message employees for potential job opportunities. Doing so allows a plausible reason for asking about services, policies, and information about their environment. Adversaries may also use information from previous reconnaissance efforts (ex: [[T1593_Search Open Websites Domains#Social Media - T1593 001|Social Media (T1593.001)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]) to craft persuasive and believable lures.

#### Spearphishing Attachement - T1598.002
[more on T1598.002](https://attack.mitre.org/techniques/T1598/002)

Adversaries may send spearphishing messages with a malicious attachment to elicit sensitive information that can be used during targeting. Spearphishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information. Spearphishing for information frequently involves social engineering techniques, such as posing as a source with a reason to collect information (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]] and/or sending multiple, seemingly urgent messages.

All forms of spearphishing are electronically delivered social engineering targeted at a specific individual, company, or industry. In this scenario, adversaries attach a file to the spearphishing email and usually rely upon the recipient populating information then returning the file.[1](https://nakedsecurity.sophos.com/2020/10/02/serious-security-phishing-without-links-when-phishers-bring-along-their-own-web-pages/)[2](https://github.com/ryhanson/phishery) The text of the spearphishing email usually tries to give a plausible reason why the file should be filled-in, such as a request for information from a business associate. Adversaries may also use information from previous reconnaissance efforts (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]) to craft persuasive and believable lures.

#### Spearphishing Link - T1598.003
[more on T1598.003](https://attack.mitre.org/techniques/T1598/003)

Adversaries may send spearphishing messages with a malicious link to elicit sensitive information that can be used during targeting. Spearphishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information. Spearphishing for information frequently involves social engineering techniques, such as posing as a source with a reason to collect information (ex: [[T1585_Establish Accounts|Establish Accounts (T1585)]] or [[T1586_Compromise Accounts|Compromise Accounts (T1586)]] and/or sending multiple, seemingly urgent messages.

All forms of spearphishing are electronically delivered social engineering targeted at a specific individual, company, or industry. In this scenario, the malicious emails contain links generally accompanied by social engineering text to coax the user to actively click or copy and paste a URL into a browser.[1](https://www.trendmicro.com/en_us/research/20/i/tricky-forms-of-phishing.html)[2](https://www.pcmag.com/news/hackers-try-to-phish-united-nations-staffers-with-fake-login-pages) The given website may closely resemble a legitimate site in appearance and have a URL containing elements from the real site. From the fake website, information is gathered in web forms and sent to the attacker. Adversaries may also use information from previous reconnaissance efforts (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains (T1593)]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites (T1594)]]) to craft persuasive and believable lures.

#### Spearphishing Voice - T1598.004
[more on T1598.004](https://attack.mitre.org/techniques/T1598/004)

Adversaries may use voice communications to elicit sensitive information that can be used during targeting. Spearphishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information. Spearphishing for information frequently involves social engineering techniques, such as posing as a source with a reason to collect information (ex: [[T1656_Impersonation|Impersonation]]) and/or creating a sense of urgency or alarm for the recipient.

All forms of phishing are electronically delivered social engineering. In this scenario, adversaries use phone calls to elicit sensitive information from victims. Known as voice phishing (or "vishing"), these communications can be manually executed by adversaries, hired call centers, or even automated via robocalls. Voice phishers may spoof their phone number while also posing as a trusted entity, such as a business partner or technical support staff. [1](https://business.bofa.com/en-us/content/what-is-vishing.html)

Victims may also receive phishing messages that direct them to call a phone number ("callback phishing") where the adversary attempts to collect confidential information. [2](https://www.avertium.com/resources/threat-reports/everything-you-need-to-know-about-callback-phishing)

Adversaries may also use information from previous reconnaissance efforts (ex: [[T1593_Search Open Websites Domains|Search Open Websites/Domains]] or [[T1594_Search Victim-Owned Websites|Search Victim-Owned Websites]]) to tailor pretexts to be even more persuasive and believable for the victim.

