Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1656

# Impersonation - T1656
---
## Description
[more on T1656](https://attack.mitre.org/techniques/T1656)

Adversaries may impersonate a trusted person or organization in order to persuade and trick a target into performing some action on their behalf. For example, adversaries may communicate with victims (via [[T1598_Phishing for Information|Phishing for Information]], [[T1566_Phishing|Phishing]], or [[T1534_Internal Spearphishing|Internal Spearphishing]]) while impersonating a known sender such as an executive, colleague, or third-party vendor. Established trust can then be leveraged to accomplish an adversary’s ultimate goals, possibly against multiple victims.

In many cases of business email compromise or email fraud campaigns, adversaries use impersonation to defraud victims -- deceiving them into sending money or divulging information that ultimately enables [[T1657_Financial Theft|Financial Theft]].

Adversaries will often also use social engineering techniques such as manipulative and persuasive language in email subject lines and body text such as `payment`, `request`, or `urgent` to push the victim to act quickly before malicious activity is detected. These campaigns are often specifically targeted against people who, due to job roles and/or accesses, can carry out the adversary’s goal.  

Impersonation is typically preceded by reconnaissance techniques such as [[T1589_Gather Victim Identity Information|Gather Victim Identity Information]] and [[T1591_Gather Victim Org Information|Gather Victim Org Information]] as well as acquiring infrastructure such as email domains (i.e. [[T1583_Acquire Infrastructure#Domains - T1583.001|Domains]]) to substantiate their false identity. [1](https://www.crowdstrike.com/cybersecurity-101/business-email-compromise-bec/)

There is the potential for multiple victims in campaigns involving impersonation. For example, an adversary may [[T1586_Compromise Accounts|Compromise Accounts]] targeting one organization which can then be used to support impersonation against other entities. [2](https://www.cloudflare.com/learning/email-security/what-is-vendor-email-compromise/#:~:text=Vendor%20email%20compromise%2C%20also%20referred,steal%20from%20that%20vendor%27s%20customers.)

