Tactics: [[IMPACT]]
Tags: #mitre/attack/techniques/T1489  

# Service Stop - T1489
---
## Description
[more on T1489](https://attack.mitre.org/techniques/T1489)

Adversaries may stop or disable services on a system to render those services unavailable to legitimate users. Stopping critical services or processes can inhibit or stop response to an incident or aid in the adversary's overall objectives to cause damage to the environment.[1](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html)[2](https://www.operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Report.pdf)

Adversaries may accomplish this by disabling individual services of high importance to an organization, such as `MSExchangeIS`, which will make Exchange content inaccessible [2](https://www.operationblockbuster.com/wp-content/uploads/2016/02/Operation-Blockbuster-Report.pdf). In some cases, adversaries may stop or disable many or all services to render systems unusable.[1](https://blog.talosintelligence.com/2018/02/olympic-destroyer.html) Services or processes may not allow for modification of their data stores while running. Adversaries may stop services or processes in order to conduct [[T1485_Data Destruction|Data Destruction (T1485)]] or [[T1486_Data Encrypted for Impact|Data Encrypted for Impact (T1486)]] on the data stores of services like Exchange and SQL Server.[3](https://www.secureworks.com/research/wcry-ransomware-analysis)

---
## Sub-Techniques

#### none
