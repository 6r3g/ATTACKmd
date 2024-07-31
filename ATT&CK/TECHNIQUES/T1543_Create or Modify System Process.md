Tactics: [[PERSISTENCE]] - [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/techniques/T1543  

# Create or Modify System Process - T1543
---
## Description
[more on T1543](https://attack.mitre.org/techniques/T1543)

Adversaries may create or modify system-level processes to repeatedly execute malicious payloads as part of [[persistence]]. When operating systems boot up, they can start processes that perform background system functions. On Windows and Linux, these system processes are referred to as services. [1](https://technet.microsoft.com/en-us/library/cc772408.aspx) On macOS, launchd processes known as [[T1543_Create or Modify System Process#Launch Daemon - T1543 004|Launch Daemon (T1543.004)]] and [[T1543_Create or Modify System Process#Launch Agent - T1543 001|Launch Agent (T1543.001)]] are run to finish system initialization and load user specific parameters.[2](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)

Adversaries may install new services, daemons, or agents that can be configured to execute at startup or a repeatable interval in order to establish [[persistence]]. Similarly, adversaries may modify existing services, daemons, or agents to achieve the same effect.

Services, daemons, or agents may be created with administrator privileges but executed under root/SYSTEM privileges. Adversaries may leverage this functionality to create or modify system processes in order to escalate privileges. [3](https://www.synack.com/wp-content/uploads/2016/03/RSA_OSX_Malware.pdf).

---
## Sub-Techniques

#### Launch Agent - T1543.001
[more on T1543.001](https://attack.mitre.org/techniques/T1543/001)

Adversaries may create or modify launch agents to repeatedly execute malicious payloads as part of [[persistence]]. When a user logs in, a per-user launchd process is started which loads the parameters for each launch-on-demand user agent from the property list (.plist) file found in `/System/Library/LaunchAgents`, `/Library/LaunchAgents`, and `~/Library/LaunchAgents`.[1](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)[2](https://www.welivesecurity.com/2016/07/06/new-osxkeydnap-malware-hungry-credentials/) [3](https://blog.malwarebytes.com/threat-analysis/2017/01/new-mac-backdoor-using-antiquated-code/) Property list files use the `Label`, `ProgramArguments` , and `RunAtLoad` keys to identify the Launch Agent's name, executable location, and execution time.[4](https://blog.malwarebytes.com/threat-analysis/2017/04/new-osx-dok-malware-intercepts-web-traffic/) Launch Agents are often installed to perform updates to programs, launch user specified programs at login, or to conduct other developer tasks.

Launch Agents can also be executed using the [[T1569_System Services#Launchctl - T1569 001|Launchctl (T1569.001)]] command.

Adversaries may install a new Launch Agent that executes at login by placing a .plist file into the appropriate folders with the `RunAtLoad` or `KeepAlive` keys set to `true`.[5](https://researchcenter.paloaltonetworks.com/2016/09/unit42-sofacys-komplex-os-x-trojan/)[6](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf) The Launch Agent name may be disguised by using a name from the related operating system or benign software. Launch Agents are created with user level privileges and execute with user level permissions.[7](https://www.synack.com/wp-content/uploads/2016/03/RSA_OSX_Malware.pdf)[8](https://www.alienvault.com/blogs/labs-research/oceanlotus-for-os-x-an-application-bundle-pretending-to-be-an-adobe-flash-update)

#### Systemd Service - T1543.002
[more on T1543.002](https://attack.mitre.org/techniques/T1543/002)

Adversaries may create or modify systemd services to repeatedly execute malicious payloads as part of [[persistence]]. The systemd service manager is commonly used for managing background daemon processes (also known as services) and other system resources.[1](http://man7.org/linux/man-pages/man1/systemd.1.html)[2](https://www.freedesktop.org/wiki/Software/systemd/) Systemd is the default initialization (init) system on many Linux distributions starting with Debian 8, Ubuntu 15.04, CentOS 7, RHEL 7, Fedora 15, and replaces legacy init systems including SysVinit and Upstart while remaining backwards compatible with the aforementioned init systems.

Systemd utilizes configuration files known as service units to control how services boot and under what conditions. By default, these unit files are stored in the `/etc/systemd/system` and `/usr/lib/systemd/system` directories and have the file extension `.service`. Each service unit file may contain numerous directives that can execute system commands:

-   ExecStart, ExecStartPre, and ExecStartPost directives cover execution of commands when a services is started manually by 'systemctl' or on system start if the service is set to automatically start.
-   ExecReload directive covers when a service restarts.
-   ExecStop and ExecStopPost directives cover when a service is stopped or manually by 'systemctl'.

Adversaries have used systemd functionality to establish persistent access to victim systems by creating and/or modifying service unit files that cause systemd to execute malicious commands at system boot.[3](https://www.anomali.com/blog/rocke-evolves-its-arsenal-with-a-new-malware-family-written-in-golang)

While adversaries typically require root privileges to create/modify service unit files in the `/etc/systemd/system` and `/usr/lib/systemd/system` directories, low privilege users can create/modify service unit files in directories such as `~/.config/systemd/user/` to achieve user-level [[persistence]].[4](https://www.rapid7.com/db/modules/exploit/linux/local/service_persistence)

#### Windows Service - T1543.003
[more on T1543.003](https://attack.mitre.org/techniques/T1543/003)

Adversaries may create or modify Windows services to repeatedly execute malicious payloads as part of [[persistence]]. When Windows boots up, it starts programs or applications called services that perform background system functions.[1](https://technet.microsoft.com/en-us/library/cc772408.aspx) Windows service configuration information, including the file path to the service's executable or recovery programs/commands, is stored in the Windows Registry. Service configurations can be modified using utilities such as sc.exe and [Reg](https://attack.mitre.org/software/S0075).

Adversaries may install a new service or modify an existing service by using system utilities to interact with services, by directly modifying the Registry, or by using custom tools to interact with the Windows API. Adversaries may configure services to execute at startup in order to persist on a system.

An adversary may also incorporate [[T1036_Masquerading|Masquerading (T1036)]] by using a service name from a related operating system or benign software, or by modifying existing services to make detection analysis more challenging. Modifying existing services may interrupt their functionality or may enable services that are disabled or otherwise not commonly used.

Services may be created with administrator privileges but are executed under SYSTEM privileges, so an adversary may also use a service to escalate privileges from administrator to SYSTEM. Adversaries may also directly start services through [[T1569_System Services#Service Execution - T1569 002|Service Execution (T1569.002)]].

#### Launch Daemon - T1543.004
[more on T1543.004](https://attack.mitre.org/techniques/T1543/004)

Adversaries may create or modify Launch Daemons to execute malicious payloads as part of [[persistence]]. Launch Daemons are plist files used to interact with Launchd, the service management framework used by macOS. Launch Daemons require elevated privileges to install, are executed for every user on a system prior to login, and run in the background without the need for user interaction. During the macOS initialization startup, the launchd process loads the parameters for launch-on-demand system-level daemons from plist files found in `/System/Library/LaunchDaemons/` and `/Library/LaunchDaemons/`. Required Launch Daemons parameters include a `Label` to identify the task, `Program` to provide a path to the executable, and `RunAtLoad` to specify when the task is run. Launch Daemons are often used to provide access to shared resources, updates to software, or conduct automation tasks.[1](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html)[2](https://www.virusbulletin.com/uploads/pdf/conference/vb2014/VB2014-Wardle.pdf)[3](https://www.real-world-systems.com/docs/launchdPlist.1.html)

Adversaries may install a Launch Daemon configured to execute at startup by using the `RunAtLoad` parameter set to `true` and the `Program` parameter set to the malicious executable path. The daemon name may be disguised by using a name from a related operating system or benign software (i.e. [[T1036_Masquerading|Masquerading (T1036)]]). When the Launch Daemon is executed, the program inherits administrative permissions.[4](https://www.paloaltonetworks.com/content/dam/pan/en_US/assets/pdf/reports/Unit_42/unit42-wirelurker.pdf)[5](https://www.synack.com/wp-content/uploads/2016/03/RSA_OSX_Malware.pdf)

Additionally, system configuration changes (such as the installation of third party package managing software) may cause folders such as `usr/local/bin` to become globally writeable. So, it is possible for poor configurations to allow an adversary to modify executables referenced by current Launch Daemon's plist files.[6](https://bradleyjkemp.dev/post/launchdaemon-hijacking/)[7](https://www.sentinelone.com/blog/how-malware-persists-on-macos/)

#### Container Service - T1543.005
[more on T1543.005](https://attack.mitre.org/techniques/T1543/005)

Adversaries may create or modify container or container cluster management tools that run as daemons, agents, or services on individual hosts. These include software for creating and managing individual containers, such as Docker and Podman, as well as container cluster node-level agents such as kubelet. By modifying these services, an adversary may be able to achieve persistence or escalate their privileges on a host.

For example, by using the `docker run` or `podman run` command with the `restart=always` directive, a container can be configured to persistently restart on the host. [1](https://blog.aquasec.com/teamtnt-reemerged-with-new-aggressive-cloud-campaign) A user with access to the (rootful) docker command may also be able to escalate their privileges on the host. [2](https://gtfobins.github.io/gtfobins/docker/)

In Kubernetes environments, DaemonSets allow an adversary to persistently [[T1610_Deploy Container|Deploy Container]]s on all nodes, including ones added later to the cluster. [3](https://blog.aquasec.com/leveraging-kubernetes-rbac-to-backdoor-clusters) [4](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) Pods can also be deployed to specific nodes using the `nodeSelector` or `nodeName` fields in the pod spec. [5](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) [6](https://blog.appsecco.com/kubernetes-namespace-breakout-using-insecure-host-path-volume-part-1-b382f2a6e216)

Note that containers can also be configured to run as [Systemd Service](https://attack.mitre.org/techniques/T1543/002)s. [7](https://www.redhat.com/sysadmin/podman-run-pods-systemd-services) [8](https://docs.docker.com/config/containers/start-containers-automatically/)
