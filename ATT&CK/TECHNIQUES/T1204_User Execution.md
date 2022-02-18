Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1204  

# User Execution - T1204
---
## Description
[more on T1204](https://attack.mitre.org/techniques/T1204)

An adversary may rely upon specific actions by a user in order to gain execution. Users may be subjected to social engineering to get them to execute malicious code by, for example, opening a malicious document file or link. These user actions will typically be observed as follow-on behavior from forms of [[T1566_Phishing|Phishing (T1566)]].

While [[T1204_User Execution|User Execution (T1204)]] frequently occurs shortly after Initial Access it may occur at other phases of an intrusion, such as when an adversary places a file in a shared directory or on a user's desktop hoping that a user will click on it. This activity may also be seen shortly after [[T1534_Internal Spearphishing|Internal Spearphishing (T1534)]].

---
## Sub-Techniques

#### Malicious Link - T1204.001
[more on T1204.001](https://attack.mitre.org/techniques/T1204/001)

An adversary may rely upon a user clicking a malicious link in order to gain execution. Users may be subjected to social engineering to get them to click on a link that will lead to code execution. This user action will typically be observed as follow-on behavior from [[T1566_Phishing#Spearphishing Link - T1566 002|Spearphishing Link (T1566.002)]] . Clicking on a link may also lead to other execution techniques such as exploitation of a browser or application vulnerability via [[T1203_Exploitation for Client Execution|Exploitation for Client Execution (T1203)]]. Links may also lead users to download files that require execution via [[T1204_User Execution#Malicious File - T1204 002|Malicious File (T1204.002)]].

#### Malicious File - T1204.002
[more on T1204.002](https://attack.mitre.org/techniques/T1204/002)

An adversary may rely upon a user opening a malicious file in order to gain execution. Users may be subjected to social engineering to get them to open a file that will lead to code execution. This user action will typically be observed as follow-on behavior from [[T1566_Phishing#Spearphishing Attachment - T1566 001|Spearphishing Attachment (T1566.001)]]. Adversaries may use several types of files that require a user to execute them, including .doc, .pdf, .xls, .rtf, .scr, .exe, .lnk, .pif, and .cpl.

Adversaries may employ various forms of [[T1036_Masquerading|Masquerading (T1036)]] on the file to increase the likelihood that a user will open it.

While [[T1204_User Execution#Malicious File - T1204 002|Malicious File (T1204.002)]] frequently occurs shortly after Initial Access it may occur at other phases of an intrusion, such as when an adversary places a file in a shared directory or on a user's desktop hoping that a user will click on it. This activity may also be seen shortly after [[T1534_Internal Spearphishing|Internal Spearphishing (T1534)]].

#### Malicious Image - T1204.003
[more on T1204.003](https://attack.mitre.org/techniques/T1204/003)

Adversaries may rely on a user running a malicious image to facilitate execution. Amazon Web Services (AWS) Amazon Machine Images (AMIs), Google Cloud Platform (GCP) Images, and Azure Images as well as popular container runtimes such as Docker can be backdoored. Backdoored images may be uploaded to a public repository via [[T1608_Stage Capabilities#Upload Malware - T1608 001|Upload Malware (T1608.001)]], and users may then download and deploy an instance or container from the image without realizing the image is malicious, thus bypassing techniques that specifically achieve Initial Access. This can lead to the execution of malicious code, such as code that executes cryptocurrency mining, in the instance or container.[1](https://summitroute.com/blog/2018/09/24/investigating_malicious_amis/)

Adversaries may also name images a certain way to increase the chance of users mistakenly deploying an instance or container from the image (ex: [[T1036_Masquerading#Match Legitimate Name or Location - T1036 005|Match Legitimate Name or Location (T1036.005)]]).[2](https://info.aquasec.com/hubfs/Threat%20reports/AquaSecurity_Cloud_Native_Threat_Report_2021.pdf?utm_campaign=WP%20-%20Jun2021%20Nautilus%202021%20Threat%20Research%20Report&utm_medium=email&_hsmi=132931006&_hsenc=p2ANqtz-_8oopT5Uhqab8B7kE0l3iFo1koirxtyfTehxF7N-EdGYrwk30gfiwp5SiNlW3G0TNKZxUcDkYOtwQ9S6nNVNyEO-Dgrw&utm_content=132931006&utm_source=hs_automation)



