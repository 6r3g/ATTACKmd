Tactics: [[LATERAL_MOVEMENT]]
Tags: #mitre/attack/techniques/T1534  

# Internal Spearphishing - T1534
---
## Description
[more on T1534](https://attack.mitre.org/techniques/T1534)

Adversaries may use internal spearphishing to gain access to additional information or exploit other users within the same organization after they already have access to accounts or systems within the environment. Internal spearphishing is multi-staged attack where an email account is owned either by controlling the user's device with previously installed malware or by compromising the account credentials of the user. Adversaries attempt to take advantage of a trusted internal account to increase the likelihood of tricking the target into falling for the phish attempt.[1](https://blog.trendmicro.com/phishing-starts-inside/)

Adversaries may leverage [[T1566_Phishing#Spearphishing Attachment - T1566 001|Spearphishing Attachment (T1566.001)]] or [[T1566_Phishing#Spearphishing Link - T1566 002|Spearphishing Link (T1566.002)]] as part of internal spearphishing to deliver a payload or redirect to an external site to capture credentials through [[T1056_Input Capture|Input Capture (T1056)]] on sites that mimic email login interfaces.

There have been notable incidents where internal spearphishing has been used. The Eye Pyramid campaign used phishing emails with malicious attachments for lateral movement between victims, compromising nearly 18,000 email accounts in the process.[1](https://blog.trendmicro.com/phishing-starts-inside/) The Syrian Electronic Army (SEA) compromised email accounts at the Financial Times (FT) to steal additional account credentials. Once FT learned of the attack and began warning employees of the threat, the SEA sent phishing emails mimicking the Financial Times IT department and were able to compromise even more users.[2](https://labs.ft.com/2013/05/a-sobering-day/?mhq5j=e6)

---
## Sub-Techniques

#### none
