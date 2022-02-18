Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1609 

# Container Administration Command - T1609
---
## Description
[more on T1609](https://attack.mitre.org/techniques/T1609)

Adversaries may abuse a container administration service to execute commands within a container. A container administration service such as the Docker daemon, the Kubernetes API server, or the kubelet may allow remote management of containers within an environment.[1](https://docs.docker.com/engine/reference/commandline/dockerd/)[2](https://kubernetes.io/docs/concepts/overview/kubernetes-api/)[3](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/)

In Docker, adversaries may specify an entrypoint during container deployment that executes a script or command, or they may use a command such as `docker exec` to execute a command within a running container.[4](https://docs.docker.com/engine/reference/run/#entrypoint-default-command-to-execute-at-runtime)[5](https://docs.docker.com/engine/reference/commandline/exec/) In Kubernetes, if an adversary has sufficient permissions, they may gain remote execution in a container in the cluster via interaction with the Kubernetes API server, the kubelet, or by running a command such as `kubectl exec`.[6](https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/)

---
## Sub-Techniques

#### none
