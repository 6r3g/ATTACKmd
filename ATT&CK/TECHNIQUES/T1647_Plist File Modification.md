Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1647

# Plist File Modification - T1647
---

## Description
[more on T1647](https://attack.mitre.org/techniques/T1647)

Adversaries may modify property list files (plist files) to enable other malicious activity, while also potentially evading and bypassing system defenses. macOS applications use plist files, such as the `info.plist` file, to store properties and configuration settings that inform the operating system how to handle the application at runtime. Plist files are structured metadata in key-value pairs formatted in XML based on Apple's Core Foundation DTD. Plist files can be saved in text or binary format. [1](https://fileinfo.com/extension/plist)

Adversaries can modify key-value pairs in plist files to influence system behaviors, such as hiding the execution of an application (i.e. [[T1564_Hide Artifacts#Hidden Window - T1564.003|Hidden Window]]) or running additional commands for persistence (ex: [[T1543_Create or Modify System Process#Launch Agent - T1543.001|Launch Agent]]/[[T1543_Create or Modify System Process#Launch Daemon - T1543.004|Launch Daemon]] or [[T1547_Boot or Logon Autostart Execution#Re-opened Applications - T1547.007|Re-opened Applications]]).

For example, adversaries can add a malicious application path to the `~/Library/Preferences/com.apple.dock.plist` file, which controls apps that appear in the Dock. Adversaries can also modify the `LSUIElement` key in an application’s `info.plist` file to run the app in the background. Adversaries can also insert key-value pairs to insert environment variables, such as `LSEnvironment`, to enable persistence via [[T1574_Hijack Execution Flow#Dynamic Linker Hijacking - T1574.006|Dynamic Linker Hijacking]]. [2](https://taomm.org/PDFs/vol1/CH%200x02%20Persistence.pdf) [3](https://www.welivesecurity.com/wp-content/uploads/200x/white-papers/osx_flashback.pdf)

