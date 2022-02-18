Tactics: [[INITIAL_ACCESS]]
Tags: #mitre/attack/techniques/T1195 

# Supply Chain Compromise - T1195
---
## Description
[more on T1195](https://attack.mitre.org/techniques/T1195)

Adversaries may manipulate products or product delivery mechanisms prior to receipt by a final consumer for the purpose of data or system compromise.

Supply chain compromise can take place at any stage of the supply chain including:

-   Manipulation of development tools
-   Manipulation of a development environment
-   Manipulation of source code repositories (public or private)
-   Manipulation of source code in open-source dependencies
-   Manipulation of software update/distribution mechanisms
-   Compromised/infected system images (multiple cases of removable media infected at the factory) [1](https://www-01.ibm.com/support/docview.wss?uid=ssg1S1010146&myns=s028&mynp=OCSTHGUJ&mynp=OCSTLM5A&mynp=OCSTLM6B&mynp=OCHW206&mync=E&cm_sp=s028-_-OCSTHGUJ-OCSTLM5A-OCSTLM6B-OCHW206-_-E) [2](https://www.se.com/ww/en/download/document/SESN-2018-236-01/)
-   Replacement of legitimate software with modified versions
-   Sales of modified/counterfeit products to legitimate distributors
-   Shipment interdiction

While supply chain compromise can impact any component of hardware or software, attackers looking to gain execution have often focused on malicious additions to legitimate software in software distribution or update channels. [3](https://blog.avast.com/new-investigations-in-ccleaner-incident-point-to-a-possible-third-stage-that-had-keylogger-capacities) [4](https://cloudblogs.microsoft.com/microsoftsecure/2018/03/07/behavior-monitoring-combined-with-machine-learning-spoils-a-massive-dofoil-coin-mining-campaign/) [5](https://www.commandfive.com/papers/C5_APT_SKHack.pdf) Targeting may be specific to a desired victim set [6](https://web.archive.org/web/20190717233006/http://www.symantec.com/content/en/us/enterprise/media/security_response/whitepapers/the-elderwood-project.pdf) or malicious software may be distributed to a broad set of consumers but only move on to additional tactics on specific victims. [3](https://blog.avast.com/new-investigations-in-ccleaner-incident-point-to-a-possible-third-stage-that-had-keylogger-capacities) [5](https://www.commandfive.com/papers/C5_APT_SKHack.pdf) Popular open source projects that are used as dependencies in many applications may also be targeted as a means to add malicious code to users of the dependency. [7](https://www.trendmicro.com/vinfo/dk/security/news/cybercrime-and-digital-threats/hacker-infects-node-js-package-to-steal-from-bitcoin-wallets)

---
## Sub-Techniques

#### Compromise Software Dependencies and Development Tools - T1195.001
[more on T1195.001](https://attack.mitre.org/techniques/T1195/001)

Adversaries may manipulate software dependencies and development tools prior to receipt by a final consumer for the purpose of data or system compromise. Applications often depend on external software to function properly. Popular open source projects that are used as dependencies in many applications may be targeted as a means to add malicious code to users of the dependency. [1](https://www.trendmicro.com/vinfo/dk/security/news/cybercrime-and-digital-threats/hacker-infects-node-js-package-to-steal-from-bitcoin-wallets)

Targeting may be specific to a desired victim set or may be distributed to a broad set of consumers but only move on to additional tactics on specific victims.

#### Compromise Software Supply Chain - T1195.002
[more on T1195.002](https://attack.mitre.org/techniques/T1195/002)

Adversaries may manipulate application software prior to receipt by a final consumer for the purpose of data or system compromise. Supply chain compromise of software can take place in a number of ways, including manipulation of the application source code, manipulation of the update/distribution mechanism for that software, or replacing compiled releases with a modified version.

Targeting may be specific to a desired victim set or may be distributed to a broad set of consumers but only move on to additional tactics on specific victims.[1](https://blog.avast.com/new-investigations-in-ccleaner-incident-point-to-a-possible-third-stage-that-had-keylogger-capacities) [2](https://www.commandfive.com/papers/C5_APT_SKHack.pdf)

#### Compromise Hardware Supply Chain - T1195.003
[more on T1195.003](https://attack.mitre.org/techniques/T1195/003)

Adversaries may manipulate hardware components in products prior to receipt by a final consumer for the purpose of data or system compromise. By modifying hardware or firmware in the supply chain, adversaries can insert a backdoor into consumer networks that may be difficult to detect and give the adversary a high degree of control over the system. Hardware backdoors may be inserted into various devices, such as servers, workstations, network infrastructure, or peripherals.