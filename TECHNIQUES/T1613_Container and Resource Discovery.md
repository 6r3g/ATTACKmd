Tactics: [[DISCOVERY]]
Tags: #mitre/attack/techniques/T1613  

# Container and Resource Discovery - T1613
---
## Description
[more on T1613](https://attack.mitre.org/techniques/T1613)

Adversaries may attempt to discover containers and other resources that are available within a containers environment. Other resources may include images, deployments, pods, nodes, and other information such as the status of a cluster.

These resources can be viewed within web applications such as the Kubernetes dashboard or can be queried via the Docker and Kubernetes APIs.[1](https://docs.docker.com/engine/api/v1.41/)[2](https://kubernetes.io/docs/concepts/overview/kubernetes-api/) In Docker, logs may leak information about the environment, such as the environment’s configuration, which services are available, and what cloud provider the victim may be utilizing. The discovery of these resources may inform an adversary’s next steps in the environment, such as how to perform lateral movement and which methods to utilize for execution.

---
## Sub-Techniques

#### none
