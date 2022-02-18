Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1114  

# Email Collection - T1114
---
## Description
[more on T1114](https://attack.mitre.org/techniques/T1114)

Adversaries may target user email to collect sensitive information. Emails may contain sensitive data, including trade secrets or personal information, that can prove valuable to adversaries. Adversaries can collect or forward email from mail servers or clients.

---
## Sub-Techniques

#### Local Email Collection - T1114.001
[more on T1114.001](https://attack.mitre.org/techniques/T1114/001)

Adversaries may target user email on local systems to collect sensitive information. Files containing email data can be acquired from a user’s local system, such as Outlook storage or cache files.

Outlook stores data locally in offline data files with an extension of .ost. Outlook 2010 and later supports .ost file sizes up to 50GB, while earlier versions of Outlook support up to 20GB.[1](https://practical365.com/clients/office-365-proplus/outlook-cached-mode-ost-file-sizes/) IMAP accounts in Outlook 2013 (and earlier) and POP accounts use Outlook Data Files (.pst) as opposed to .ost, whereas IMAP accounts in Outlook 2016 (and later) use .ost files. Both types of Outlook data files are typically stored in `C:\Users\<username>\Documents\Outlook Files` or `C:\Users\<username>\AppData\Local\Microsoft\Outlook`.[2](https://support.office.com/en-us/article/introduction-to-outlook-data-files-pst-and-ost-222eaf92-a995-45d9-bde2-f331f60e2790)

#### Remote Email Collection - T1114.002
[more on T1114.002](https://attack.mitre.org/techniques/T1114/002)

Adversaries may target an Exchange server, Office 365, or Google Workspace to collect sensitive information. Adversaries may leverage a user's credentials and interact directly with the Exchange server to acquire information from within a network. Adversaries may also access externally facing Exchange services, Office 365, or Google Workspace to access email using credentials or access tokens. Tools such as [MailSniper](https://attack.mitre.org/software/S0413) can be used to automate searches for specific keywords.

#### Email Forwarding Rule - T1114.003
[more on T1114.003](https://attack.mitre.org/techniques/T1114/003)

Adversaries may setup email forwarding rules to collect sensitive information. Adversaries may abuse email-forwarding rules to monitor the activities of a victim, steal information, and further gain intelligence on the victim or the victim’s organization to use as part of further exploits or operations.[1](https://www.us-cert.gov/ncas/alerts/TA18-086A) Furthermore, email forwarding rules can allow adversaries to maintain persistent access to victim's emails even after compromised credentials are reset by administrators.[2](https://blog.compass-security.com/2018/09/hidden-inbox-rules-in-microsoft-exchange/) Most email clients allow users to create inbox rules for various email functions, including forwarding to a different recipient. These rules may be created through a local email application, a web interface, or by command-line interface. Messages can be forwarded to internal or external recipients, and there are no restrictions limiting the extent of this rule. Administrators may also create forwarding rules for user accounts with the same considerations and outcomes.[3](https://blogs.technet.microsoft.com/timmcmic/2015/06/08/exchange-and-office-365-mail-forwarding-2/)[4](https://support.apple.com/guide/mail/reply-to-forward-or-redirect-emails-mlhlp1010/mac)

Any user or administrator within the organization (or adversary with valid credentials) can create rules to automatically forward all received messages to another recipient, forward emails to different locations based on the sender, and more. Adversaries may also hide the rule by making use of the Microsoft Messaging API (MAPI) to modify the rule properties, making it hidden and not visible from Outlook, OWA or most Exchange Administration tools.[2](https://blog.compass-security.com/2018/09/hidden-inbox-rules-in-microsoft-exchange/)



