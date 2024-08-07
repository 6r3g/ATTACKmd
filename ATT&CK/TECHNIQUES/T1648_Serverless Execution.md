Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1648

# Serverless Execution - T1648
---
## Description
[more on T1648](https://attack.mitre.org/techniques/T1648)

Adversaries may abuse serverless computing, integration, and automation services to execute arbitrary code in cloud environments. Many cloud providers offer a variety of serverless resources, including compute engines, application integration services, and web servers.

Adversaries may abuse these resources in various ways as a means of executing arbitrary commands. For example, adversaries may use serverless functions to execute malicious code, such as crypto-mining malware (i.e. [[T1496_Resource Hijacking|Resource Hijacking]]). [1](https://www.cadosecurity.com/cado-discovers-denonia-the-first-malware-specifically-targeting-lambda/) Adversaries may also create functions that enable further compromise of the cloud environment. For example, an adversary may use the `IAM:PassRole` permission in AWS or the `iam.serviceAccounts.actAs` permission in Google Cloud to add [[T1098_Account Manipulation#Add Office 365 Global Administrator Role - T1098.003|Additional Cloud Roles]] to a serverless cloud function, which may then be able to perform actions the original user cannot. [2](https://rhinosecuritylabs.com/aws/aws-privilege-escalation-methods-mitigation/) [3](https://rhinosecuritylabs.com/gcp/privilege-escalation-google-cloud-platform-part-1/)

Serverless functions can also be invoked in response to cloud events (i.e. [[T1546_Event Triggered Execution|Event Triggered Execution]]), potentially enabling persistent execution over time. For example, in AWS environments, an adversary may create a Lambda function that automatically adds [[T1098_Account Manipulation#Additional Cloud Credentials - T1098.001|Additional Cloud Credentials]] to a user and a corresponding CloudWatch events rule that invokes that function whenever a new user is created. [4](https://medium.com/daniel-grzelak/backdooring-an-aws-account-da007d36f8f9) Similarly, an adversary may create a Power Automate workflow in Office 365 environments that forwards all emails a user receives or creates anonymous sharing links whenever a user is granted access to a document in SharePoint. [5](https://www.varonis.com/blog/power-automate-data-exfiltration) [6](https://www.microsoft.com/security/blog/2020/03/09/real-life-cybercrime-stories-dart-microsoft-detection-and-response-team)

