Tactics: [[INITIAL_ACCESS]] - [[PERSISTENCE]]
Tags: #mitre/attack/techniques/T1133 

# External Remote Services - T1133
---
## Description
[more on T1133](https://attack.mitre.org/techniques/T1133)

Adversaries may leverage external-facing remote services to initially access and/or persist within a network. Remote services such as VPNs, Citrix, and other access mechanisms allow users to connect to internal enterprise network resources from external locations. There are often remote service gateways that manage connections and credential authentication for these services. Services such as [[T1021_Remote Services#Windows Remote Management - T1021 006|Windows Remote Management (T1021.006)]] and [[T1021_Remote Services#VNC - T1021 005|VNC (T1021.005)]] can also be used externally.[1](https://support.apple.com/guide/remote-desktop/set-up-a-computer-running-vnc-software-apdbed09830/mac)

Access to [[T1078_Valid Accounts|Valid Accounts (T1078)]] to use the service is often a requirement, which could be obtained through credential pharming or by obtaining the credentials from users after compromising the enterprise network.[2](https://www.volexity.com/blog/2015/10/07/virtual-private-keylogging-cisco-web-vpns-leveraged-for-access-and-persistence/) Access to remote services may be used as a redundant or persistent access mechanism during an operation.

Access may also be gained through an exposed service that doesn’t require authentication. In containerized environments, this may include an exposed Docker API, Kubernetes API server, kubelet, or web application such as the Kubernetes dashboard.[3](https://www.trendmicro.com/en_us/research/20/f/xorddos-kaiji-botnet-malware-variants-target-exposed-docker-servers.html)[4](https://unit42.paloaltonetworks.com/hildegard-malware-teamtnt/)

---
## Sub-Techniques

#### none