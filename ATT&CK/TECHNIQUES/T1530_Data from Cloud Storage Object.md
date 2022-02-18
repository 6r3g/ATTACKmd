Tactics: [[COLLECTION]]
Tags: #mitre/attack/techniques/T1530  

# Data from Cloud Storage Object - T1530
---
## Description
[more on T1530](https://attack.mitre.org/techniques/T1530)

Adversaries may access data objects from improperly secured cloud storage.

Many cloud service providers offer solutions for online data storage such as Amazon S3, Azure Storage, and Google Cloud Storage. These solutions differ from other storage solutions (such as SQL or Elasticsearch) in that there is no overarching application. Data from these solutions can be retrieved directly using the cloud provider's APIs. Solution providers typically offer security guides to help end users configure systems.[1](https://aws.amazon.com/premiumsupport/knowledge-center/secure-s3-resources/)[2](https://docs.microsoft.com/en-us/azure/storage/common/storage-security-guide)[3](https://cloud.google.com/storage/docs/best-practices)

Misconfiguration by end users is a common problem. There have been numerous incidents where cloud storage has been improperly secured (typically by unintentionally allowing public access by unauthenticated users or overly-broad access by all users), allowing open access to credit cards, personally identifiable information, medical records, and other sensitive information.[4](https://www.trendmicro.com/vinfo/us/security/news/virtualization-and-cloud/a-misconfigured-amazon-s3-exposed-almost-50-thousand-pii-in-australia)[5](https://www.wired.com/story/magecart-amazon-cloud-hacks/)[6](https://www.hipaajournal.com/47gb-medical-records-unsecured-amazon-s3-bucket/) Adversaries may also obtain leaked credentials in source repositories, logs, or other means as a way to gain access to cloud storage objects that have access permission controls.

---
## Sub-Techniques

#### none
