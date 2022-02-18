Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1619  

# Cloud Storage Object Discovery - T1619
---
## Description
[more on T1619](https://attack.mitre.org/techniques/T1619)

Adversaries may enumerate objects in cloud storage infrastructure. Adversaries may use this information during automated discovery to shape follow-on behaviors, including requesting all or specific objects from cloud storage. Similar to [[T1083_File and Directory Discovery|File and Directory Discovery (T1083)]] on a local host, after identifying available storage services (i.e. [[T1580_Cloud Infrastructure Discovery|Cloud Infrastructure Discovery (T1580)]]) adversaries may access the contents/objects stored in cloud infrastructure.

Cloud service providers offer APIs allowing users to enumerate objects stored within cloud storage. Examples include ListObjectsV2 in AWS [1](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html) and List Blobs in Azure. [2](https://docs.microsoft.com/en-us/rest/api/storageservices/list-blobs)

---
## Sub-Techniques

#### none
