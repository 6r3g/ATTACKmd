Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1526  

# Cloud Service Discovery - T1526
---
## Description
[more on T1526](https://attack.mitre.org/techniques/T1526)

An adversary may attempt to enumerate the cloud services running on a system after gaining access. These methods can differ from platform-as-a-service (PaaS), to infrastructure-as-a-service (IaaS), or software-as-a-service (SaaS). Many services exist throughout the various cloud providers and can include Continuous Integration and Continuous Delivery (CI/CD), Lambda Functions, Azure AD, etc.

Adversaries may attempt to discover information about the services enabled throughout the environment. Azure tools and APIs, such as the Azure AD Graph API and Azure Resource Manager API, can enumerate resources and services, including applications, management groups, resources and policy definitions, and their relationships that are accessible by an identity.[1](https://docs.microsoft.com/en-us/rest/api/resources/)[2](https://docs.microsoft.com/en-us/previous-versions/azure/ad/graph/howto/azure-ad-graph-api-operations-overview)

Stormspotter is an open source tool for enumerating and constructing a graph for Azure resources and services, and Pacu is an open source AWS exploitation framework that supports several methods for discovering cloud services.[3](https://github.com/Azure/Stormspotter)[4](https://github.com/RhinoSecurityLabs/pacu)

---
## Sub-Techniques

#### none
