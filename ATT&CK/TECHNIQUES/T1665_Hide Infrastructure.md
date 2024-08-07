Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1665

# Hide Infrastructure - T1665
---
## Description
[more on T1665](https://attack.mitre.org/techniques/T1665)

Adversaries may manipulate network traffic in order to hide and evade detection of their C2 infrastructure. This can be accomplished in various ways including by identifying and filtering traffic from defensive tools, [1](https://www.proofpoint.com/us/blog/threat-insight/security-brief-ta571-delivers-icedid-forked-loader) masking malicious domains to obfuscate the true destination from both automated scanning tools and security researchers, [2](https://www.mandiant.com/resources/blog/url-obfuscation-schema-abuse) [3](https://github.com/spyboy-productions/Facad1ng) [4](https://www.proofpoint.com/us/blog/threat-insight/are-you-sure-your-browser-date-current-landscape-fake-browser-updates) and otherwise hiding malicious artifacts to delay discovery and prolong the effectiveness of adversary infrastructure that could otherwise be identified, blocked, or taken down entirely.

C2 networks may include the use of [[T1090_Proxy|Proxy]] or VPNs to disguise IP addresses, which can allow adversaries to blend in with normal network traffic and bypass conditional access policies or anti-abuse protections. For example, an adversary may use a virtual private cloud to spoof their IP address to closer align with a victim's IP address ranges. This may also bypass security measures relying on geolocation of the source IP address. [5](https://sysdig.com/content/c/pf-2023-global-cloud-threat-report?x=u_WFRi&xs=524303#page=1) [6](https://www.orangecyberdefense.com/global/blog/research/residential-proxies)

Adversaries may also attempt to filter network traffic in order to evade defensive tools in numerous ways, including blocking/redirecting common incident responder or security appliance user agents. [7](https://bluescreenofjeff.com/2016-04-12-combatting-incident-responders-with-apache-mod_rewrite/) [8](https://www.proofpoint.com/us/blog/threat-insight/part-1-socgholish-very-real-threat-very-fake-update) Filtering traffic based on IP and geo-fencing may also avoid automated sandboxing or researcher activity (i.e., [[T1497_Virtualization-Sandbox Evasion|Virtualization/Sandbox Evasion]]). [1](https://www.proofpoint.com/us/blog/threat-insight/security-brief-ta571-delivers-icedid-forked-loader) [7](https://bluescreenofjeff.com/2016-04-12-combatting-incident-responders-with-apache-mod_rewrite/)

Hiding C2 infrastructure may also be supported by [[RESOURCES_DEVELOPMENT|Resource Development]] activities such as [[T1583_Acquire Infrastructure|Acquire Infrastructure]] and [[T1584_Compromise Infrastructure|Compromise Infrastructure]]. For example, using widely trusted hosting services or domains such as prominent URL shortening providers or marketing services for C2 networks may enable adversaries to present benign content that later redirects victims to malicious web pages or infrastructure once specific conditions are met. [9](https://www.microsoft.com/en-us/security/blog/2023/12/07/star-blizzard-increases-sophistication-and-evasion-in-ongoing-attacks/) [10](https://cofense.com/blog/major-energy-company-targeted-in-large-qr-code-campaign/)
