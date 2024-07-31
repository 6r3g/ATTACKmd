Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1578  

# Modify Cloud Compute Infrastructure - T1578
---
## Description
[more on T1578](https://attack.mitre.org/techniques/T1578)

An adversary may attempt to modify a cloud account's compute service infrastructure to evade defenses. A modification to the compute service infrastructure can include the creation, deletion, or modification of one or more components such as compute instances, virtual machines, and snapshots.

Permissions gained from the modification of infrastructure components may bypass restrictions that prevent access to existing infrastructure. Modifying infrastructure components may also allow an adversary to evade detection and remove evidence of their presence.[1](https://content.fireeye.com/m-trends/rpt-m-trends-2020)

---
## Sub-Techniques

#### Create Snapshot - T1578.001
[more on T1578.001](https://attack.mitre.org/techniques/T1578/001)

An adversary may create a snapshot or data backup within a cloud account to evade defenses. A snapshot is a point-in-time copy of an existing cloud compute component such as a virtual machine (VM), virtual hard drive, or volume. An adversary may leverage permissions to create a snapshot in order to bypass restrictions that prevent access to existing compute service infrastructure, unlike in [[T1578_Modify Cloud Compute Infrastructure#Revert Cloud Instance - T1578 004|Revert Cloud Instance (T1578.004)]] where an adversary may revert to a snapshot to evade detection and remove evidence of their presence.

An adversary may [[T1578_Modify Cloud Compute Infrastructure#Create Cloud Instance - T1578 002|Create Cloud Instance (T1578.002)]], mount one or more created snapshots to that instance, and then apply a policy that allows the adversary access to the created instance, such as a firewall policy that allows them inbound and outbound SSH access.[1](https://content.fireeye.com/m-trends/rpt-m-trends-2020)

#### Create Cloud Instance - T1578.002
[more on T1578.002](https://attack.mitre.org/techniques/T1578/002)

An adversary may create a new instance or virtual machine (VM) within the compute service of a cloud account to evade defenses. Creating a new instance may allow an adversary to bypass firewall rules and permissions that exist on instances currently residing within an account. An adversary may [[T1578_Modify Cloud Compute Infrastructure#Create Snapshot - T1578 001|Create Snapshot (T1578.001)]] of one or more volumes in an account, create a new instance, mount the snapshots, and then apply a less restrictive security policy to collect [[T1005_Data from Local System|Data from Local System (T1005)]] or for [[T1074_Data Staged#Remote Data Staging - T1074 002|Remote Data Staging (T1074.002)]].[1](https://content.fireeye.com/m-trends/rpt-m-trends-2020)

Creating a new instance may also allow an adversary to carry out malicious activity within an environment without affecting the execution of current running instances.

#### Delete Cloud Instance - T1578.003
[more on T1578.003](https://attack.mitre.org/techniques/T1578/003)

An adversary may delete a cloud instance after they have performed malicious activities in an attempt to evade detection and remove evidence of their presence. Deleting an instance or virtual machine can remove valuable forensic artifacts and other evidence of suspicious behavior if the instance is not recoverable.

An adversary may also [[T1578_Modify Cloud Compute Infrastructure#Create Cloud Instance - T1578 002|Create Cloud Instance (T1578.002)]] and later terminate the instance after achieving their objectives.[1](https://content.fireeye.com/m-trends/rpt-m-trends-2020)

#### Revert Cloud Instance - T1578.004
[more on T1578.004](https://attack.mitre.org/techniques/T1578/004)

An adversary may revert changes made to a cloud instance after they have performed malicious activities in attempt to evade detection and remove evidence of their presence. In highly virtualized environments, such as cloud-based infrastructure, this may be accomplished by restoring virtual machine (VM) or data storage snapshots through the cloud management dashboard or cloud APIs.

Another variation of this technique is to utilize temporary storage attached to the compute instance. Most cloud providers provide various types of storage including persistent, local, and/or ephemeral, with the ephemeral types often reset upon stop/restart of the VM.[1](https://www.techrepublic.com/blog/the-enterprise-cloud/backing-up-and-restoring-snapshots-on-amazon-ec2-machines/)[2](https://cloud.google.com/compute/docs/disks/restore-and-delete-snapshots)

#### Modify Cloud Compute Configurations - T1578.005
[more on T1578.005](https://attack.mitre.org/techniques/T1578/005)

Adversaries may modify settings that directly affect the size, locations, and resources available to cloud compute infrastructure in order to evade defenses. These settings may include service quotas, subscription associations, tenant-wide policies, or other configurations that impact available compute. Such modifications may allow adversaries to abuse the victim’s compute resources to achieve their goals, potentially without affecting the execution of running instances and/or revealing their activities to the victim.

For example, cloud providers often limit customer usage of compute resources via quotas. Customers may request adjustments to these quotas to support increased computing needs, though these adjustments may require approval from the cloud provider. Adversaries who compromise a cloud environment may similarly request quota adjustments in order to support their activities, such as enabling additional [[T1496_Resource Hijacking|Resource Hijacking]] without raising suspicion by using up a victim’s entire quota. [1](https://www.microsoft.com/en-us/security/blog/2023/07/25/cryptojacking-understanding-and-defending-against-cloud-compute-resource-abuse/) Adversaries may also increase allowed resource usage by modifying any tenant-wide policies that limit the sizes of deployed virtual machines. [2](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies#compute)

Adversaries may also modify settings that affect where cloud resources can be deployed, such as enabling [[T1535_Unused-Unsupported Cloud Regions|Unused/Unsupported Cloud Regions]]. In Azure environments, an adversary who has gained access to a Global Administrator account may create new subscriptions in which to deploy resources, or engage in subscription hijacking by transferring an existing pay-as-you-go subscription from a victim tenant to an adversary-controlled tenant. [3](https://www.microsoft.com/en-us/security/blog/2023/09/14/peach-sandstorm-password-spray-campaigns-enable-intelligence-collection-at-high-value-targets/) This will allow the adversary to use the victim’s compute resources without generating logs on the victim tenant. [2](https://learn.microsoft.com/en-us/azure/governance/policy/samples/built-in-policies#compute) [4](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/hunt-for-compromised-azure-subscriptions-using-microsoft/ba-p/3607121)

