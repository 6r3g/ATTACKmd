Tactics: [[CREDENTIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1539  

# Steal Web Session Cookie - T1539
---
## Description
[more on T1539](https://attack.mitre.org/techniques/T1539)

An adversary may steal web application or service session cookies and use them to gain access to web applications or Internet services as an authenticated user without needing credentials. Web applications and services often use session cookies as an authentication token after a user has authenticated to a website.

Cookies are often valid for an extended period of time, even if the web application is not actively used. Cookies can be found on disk, in the process memory of the browser, and in network traffic to remote systems. Additionally, other applications on the targets machine might store sensitive authentication cookies in memory (e.g. apps which authenticate to cloud services). Session cookies can be used to bypasses some multi-factor authentication protocols.[1](https://wunderwuzzi23.github.io/blog/passthecookie.html)

There are several examples of malware targeting cookies from web browsers on the local system.[2](https://securelist.com/project-tajmahal/90240/)[3](https://unit42.paloaltonetworks.com/mac-malware-steals-cryptocurrency-exchanges-cookies/) There are also open source frameworks such as Evilginx 2 and Muraena that can gather session cookies through a malicious proxy (ex: [[T1557_Adversary-in-the-Middle|Adversary-in-the-Middle (T1557)]]) that can be set up by an adversary and used in phishing campaigns.[4](https://github.com/kgretzky/evilginx2)[5](https://github.com/muraenateam/muraena)

After an adversary acquires a valid cookie, they can then perform a [[T1550_Use Alternate Authentication Material#Web Session Cookie - T1550 004|Web Session Cookie (T1550.004)]] technique to login to the corresponding web application.

---
## Sub-Techniques

#### none
