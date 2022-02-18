Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1496  

# Resource Hijacking - T1496
---
## Description
[more on T1496](https://attack.mitre.org/techniques/T1496)

Adversaries may leverage the resources of co-opted systems in order to solve resource intensive problems which may impact system and/or hosted service availability.

One common purpose for Resource Hijacking is to validate transactions of cryptocurrency networks and earn virtual currency. Adversaries may consume enough system resources to negatively impact and/or cause affected machines to become unresponsive.[1](https://securelist.com/lazarus-under-the-hood/77908/) Servers and cloud-based[2](https://blog.cloudsploit.com/the-danger-of-unused-aws-regions-af0bf1b878fc) systems are common targets because of the high potential for available resources, but user endpoint systems may also be compromised and used for Resource Hijacking and cryptocurrency mining. Containerized environments may also be targeted due to the ease of deployment via exposed APIs and the potential for scaling mining activities by deploying or compromising multiple containers within an environment or cluster.[3](https://unit42.paloaltonetworks.com/hildegard-malware-teamtnt/)[4](https://www.trendmicro.com/en_us/research/19/e/infected-cryptocurrency-mining-containers-target-docker-hosts-with-exposed-apis-use-shodan-to-find-additional-victims.html)

Additionally, some cryptocurrency mining malware kills off processes for competing malware to ensure it’s not competing for resources.[5](https://www.trendmicro.com/en_us/research/20/i/war-of-linux-cryptocurrency-miners-a-battle-for-resources.html)

---
## Sub-Techniques

#### none
