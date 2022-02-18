Tactics: [[DEFENSE_EVASION]]
Tags: #mitre/attack/techniques/T1612  

# Build Image on Host - T1612
---
## Description
[more on T1612](https://attack.mitre.org/techniques/T1612)

Adversaries may build a container image directly on a host to bypass defenses that monitor for the retrieval of malicious images from a public registry. A remote `build` request may be sent to the Docker API that includes a Dockerfile that pulls a vanilla base image, such as alpine, from a public or local registry and then builds a custom image upon it.[1](https://docs.docker.com/engine/api/v1.41/#operation/ImageBuild)

An adversary may take advantage of that `build` API to build a custom image on the host that includes malware downloaded from their C2 server, and then they then may utilize [[T1610_Deploy Container|Deploy Container (T1610)]] using that custom image.[2](https://blog.aquasec.com/malicious-container-image-docker-container-host)[3](https://info.aquasec.com/hubfs/Threat%20reports/AquaSecurity_Cloud_Native_Threat_Report_2021.pdf?utm_campaign=WP%20-%20Jun2021%20Nautilus%202021%20Threat%20Research%20Report&utm_medium=email&_hsmi=132931006&_hsenc=p2ANqtz-_8oopT5Uhqab8B7kE0l3iFo1koirxtyfTehxF7N-EdGYrwk30gfiwp5SiNlW3G0TNKZxUcDkYOtwQ9S6nNVNyEO-Dgrw&utm_content=132931006&utm_source=hs_automation) If the base image is pulled from a public registry, defenses will likely not detect the image as malicious since it’s a vanilla image. If the base image already resides in a local registry, the pull may be considered even less suspicious since the image is already in the environment.

---
## Sub-Techniques

#### none
