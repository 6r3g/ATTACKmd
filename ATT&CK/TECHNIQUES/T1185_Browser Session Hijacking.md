Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1185  

# Browser Session Hijacking - T1185
---
## Description
[more on T1185](https://attack.mitre.org/techniques/T1185)

Adversaries may take advantage of security vulnerabilities and inherent functionality in browser software to change content, modify user-behaviors, and intercept information as part of various browser session hijacking techniques.[1](https://en.wikipedia.org/wiki/Man-in-the-browser)

A specific example is when an adversary injects software into a browser that allows them to inherit cookies, HTTP sessions, and SSL client certificates of a user then use the browser as a way to pivot into an authenticated intranet.[2](https://www.cobaltstrike.com/help-browser-pivoting)[3](https://www.icebrg.io/blog/malicious-chrome-extensions-enable-criminals-to-impact-over-half-a-million-users-and-global-businesses) Executing browser-based behaviors such as pivoting may require specific process permissions, such as `SeDebugPrivilege` and/or high-integrity/administrator rights.

Another example involves pivoting browser traffic from the adversary's browser through the user's browser by setting up a proxy which will redirect web traffic. This does not alter the user's traffic in any way, and the proxy connection can be severed as soon as the browser is closed. The adversary assumes the security context of whichever browser process the proxy is injected into. Browsers typically create a new process for each tab that is opened and permissions and certificates are separated accordingly. With these permissions, an adversary could potentially browse to any resource on an intranet, such as [[T1213_Data from Information Repositories#Sharepoint - T1213 002|Sharepoint (T1213.002)]] or webmail, that is accessible through the browser and which the browser has sufficient permissions. Browser pivoting may also bypass security provided by 2-factor authentication.[4](https://cobaltstrike.com/downloads/csmanual38.pdf)

---
## Sub-Techniques

#### none
