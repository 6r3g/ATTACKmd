Tactics: [[EXECUTION]] - [[PERSISTENCE]] - [[PRIVILEGE_ESCALATION]]
Tags: #mitre/attack/techniques/T1053  

# Scheduled Task/Job - T1053
---
## Description
[more on T1053](https://attack.mitre.org/techniques/T1053)

Adversaries may abuse task scheduling functionality to facilitate initial or recurring execution of malicious code. Utilities exist within all major operating systems to schedule programs or scripts to be executed at a specified date and time. A task can also be scheduled on a remote system, provided the proper authentication is met (ex: RPC and file and printer sharing in Windows environments). Scheduling a task on a remote system typically requires being a member of an admin or otherwise privileged group on the remote system.[1](https://technet.microsoft.com/en-us/library/cc785125.aspx)

Adversaries may use task scheduling to execute programs at system startup or on a scheduled basis for persistence. These mechanisms can also be abused to run a process under the context of a specified account (such as one with elevated permissions/privileges).

---
## Sub-Techniques

#### At (Linux) - T1053.001
[more on T1053.001](https://attack.mitre.org/techniques/T1053/001)

Adversaries may abuse the [at](https://attack.mitre.org/software/S0110) utility to perform task scheduling for initial, recurring, or future execution of malicious code. The [at](https://attack.mitre.org/software/S0110) command within Linux operating systems enables administrators to schedule tasks.[1](https://kifarunix.com/scheduling-tasks-using-at-command-in-linux/)

An adversary may use [at](https://attack.mitre.org/software/S0110) in Linux environments to execute programs at system startup or on a scheduled basis for persistence. [at](https://attack.mitre.org/software/S0110) can also be abused to conduct remote execution as part of Lateral Movement and or to run a process under the context of a specified account.

Adversaries may also abuse [at](https://attack.mitre.org/software/S0110) to break out of restricted environments by using a task to spawn an interactive system shell or to run system commands. Similarly, [at](https://attack.mitre.org/software/S0110) may also be used for [[PRIVILEGE_ESCALATION|Privilege escalation]] if the binary is allowed to run as superuser via `sudo`.[2](https://gtfobins.github.io/gtfobins/at/)

#### At (Windows) - T1053.002
[more on T1053.002](https://attack.mitre.org/techniques/T1053/002)

Adversaries may abuse the `at.exe` utility to perform task scheduling for initial or recurring execution of malicious code. The [at](https://attack.mitre.org/software/S0110) utility exists as an executable within Windows for scheduling tasks at a specified time and date. Using [at](https://attack.mitre.org/software/S0110) requires that the Task Scheduler service be running, and the user to be logged on as a member of the local Administrators group.

An adversary may use `at.exe` in Windows environments to execute programs at system startup or on a scheduled basis for persistence. [at](https://attack.mitre.org/software/S0110) can also be abused to conduct remote execution as part of Lateral Movement and or to run a process under the context of a specified account (such as SYSTEM).

Note: The `at.exe` command line utility has been deprecated in current versions of Windows in favor of `schtasks`.

#### Cron - T1053.003
[more on T1053.003](https://attack.mitre.org/techniques/T1053/003)

Adversaries may abuse the `cron` utility to perform task scheduling for initial or recurring execution of malicious code.[1](https://labs.sentinelone.com/20-common-tools-techniques-used-by-macos-threat-actors-malware/) The `cron` utility is a time-based job scheduler for Unix-like operating systems. The `crontab` file contains the schedule of cron entries to be run and the specified times for execution. Any `crontab` files are stored in operating system-specific file paths.

An adversary may use `cron` in Linux or Unix environments to execute programs at system startup or on a scheduled basis for persistence.

#### Launchd - T1053.004
[xLaunchd](https://attack.mitre.org/techniques/T1053/004)

**This technique is deprecated due to the inaccurate usage.** The report cited did not provide technical detail as to how the malware interacted directly with launchd rather than going through known services. Other system services are used to interact with launchd rather than launchd being used by itself.

#### Scheduled Task - T1053.005
[more on T1053.005](https://attack.mitre.org/techniques/T1053/005)

Adversaries may abuse the Windows Task Scheduler to perform task scheduling for initial or recurring execution of malicious code. There are multiple ways to access the Task Scheduler in Windows. The `schtasks` can be run directly on the command line, or the Task Scheduler can be opened through the GUI within the Administrator Tools section of the Control Panel. In some cases, adversaries have used a .NET wrapper for the Windows Task Scheduler, and alternatively, adversaries have used the Windows netapi32 library to create a scheduled task.

The deprecated [at](https://attack.mitre.org/software/S0110) utility could also be abused by adversaries (ex: [[T1053_Scheduled Task-Job#At (Windows) - T1053 002|At (Windows) (T1053.002)]]), though `at.exe` can not access tasks created with `schtasks` or the Control Panel.

An adversary may use Windows Task Scheduler to execute programs at system startup or on a scheduled basis for persistence. The Windows Task Scheduler can also be abused to conduct remote Execution as part of Lateral Movement and or to run a process under the context of a specified account (such as SYSTEM).

#### Systemd Timers - T1053.006
[more on T1053.006](https://attack.mitre.org/techniques/T1053/006)

Adversaries may abuse systemd timers to perform task scheduling for initial or recurring execution of malicious code. Systemd timers are unit files with file extension `.timer` that control services. Timers can be set to run on a calendar event or after a time span relative to a starting point. They can be used as an alternative to [[T1053_Scheduled Task-Job#Cron - T1053 003|Cron (T1053.003)]] in Linux environments.[1](https://wiki.archlinux.org/index.php/Systemd/Timers) Systemd timers may be activated remotely via the `systemctl` command line utility, which operates over [[T1021_Remote Services#SSH - T1021 004|SSH (T1021.004)]].[2](https://www.tecmint.com/control-systemd-services-on-remote-linux-server/)

Each `.timer` file must have a corresponding `.service` file with the same name, e.g., `example.timer` and `example.service`. `.service` files are [[T1543_Create or Modify System Process#Systemd Service - T1543 002|Systemd Service (T1543.002)]] unit files that are managed by the systemd system and service manager.[3](http://man7.org/linux/man-pages/man1/systemd.1.html) Privileged timers are written to `/etc/systemd/system/` and `/usr/lib/systemd/system` while user level are written to `~/.config/systemd/user/`.

An adversary may use systemd timers to execute malicious code at system startup or on a scheduled basis for persistence.[4](https://www.bleepingcomputer.com/news/security/malware-found-in-arch-linux-aur-package-repository/)[5](https://gist.github.com/campuscodi/74d0d2e35d8fd9499c76333ce027345a)[6](https://lists.archlinux.org/pipermail/aur-general/2018-July/034153.html) Timers installed using privileged paths may be used to maintain root level persistence. Adversaries may also install user level timers to achieve user level persistence.

#### Container Orchestration Job - T1053.007
[more on T1053.007](https://attack.mitre.org/techniques/T1053/007)

Adversaries may abuse task scheduling functionality provided by container orchestration tools such as Kubernetes to schedule deployment of containers configured to execute malicious code. Container orchestration jobs run these automated tasks at a specific date and time, similar to cron jobs on a Linux system. Deployments of this type can also be configured to maintain a quantity of containers over time, automating the process of maintaining persistence within a cluster.

In Kubernetes, a CronJob may be used to schedule a Job that runs one or more containers to perform specific tasks.[1](https://kubernetes.io/docs/concepts/workloads/controllers/job/)[2](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) An adversary therefore may utilize a CronJob to schedule deployment of a Job that executes malicious code in various nodes within a cluster.[3](https://www.microsoft.com/security/blog/2020/04/02/attack-matrix-kubernetes/)

