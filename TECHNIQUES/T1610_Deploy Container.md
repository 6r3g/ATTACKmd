Tactics: [[EXECUTION]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1610  

# Deploy Container - T1610
---
## Description
[more on T1610](https://attack.mitre.org/techniques/T1610)

Adversaries may deploy a container into an environment to facilitate execution or evade defenses. In some cases, adversaries may deploy a new container to execute processes associated with a particular image or deployment, such as processes that execute or download malware. In others, an adversary may deploy a new container configured without network rules, user limitations, etc. to bypass existing defenses within the environment.

Containers can be deployed by various means, such as via Docker's `create` and `start` APIs or via a web application such as the Kubernetes dashboard or Kubeflow.[1](https://docs.docker.com/engine/api/v1.41/#tag/Container)[2](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)[3](https://www.kubeflow.org/docs/components/pipelines/overview/pipelines-overview/) Adversaries may deploy containers based on retrieved or built malicious images or from benign images that download and execute malicious payloads at runtime.[4](https://blog.aquasec.com/malicious-container-image-docker-container-host)

---
## Sub-Techniques

#### none
