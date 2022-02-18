Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1106  

# Native API - T1106
---
## Description
[more on T1106](https://attack.mitre.org/techniques/T1106)

Adversaries may interact with the native OS application programming interface (API) to execute behaviors. Native APIs provide a controlled means of calling low-level OS services within the kernel, such as those involving hardware/devices, memory, and processes.[1](https://undocumented.ntinternals.net/)[2](https://www.kernel.org/doc/html/v4.12/core-api/kernel-api.html) These native APIs are leveraged by the OS during system boot (when other system components are not yet initialized) as well as carrying out tasks and requests during routine operations.

Native API functions (such as `NtCreateProcess`) may be directed invoked via system calls / syscalls, but these features are also often exposed to user-mode applications via interfaces and libraries. [3](https://outflank.nl/blog/2019/06/19/red-team-tactics-combining-direct-system-calls-and-srdi-to-bypass-av-edr/)[4](https://www.cyberbit.com/blog/endpoint-security/malware-mitigation-when-direct-system-calls-are-used/)[5](https://www.mdsec.co.uk/2020/12/bypassing-user-mode-hooks-and-direct-invocation-of-system-calls-for-red-teams/) For example, functions such as the Windows API `CreateProcess()` or GNU `fork()` will allow programs and scripts to start other processes.[6](http://msdn.microsoft.com/en-us/library/ms682425)[7](https://www.gnu.org/software/libc/manual/html_node/Creating-a-Process.html) This may allow API callers to execute a binary, run a CLI command, load modules, etc. as thousands of similar API functions exist for various system operations.[8](https://docs.microsoft.com/en-us/windows/win32/api/)[9](https://man7.org/linux/man-pages//man7/libc.7.html)[10](https://www.gnu.org/software/libc/)

Higher level software frameworks, such as Microsoft .NET and macOS Cocoa, are also available to interact with native APIs. These frameworks typically provide language wrappers/abstractions to API functionalities and are designed for ease-of-use/portability of code.[11](https://dotnet.microsoft.com/learn/dotnet/what-is-dotnet-framework)[12](https://developer.apple.com/documentation/coreservices)[13](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/OSX_Technology_Overview/CocoaApplicationLayer/CocoaApplicationLayer.html#//apple_ref/doc/uid/TP40001067-CH274-SW1)[14](https://developer.apple.com/documentation/foundation)

Adversaries may abuse these OS API functions as a means of executing behaviors. Similar to [[T1059_Command and Scripting Interpreter|Command and Scripting Interpreter (T1059)]], the native API and its hierarchy of interfaces provide mechanisms to interact with and utilize various components of a victimized system. While invoking API functions, adversaries may also attempt to bypass defensive tools (ex: unhooking monitored functions via [[T1562_Impair Defenses#Disable or Modify Tools - T1562 001|Disable or Modify Tools (T1562.001)]]).

---
## Sub-Techniques

#### none