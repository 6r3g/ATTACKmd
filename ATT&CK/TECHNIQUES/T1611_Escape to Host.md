Tactics: [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/techniques/T1611  

# Escape to Host - T1611
---
## Description
[more on T1611](https://attack.mitre.org/techniques/T1611)

Adversaries may break out of a container to gain access to the underlying host. This can allow an adversary access to other containerized resources from the host level or to the host itself. In principle, containerized resources should provide a clear separation of application functionality and be isolated from the host environment.[1](https://docs.docker.com/get-started/overview/)

There are multiple ways an adversary may escape to a host environment. Examples include creating a container configured to mount the host’s filesystem using the bind parameter, which allows the adversary to drop payloads and execute control utilities such as cron on the host, or utilizing a privileged container to run commands on the underlying host.[2](https://docs.docker.com/storage/bind-mounts/)[3](https://www.trendmicro.com/en_us/research/19/l/why-running-a-privileged-container-in-docker-is-a-bad-idea.html)[4](https://www.intezer.com/blog/cloud-security/watch-your-containers-doki-infecting-docker-servers-in-the-cloud/) Adversaries may also escape via [[T1068_Exploitation for Privilege Escalation|Exploitation for Privilege Escalation (T1068)]], such as exploiting vulnerabilities in global symbolic links in order to access the root directory of a host machine.[5](https://unit42.paloaltonetworks.com/windows-server-containers-vulnerabilities/)

Gaining access to the host may provide the adversary with the opportunity to achieve follow-on objectives, such as establishing persistence, moving laterally within the environment, or setting up a command and control channel on the host.

---
## Sub-Techniques

#### none
