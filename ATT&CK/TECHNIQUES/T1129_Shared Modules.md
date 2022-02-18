Tactics: [[EXECUTION]]
Tags: #mitre/attack/techniques/T1129  

# Shared Modules - T1129
---
## Description
[more on T1129](https://attack.mitre.org/techniques/T1129)

Adversaries may execute malicious payloads via loading shared modules. The Windows module loader can be instructed to load DLLs from arbitrary local paths and arbitrary Universal Naming Convention (UNC) network paths. This functionality resides in NTDLL.dll and is part of the Windows [[T1106_Native API|Native API (T1106)]] which is called from functions like `CreateProcess`, `LoadLibrary`, etc. of the Win32 API. [1](https://en.wikipedia.org/wiki/Microsoft_Windows_library_files)

The module loader can load DLLs:

-   via specification of the (fully-qualified or relative) DLL pathname in the IMPORT directory;
    
-   via EXPORT forwarded to another DLL, specified with (fully-qualified or relative) pathname (but without extension);
    
-   via an NTFS junction or symlink program.exe.local with the fully-qualified or relative pathname of a directory containing the DLLs specified in the IMPORT directory or forwarded EXPORTs;
    
-   via `<file name="filename.extension" loadFrom="fully-qualified or relative pathname">` in an embedded or external "application manifest". The file name refers to an entry in the IMPORT directory or a forwarded EXPORT.
    

Adversaries may use this functionality as a way to execute arbitrary payloads on a victim system. For example, malware may execute share modules to load additional components or features.

---
## Sub-Techniques

#### none