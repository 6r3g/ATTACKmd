Tactics: [[EXFILTRATION]]
Tags: #mitre/attack/techniques/T1567  

# Exfiltration Over Web Service - T1567
---
## Description
[more on T1567](https://attack.mitre.org/techniques/T1567)

Adversaries may use an existing, legitimate external Web service to exfiltrate data rather than their primary command and control channel. Popular Web services acting as an exfiltration mechanism may give a significant amount of cover due to the likelihood that hosts within a network are already communicating with them prior to compromise. Firewall rules may also already exist to permit traffic to these services.

Web service providers also commonly use SSL/TLS encryption, giving adversaries an added level of protection.

---
## Sub-Techniques

#### Exfiltration to Code Repository - T1567.001
[more on T1567.001](https://attack.mitre.org/techniques/T1567/001)

Adversaries may exfiltrate data to a code repository rather than over their primary command and control channel. Code repositories are often accessible via an API (ex: https://api.github.com). Access to these APIs are often over HTTPS, which gives the adversary an additional level of protection.

Exfiltration to a code repository can also provide a significant amount of cover to the adversary if it is a popular service already used by hosts within the network.

#### Exfiltration to Cloud Storage - T1567.002
[more on T1567.002](https://attack.mitre.org/techniques/T1567/002)

Adversaries may exfiltrate data to a cloud storage service rather than over their primary command and control channel. Cloud storage services allow for the storage, edit, and retrieval of data from a remote cloud storage server over the Internet.

Examples of cloud storage services include Dropbox and Google Docs. Exfiltration to these cloud storage services can provide a significant amount of cover to the adversary if hosts within the network are already communicating with the service.

#### Exfiltration to Text Storage Sites - T1567.003
[more on T1567.003](https://attack.mitre.org/techniques/T1567/003)

Adversaries may exfiltrate data to text storage sites instead of their primary command and control channel. Text storage sites, such as `pastebin[.]com`, are commonly used by developers to share code and other information.

Text storage sites are often used to host malicious code for C2 communication (e.g., [[T1608_Stage Capabilities|Stage Capabilities]]), but adversaries may also use these sites to exfiltrate collected data. Furthermore, paid features and encryption options may allow adversaries to conceal and store data more securely. [1](https://web.archive.org/web/20201107203304/https://www.echosec.net/blog/what-is-pastebin-and-why-do-hackers-love-it)

**Note:** This is distinct from [[T1567_Exfiltration Over Web Service#Exfiltration to Code Repository - T1567.001|Exfiltration to Code Repository]], which highlight access to code repositories via APIs.

#### Exfiltration Over Webhook - T1567.004
[more on T1567.004](https://attack.mitre.org/techniques/T1567/004)

Adversaries may exfiltrate data to a webhook endpoint rather than over their primary command and control channel. Webhooks are simple mechanisms for allowing a server to push data over HTTP/S to a client without the need for the client to continuously poll the server. [1](https://www.redhat.com/en/topics/automation/what-is-a-webhook) Many public and commercial services, such as Discord, Slack, and `webhook.site`, support the creation of webhook endpoints that can be used by other services, such as Github, Jira, or Trello. [2](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) When changes happen in the linked services (such as pushing a repository update or modifying a ticket), these services will automatically post the data to the webhook endpoint for use by the consuming application.

Adversaries may link an adversary-owned environment to a victim-owned SaaS service to achieve repeated [[T1020_Automated Exfiltration|Automated Exfiltration]] of emails, chat messages, and other data. [3](https://github.com/pushsecurity/saas-attacks/blob/main/techniques/webhooks/description.md) Alternatively, instead of linking the webhook endpoint to a service, an adversary can manually post staged data directly to the URL in order to exfiltrate it. [4](https://www.microsoft.com/security/blog/2023/10/03/defending-new-vectors-threat-actors-attempt-sql-server-to-cloud-lateral-movement/)

Access to webhook endpoints is often over HTTPS, which gives the adversary an additional level of protection. Exfiltration leveraging webhooks can also blend in with normal network traffic if the webhook endpoint points to a commonly used SaaS application or collaboration service. [5](https://www.cyberark.com/resources/threat-research-blog/the-not-so-secret-war-on-discord) [6](https://blog.talosintelligence.com/collab-app-abuse/) [7](https://medium.com/checkmarx-security/webhook-party-malicious-packages-caught-exfiltrating-data-via-legit-webhook-services-6e046b07d191)

