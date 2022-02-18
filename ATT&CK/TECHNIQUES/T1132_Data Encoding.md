Tactics: [[COMMAND_AND_CONTROL]]
Tags: #mitre/attack/techniques/T1132  

# Data Encoding - T1132
---
## Description
[more on T1132](https://attack.mitre.org/techniques/T1132)

Adversaries may encode data to make the content of command and control traffic more difficult to detect. Command and control (C2) information can be encoded using a standard data encoding system. Use of data encoding may adhere to existing protocol specifications and includes use of ASCII, Unicode, Base64, MIME, or other binary-to-text and character encoding systems.[1](https://en.wikipedia.org/wiki/Binary-to-text_encoding) [2](https://en.wikipedia.org/wiki/Character_encoding) Some data encoding systems may also result in data compression, such as gzip.

---
## Sub-Techniques

#### Standard Encoding - T1132.001
[more on T1132.001](https://attack.mitre.org/techniques/T1132/001)

Adversaries may encode data with a standard data encoding system to make the content of command and control traffic more difficult to detect. Command and control (C2) information can be encoded using a standard data encoding system that adheres to existing protocol specifications. Common data encoding schemes include ASCII, Unicode, hexadecimal, Base64, and MIME.[1](https://en.wikipedia.org/wiki/Binary-to-text_encoding) [2](https://en.wikipedia.org/wiki/Character_encoding) Some data encoding systems may also result in data compression, such as gzip.

#### Non-Standard Encoding - T1132.002
[more on T1132.002](https://attack.mitre.org/techniques/T1132/002)

Adversaries may encode data with a non-standard data encoding system to make the content of command and control traffic more difficult to detect. Command and control (C2) information can be encoded using a non-standard data encoding system that diverges from existing protocol specifications. Non-standard data encoding schemes may be based on or related to standard data encoding schemes, such as a modified Base64 encoding for the message body of an HTTP request.[1](https://en.wikipedia.org/wiki/Binary-to-text_encoding) [2](https://en.wikipedia.org/wiki/Character_encoding)



