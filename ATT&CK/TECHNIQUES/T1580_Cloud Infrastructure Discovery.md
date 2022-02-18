Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1580  

# Cloud Infrastructure Discovery - T1580
---
## Description
[more on T1580](https://attack.mitre.org/techniques/T1580)

An adversary may attempt to discover resources that are available within an infrastructure-as-a-service (IaaS) environment. This includes compute service resources such as instances, virtual machines, and snapshots as well as resources of other services including the storage and database services.

Cloud providers offer methods such as APIs and commands issued through CLIs to serve information about infrastructure. For example, AWS provides a `DescribeInstances` API within the Amazon EC2 API that can return information about one or more instances within an account, the `ListBuckets` API that returns a list of all buckets owned by the authenticated sender of the request, or the `GetPublicAccessBlock` API to retrieve access block configuration for a bucket [1](https://docs.aws.amazon.com/cli/latest/reference/ssm/describe-instance-information.html)[2](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html)[3](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetPublicAccessBlock.html). Similarly, GCP's Cloud SDK CLI provides the `gcloud compute instances list` command to list all Google Compute Engine instances in a project [4](https://cloud.google.com/sdk/gcloud/reference/compute/instances/list), and Azure's CLI command `az vm list` lists details of virtual machines.[5](https://docs.microsoft.com/en-us/cli/azure/ad/user?view=azure-cli-latest)

An adversary may enumerate resources using a compromised user's access keys to determine which are available to that user.[6](https://expel.io/blog/finding-evil-in-aws/) The discovery of these available resources may help adversaries determine their next steps in the Cloud environment, such as establishing Persistence.[7](https://content.fireeye.com/m-trends/rpt-m-trends-2020)An adversary may also use this information to change the configuration to make the bucket publicly accessible, allowing data to be accessed without authentication. Adversaries have also may use infrastructure discovery APIs such as `DescribeDBInstances` to determine size, owner, permissions, and network ACLs of database resources. [8](https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DescribeDBInstances.html) Adversaries can use this information to determine the potential value of databases and discover the requirements to access them. Unlike in [[T1526_Cloud Service Discovery|Cloud Service Discovery (T1526)]], this technique focuses on the discovery of components of the provided services rather than the services themselves.

---
## Sub-Techniques

#### none
