Tactics: [[PRIVILEGE_ESCALATION]] - [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1055  

# Process Injection - T1055
---
## Description
[more on T1055](https://attack.mitre.org/techniques/T1055)

Adversaries may inject code into processes in order to evade process-based defenses as well as possibly elevate privileges. Process injection is a method of executing arbitrary code in the address space of a separate live process. Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via process injection may also evade detection from security products since the execution is masked under a legitimate process.

There are many different ways to inject code into a process, many of which abuse legitimate functionalities. These implementations exist for every major OS but are typically platform specific.

More sophisticated samples may perform multiple process injections to segment modules and further evade detection, utilizing named pipes or other inter-process communication (IPC) mechanisms as a communication channel.

---
## Sub-Techniques

#### Dynamic-link Library Injection - T1055.001
[more on T1055.001](https://attack.mitre.org/techniques/T1055/001)

Adversaries may inject dynamic-link libraries (DLLs) into processes in order to evade process-based defenses as well as possibly elevate privileges. DLL injection is a method of executing arbitrary code in the address space of a separate live process.

DLL injection is commonly performed by writing the path to a DLL in the virtual address space of the target process before loading the DLL by invoking a new thread. The write can be performed with native Windows API calls such as `VirtualAllocEx` and `WriteProcessMemory`, then invoked with `CreateRemoteThread` (which calls the `LoadLibrary` API responsible for loading the DLL). [1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

Variations of this method such as reflective DLL injection (writing a self-mapping DLL into a process) and memory module (map DLL when writing into process) overcome the address relocation issue as well as the additional APIs to invoke execution (since these methods load and execute the files in memory by manually preforming the function of `LoadLibrary`).[2](https://www.endgame.com/blog/technical-blog/hunting-memory)[1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via DLL injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Portable Executable Injection - T1055.002
[more on T1055.002](https://attack.mitre.org/techniques/T1055/002)

Adversaries may inject portable executables (PE) into processes in order to evade process-based defenses as well as possibly elevate privileges. PE injection is a method of executing arbitrary code in the address space of a separate live process.

PE injection is commonly performed by copying code (perhaps without a file on disk) into the virtual address space of the target process before invoking it via a new thread. The write can be performed with native Windows API calls such as `VirtualAllocEx` and `WriteProcessMemory`, then invoked with `CreateRemoteThread` or additional code (ex: shellcode). The displacement of the injected code does introduce the additional requirement for functionality to remap memory references. [1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via PE injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Thread Execution Hijacking - T1055.003
[more on T1055.003](https://attack.mitre.org/techniques/T1055/003)

Adversaries may inject malicious code into hijacked processes in order to evade process-based defenses as well as possibly elevate privileges. Thread Execution Hijacking is a method of executing arbitrary code in the address space of a separate live process.

Thread Execution Hijacking is commonly performed by suspending an existing process then unmapping/hollowing its memory, which can then be replaced with malicious code or the path to a DLL. A handle to an existing victim process is first created with native Windows API calls such as `OpenThread`. At this point the process can be suspended then written to, realigned to the injected code, and resumed via `SuspendThread` , `VirtualAllocEx`, `WriteProcessMemory`, `SetThreadContext`, then `ResumeThread` respectively.[1](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

This is very similar to [[T1055_Process Injection#Process Hollowing - T1055 012|Process Hollowing (T1055.012)]] but targets an existing process rather than creating a process in a suspended state.

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via Thread Execution Hijacking may also evade detection from security products since the execution is masked under a legitimate process.

#### Asynchronous Procedure Call - T1055.004
[more on T1055.004](https://attack.mitre.org/techniques/T1055/004)

Adversaries may inject malicious code into processes via the asynchronous procedure call (APC) queue in order to evade process-based defenses as well as possibly elevate privileges. APC injection is a method of executing arbitrary code in the address space of a separate live process.

APC injection is commonly performed by attaching malicious code to the APC Queue [1](https://msdn.microsoft.com/library/windows/desktop/ms681951.aspx) of a process's thread. Queued APC functions are executed when the thread enters an alterable state.[1](https://msdn.microsoft.com/library/windows/desktop/ms681951.aspx) A handle to an existing victim process is first created with native Windows API calls such as `OpenThread`. At this point `QueueUserAPC` can be used to invoke a function (such as `LoadLibrayA` pointing to a malicious DLL).

A variation of APC injection, dubbed "Early Bird injection", involves creating a suspended process in which malicious code can be written and executed before the process' entry point (and potentially subsequent anti-malware hooks) via an APC. [2](https://www.cyberbit.com/blog/endpoint-security/new-early-bird-code-injection-technique-discovered/) AtomBombing [3](https://blog.ensilo.com/atombombing-brand-new-code-injection-for-windows) is another variation that utilizes APCs to invoke malicious code previously written to the global atom table.[4](https://msdn.microsoft.com/library/windows/desktop/ms649053.aspx)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via APC injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Thread Local Storage - T1055.005
[more on T1055.005](https://attack.mitre.org/techniques/T1055/005)

Adversaries may inject malicious code into processes via thread local storage (TLS) callbacks in order to evade process-based defenses as well as possibly elevate privileges. TLS callback injection is a method of executing arbitrary code in the address space of a separate live process.

TLS callback injection involves manipulating pointers inside a portable executable (PE) to redirect a process to malicious code before reaching the code's legitimate entry point. TLS callbacks are normally used by the OS to setup and/or cleanup data used by threads. Manipulating TLS callbacks may be performed by allocating and writing to specific offsets within a process’ memory space using other [[T1055_Process Injection|Process Injection (T1055)]] techniques such as [[T1055_Process Injection#Process Hollowing - T1055 012|Process Hollowing (T1055.012)]].[1](https://www.fireeye.com/blog/threat-research/2017/11/ursnif-variant-malicious-tls-callback-technique.html)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via TLS callback injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Ptrace System Calls - T1055.008
[more on T1055.008](https://attack.mitre.org/techniques/T1055/008)

Adversaries may inject malicious code into processes via ptrace (process trace) system calls in order to evade process-based defenses as well as possibly elevate privileges. Ptrace system call injection is a method of executing arbitrary code in the address space of a separate live process.

Ptrace system call injection involves attaching to and modifying a running process. The ptrace system call enables a debugging process to observe and control another process (and each individual thread), including changing memory and register values.[1](http://man7.org/linux/man-pages/man2/ptrace.2.html) Ptrace system call injection is commonly performed by writing arbitrary code into a running process (ex: `malloc`) then invoking that memory with `PTRACE_SETREGS` to set the register containing the next instruction to execute. Ptrace system call injection can also be done with `PTRACE_POKETEXT`/`PTRACE_POKEDATA`, which copy data to a specific address in the target processes’ memory (ex: the current address of the next instruction). [1](http://man7.org/linux/man-pages/man2/ptrace.2.html)[2](https://medium.com/@jain.sm/code-injection-in-running-process-using-ptrace-d3ea7191a4be)

Ptrace system call injection may not be possible targeting processes that are non-child processes and/or have higher-privileges.[3](https://github.com/gaffe23/linux-inject/blob/master/slides_BHArsenal2015.pdf)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via ptrace system call injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Proc Memory - T1055.009
[more on T1055.009](https://attack.mitre.org/techniques/T1055/009)

Adversaries may inject malicious code into processes via the /proc filesystem in order to evade process-based defenses as well as possibly elevate privileges. Proc memory injection is a method of executing arbitrary code in the address space of a separate live process.

Proc memory injection involves enumerating the memory of a process via the /proc filesystem (`/proc/[pid]`) then crafting a return-oriented programming (ROP) payload with available gadgets/instructions. Each running process has its own directory, which includes memory mappings. Proc memory injection is commonly performed by overwriting the target processes’ stack using memory mappings provided by the /proc filesystem. This information can be used to enumerate offsets (including the stack) and gadgets (or instructions within the program that can be used to build a malicious payload) otherwise hidden by process memory protections such as address space layout randomization (ASLR). Once enumerated, the target processes’ memory map within `/proc/[pid]/maps` can be overwritten using dd.[1](http://hick.org/code/skape/papers/needle.txt)[2](https://blog.gdssecurity.com/labs/2017/9/5/linux-based-inter-process-code-injection-without-ptrace2.html)[3](http://man7.org/linux/man-pages/man1/dd.1.html)

Other techniques such as [[T1574_Hijack Execution Flow#Dynamic Linker Hijacking - T1574 006|Dynamic Linker Hijacking (T1574.006)]] may be used to populate a target process with more available gadgets. Similar to [[T1055_Process Injection#Process Hollowing - T1055 012|Process Hollowing (T1055.012)]], proc memory injection may target child processes (such as a backgrounded copy of sleep).[2](https://blog.gdssecurity.com/labs/2017/9/5/linux-based-inter-process-code-injection-without-ptrace2.html)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via proc memory injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Extra Window Memory Injection - T1055.011
[more on T1055.011](https://attack.mitre.org/techniques/T1055/011)

Adversaries may inject malicious code into process via Extra Window Memory (EWM) in order to evade process-based defenses as well as possibly elevate privileges. EWM injection is a method of executing arbitrary code in the address space of a separate live process.

Before creating a window, graphical Windows-based processes must prescribe to or register a windows class, which stipulate appearance and behavior (via windows procedures, which are functions that handle input/output of data).[1](https://msdn.microsoft.com/library/windows/desktop/ms633574.aspx) Registration of new windows classes can include a request for up to 40 bytes of EWM to be appended to the allocated memory of each instance of that class. This EWM is intended to store data specific to that window and has specific application programming interface (API) functions to set and get its value. [2](https://msdn.microsoft.com/library/windows/desktop/ms633584.aspx) [3](https://msdn.microsoft.com/library/windows/desktop/ms633591.aspx)

Although small, the EWM is large enough to store a 32-bit pointer and is often used to point to a windows procedure. Malware may possibly utilize this memory location in part of an attack chain that includes writing code to shared sections of the process’s memory, placing a pointer to the code in EWM, then invoking execution by returning execution control to the address in the process’s EWM.

Execution granted through EWM injection may allow access to both the target process's memory and possibly elevated privileges. Writing payloads to shared sections also avoids the use of highly monitored API calls such as `WriteProcessMemory` and `CreateRemoteThread`.[4](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process) More sophisticated malware samples may also potentially bypass protection mechanisms such as data execution prevention (DEP) by triggering a combination of windows procedures and other system functions that will rewrite the malicious payload inside an executable portion of the target process. [5](https://www.malwaretech.com/2013/08/powerloader-injection-something-truly.html) [6](https://www.welivesecurity.com/2013/03/19/gapz-and-redyms-droppers-based-on-power-loader-code/)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via EWM injection may also evade detection from security products since the execution is masked under a legitimate process.

#### Process Hollowing - T1055.012
[more on T1055.012](https://attack.mitre.org/techniques/T1055/012)

Adversaries may inject malicious code into suspended and hollowed processes in order to evade process-based defenses. Process hollowing is a method of executing arbitrary code in the address space of a separate live process.

Process hollowing is commonly performed by creating a process in a suspended state then unmapping/hollowing its memory, which can then be replaced with malicious code. A victim process can be created with native Windows API calls such as `CreateProcess`, which includes a flag to suspend the processes primary thread. At this point the process can be unmapped using APIs calls such as `ZwUnmapViewOfSection` or `NtUnmapViewOfSection` before being written to, realigned to the injected code, and resumed via `VirtualAllocEx`, `WriteProcessMemory`, `SetThreadContext`, then `ResumeThread` respectively.[1](http://www.autosectools.com/process-hollowing.pdf)[2](https://www.endgame.com/blog/technical-blog/ten-process-injection-techniques-technical-survey-common-and-trending-process)

This is very similar to [[T1055_Process Injection#Thread Local Storage - T1055 005|Thread Local Storage (T1055.005)]] but creates a new process rather than targeting an existing process. This behavior will likely not result in elevated privileges since the injected process was spawned from (and thus inherits the security context) of the injecting process. However, execution via process hollowing may also evade detection from security products since the execution is masked under a legitimate process.

#### Process Doppelganging - T1055.013
[more on T1055.013](https://attack.mitre.org/techniques/T1055/013)

Adversaries may inject malicious code into process via process doppelgänging in order to evade process-based defenses as well as possibly elevate privileges. Process doppelgänging is a method of executing arbitrary code in the address space of a separate live process.

Windows Transactional NTFS (TxF) was introduced in Vista as a method to perform safe file operations. [1](https://msdn.microsoft.com/library/windows/desktop/bb968806.aspx) To ensure data integrity, TxF enables only one transacted handle to write to a file at a given time. Until the write handle transaction is terminated, all other handles are isolated from the writer and may only read the committed version of the file that existed at the time the handle was opened. [2](https://msdn.microsoft.com/library/windows/desktop/dd979526.aspx) To avoid corruption, TxF performs an automatic rollback if the system or application fails during a write transaction. [3](https://msdn.microsoft.com/library/windows/desktop/aa365738.aspx)

Although deprecated, the TxF application programming interface (API) is still enabled as of Windows 10. [4](https://www.blackhat.com/docs/eu-17/materials/eu-17-Liberman-Lost-In-Transaction-Process-Doppelganging.pdf)

Adversaries may abuse TxF to a perform a file-less variation of [[T1055_Process Injection|Process Injection (T1055)]]. Similar to [[T1055_Process Injection#Process Hollowing - T1055 012|Process Hollowing (T1055.012)]], process doppelgänging involves replacing the memory of a legitimate process, enabling the veiled execution of malicious code that may evade defenses and detection. Process doppelgänging's use of TxF also avoids the use of highly-monitored API functions such as `NtUnmapViewOfSection`, `VirtualProtectEx`, and `SetThreadContext`. [4](https://www.blackhat.com/docs/eu-17/materials/eu-17-Liberman-Lost-In-Transaction-Process-Doppelganging.pdf)

Process Doppelgänging is implemented in 4 steps [4](https://www.blackhat.com/docs/eu-17/materials/eu-17-Liberman-Lost-In-Transaction-Process-Doppelganging.pdf):

-   Transact – Create a TxF transaction using a legitimate executable then overwrite the file with malicious code. These changes will be isolated and only visible within the context of the transaction.
-   Load – Create a shared section of memory and load the malicious executable.
-   Rollback – Undo changes to original executable, effectively removing malicious code from the file system.
-   Animate – Create a process from the tainted section of memory and initiate execution.

This behavior will likely not result in elevated privileges since the injected process was spawned from (and thus inherits the security context) of the injecting process. However, execution via process doppelgänging may evade detection from security products since the execution is masked under a legitimate process.

#### VDSO Hijacking - T1055.014
[more on T1055.014](https://attack.mitre.org/techniques/T1055/014)

Adversaries may inject malicious code into processes via VDSO hijacking in order to evade process-based defenses as well as possibly elevate privileges. Virtual dynamic shared object (vdso) hijacking is a method of executing arbitrary code in the address space of a separate live process.

VDSO hijacking involves redirecting calls to dynamically linked shared libraries. Memory protections may prevent writing executable code to a process via [[T1055_Process Injection#Ptrace System Calls - T1055 008|Ptrace System Calls (T1055.008)]]. However, an adversary may hijack the syscall interface code stubs mapped into a process from the vdso shared object to execute syscalls to open and map a malicious shared object. This code can then be invoked by redirecting the execution flow of the process via patched memory address references stored in a process' global offset table (which store absolute addresses of mapped library functions).[1](https://web.archive.org/web/20150711051625/http://vxer.org/lib/vrn00.html) [2](https://backtrace.io/blog/backtrace/elf-shared-library-injection-forensics/) [3](https://web.archive.org/web/20051013084246/http://www.trilithium.com/johan/2005/08/linux-gate/) [4](https://lwn.net/Articles/604515/)

Running code in the context of another process may allow access to the process's memory, system/network resources, and possibly elevated privileges. Execution via VDSO hijacking may also evade detection from security products since the execution is masked under a legitimate process.

