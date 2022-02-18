Tactics: [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1525  

# Implant Internal Image - T1525
---
## Description
[more on T1525](https://attack.mitre.org/techniques/T1525)

Adversaries may implant cloud or container images with malicious code to establish persistence after gaining access to an environment. Amazon Web Services (AWS) Amazon Machine Images (AMIs), Google Cloud Platform (GCP) Images, and Azure Images as well as popular container runtimes such as Docker can be implanted or backdoored. Unlike [[T1608_Stage Capabilities#Upload Malware - T1608 001|Upload Malware (T1608.001)]], this technique focuses on adversaries implanting an image in a registry within a victim’s environment. Depending on how the infrastructure is provisioned, this could provide persistent access if the infrastructure provisioning tool is instructed to always use the latest image.[1](https://rhinosecuritylabs.com/aws/cloud-container-attack-tool/)

A tool has been developed to facilitate planting backdoors in cloud container images.[2](https://github.com/RhinoSecurityLabs/ccat) If an attacker has access to a compromised AWS instance, and permissions to list the available container images, they may implant a backdoor such as a [[T1505_Server Software Component#Web Shell - T1505 003|Web Shell (T1505.003)]].[1](https://rhinosecuritylabs.com/aws/cloud-container-attack-tool/)

---
## Sub-Techniques

#### none
