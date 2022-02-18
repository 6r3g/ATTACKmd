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


