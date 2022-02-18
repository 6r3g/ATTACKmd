Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1565  

# Data Manipulation - T1565
---
## Description
[more on T1565](https://attack.mitre.org/techniques/T1565)

Adversaries may insert, delete, or manipulate data in order to manipulate external outcomes or hide activity. By manipulating data, adversaries may attempt to affect a business process, organizational understanding, or decision making.

The type of modification and the impact it will have depends on the target application and process as well as the goals and objectives of the adversary. For complex systems, an adversary would likely need special expertise and possibly access to specialized software related to the system that would typically be gained through a prolonged information gathering campaign in order to have the desired impact.

---
## Sub-Techniques

#### Stored Data Manipulation - T1565.001
[more on T1565.001](https://attack.mitre.org/techniques/T1565/001)

Adversaries may insert, delete, or manipulate data at rest in order to manipulate external outcomes or hide activity.[1](https://content.fireeye.com/apt/rpt-apt38)[2](https://www.justice.gov/opa/press-release/file/1092091/download) By manipulating stored data, adversaries may attempt to affect a business process, organizational understanding, and decision making.

Stored data could include a variety of file formats, such as Office files, databases, stored emails, and custom file formats. The type of modification and the impact it will have depends on the type of data as well as the goals and objectives of the adversary. For complex systems, an adversary would likely need special expertise and possibly access to specialized software related to the system that would typically be gained through a prolonged information gathering campaign in order to have the desired impact.

#### Transmitted Data Manipulation - T1565.002
[more on T1565.002](https://attack.mitre.org/techniques/T1565/002)

Adversaries may alter data en route to storage or other systems in order to manipulate external outcomes or hide activity.[1](https://content.fireeye.com/apt/rpt-apt38)[2](https://www.justice.gov/opa/press-release/file/1092091/download) By manipulating transmitted data, adversaries may attempt to affect a business process, organizational understanding, and decision making.

Manipulation may be possible over a network connection or between system processes where there is an opportunity deploy a tool that will intercept and change information. The type of modification and the impact it will have depends on the target transmission mechanism as well as the goals and objectives of the adversary. For complex systems, an adversary would likely need special expertise and possibly access to specialized software related to the system that would typically be gained through a prolonged information gathering campaign in order to have the desired impact.

#### Runtime Data Manipulation - T1565.003
[more on T1565.003](https://attack.mitre.org/techniques/T1565/003)

Adversaries may modify systems in order to manipulate the data as it is accessed and displayed to an end user.[1](https://content.fireeye.com/apt/rpt-apt38)[2](https://www.justice.gov/opa/press-release/file/1092091/download) By manipulating runtime data, adversaries may attempt to affect a business process, organizational understanding, and decision making.

Adversaries may alter application binaries used to display data in order to cause runtime manipulations. Adversaries may also conduct [[T1546_Event Triggered Execution#Change Default File Association - T1546 001|Change Default File Association (T1546.001)]] and [[T1036_Masquerading|Masquerading (T1036)]] to cause a similar effect. The type of modification and the impact it will have depends on the target application and process as well as the goals and objectives of the adversary. For complex systems, an adversary would likely need special expertise and possibly access to specialized software related to the system that would typically be gained through a prolonged information gathering campaign in order to have the desired impact.



