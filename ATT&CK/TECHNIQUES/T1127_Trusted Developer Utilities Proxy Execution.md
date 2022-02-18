Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1127  

# Trusted Developer Utilities Proxy Execution - T1127
---
## Description
[more on T1127](https://attack.mitre.org/techniques/T1127)

Adversaries may take advantage of trusted developer utilities to proxy execution of malicious payloads. There are many utilities used for software development related tasks that can be used to execute code in various forms to assist in development, debugging, and reverse engineering.[1](https://enigma0x3.net/2016/11/17/bypassing-application-whitelisting-by-using-dnx-exe/)[2](https://enigma0x3.net/2016/11/21/bypassing-application-whitelisting-by-using-rcsi-exe/)[3](http://www.exploit-monday.com/2016/08/windbg-cdb-shellcode-runner.html)[4](https://lolbas-project.github.io/lolbas/OtherMSBinaries/Tracker/) These utilities may often be signed with legitimate certificates that allow them to execute on a system and proxy execution of malicious code through a trusted process that effectively bypasses application control solutions.

---
## Sub-Techniques

#### MSBuild - T1127.001
[more on T1127.001](https://attack.mitre.org/techniques/T1127/001)

Adversaries may use MSBuild to proxy execution of code through a trusted Windows utility. MSBuild.exe (Microsoft Build Engine) is a software build platform used by Visual Studio. It handles XML formatted project files that define requirements for loading and building various platforms and configurations.[1](https://msdn.microsoft.com/library/dd393574.aspx)

Adversaries can abuse MSBuild to proxy execution of malicious code. The inline task capability of MSBuild that was introduced in .NET version 4 allows for C# or Visual Basic code to be inserted into an XML project file.[1](https://msdn.microsoft.com/library/dd393574.aspx)[2](https://docs.microsoft.com/en-us/visualstudio/msbuild/msbuild-inline-tasks?view=vs-2019#code-element) MSBuild will compile and execute the inline task. MSBuild.exe is a signed Microsoft binary, so when it is used this way it can execute arbitrary code and bypass application control defenses that are configured to allow MSBuild.exe execution.[3](https://lolbas-project.github.io/lolbas/Binaries/Msbuild/)



