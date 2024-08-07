Tactics: [[INITIAL_ACCESS]] - [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1659

# Content Injection - T1659
---
## Description
[more on T1659](https://attack.mitre.org/techniques/T1659)

Adversaries may gain access and continuously communicate with victims by injecting malicious content into systems through online network traffic. Rather than luring victims to malicious payloads hosted on a compromised website (i.e., [[T1608_Stage Capabilities#Drive-by Target - T1608.004|Drive-by Target]] followed by [[T1189_Drive-by Compromise|Drive-by Compromise]]), adversaries may initially access victims through compromised data-transfer channels where they can manipulate traffic and/or inject their own content. These compromised online network channels may also be used to deliver additional payloads (i.e., [[T1105_Ingress Tool Transfer|Ingress Tool Transfer]]) and other data to already compromised systems. [1](https://www.welivesecurity.com/en/eset-research/moustachedbouncer-espionage-against-foreign-diplomats-in-belarus/)

Adversaries may inject content to victim systems in various ways, including:

- From the middle, where the adversary is in-between legitimate online client-server communications (**Note:** this is similar but distinct from [[T1557_Adversary-in-the-Middle|Adversary-in-the-Middle]], which describes AiTM activity solely within an enterprise environment) [2](https://encyclopedia.kaspersky.com/glossary/man-in-the-middle-attack/)
- From the side, where malicious content is injected and races to the client as a fake response to requests of a legitimate online server [3](https://usa.kaspersky.com/blog/man-on-the-side/27854/)

Content injection is often the result of compromised upstream communication channels, for example at the level of an internet service provider (ISP) as is the case with "lawful interception." [3](https://usa.kaspersky.com/blog/man-on-the-side/27854/) [1](https://www.welivesecurity.com/en/eset-research/moustachedbouncer-espionage-against-foreign-diplomats-in-belarus/) [4](https://www.eff.org/deeplinks/2015/04/china-uses-unencrypted-websites-to-hijack-browsers-in-github-attack)

