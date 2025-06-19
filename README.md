<h1 align="center">Discord Channel HTML Transcript</h1>

<p align="center"><strong>Java library for generating easily shareable, offline HTML files of channels, retaining the familiar Discord visuals!</strong></p>

<p align="center">
    <a href="https://central.sonatype.com/artifact/io.github.skywolfxp/discord-channel-html-transcript"><img alt="Maven Central Version" src="https://img.shields.io/maven-central/v/io.github.skywolfxp/discord-channel-html-transcript?style=for-the-badge&label=MAVEN&labelColor=000000&color=008E00"></a>
    <a href="https://github.com/skywolfxp/discord-channel-html-transcript/blob/main/LICENSE"><img alt="GitHub License" src="https://img.shields.io/github/license/skywolfxp/discord-channel-html-transcript?style=for-the-badge&label=LICENSE&labelColor=000000&color=008E00"></a>
</p>

## About

This Java library is the **most** up-to-date Transcript generator, displaying your favorite Discord look!\
Uses [**Java Discord API**](https://github.com/discord-jda/JDA)
& [**Java Template Engine**](https://github.com/casid/jte/).


<details>
    <summary>
        <strong>Contents</strong>
    </summary>
    <ol>
        <li><a href="#legal-compliance">Legal Compliance</a></li>
        <li><a href="#features">Features</a></li>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#testing--development">Testing & Development</a></li>
        <li><a href="#socials">Socials</a></li>
    </ol>
</details>

## Legal Compliance

**This project utilizes
the [gg sans](https://my.corebook.io/1zObrQ89Q4wHhgFCfYIUhMUvmNf4XjxO/03-typography/download) font that is the
property of Discord Inc.**\
**I do not claim ownership of this font.**

## Features

- **Markdown**
    - Standard Markdown
    - [Discord's Custom Markdown](https://support.discord.com/hc/en-us/articles/210298617-Markdown-Text-101-Chat-Formatting-Bold-Italic-Underline)
- **Attachments**
    - Images
    - Other Files
- **Embeds**
- **Action Rows**
    - Buttons
    - Select Menus
- **Reactions**
- **Referenced Message**
- **Referenced Command**

## Requirements

- **Java 21+**

## Installation

### Maven

```xml

<dependencies>
  <dependency>
    <groupId>io.github.skywolfxp</groupId>
    <artifactId>discord-channel-html-transcript</artifactId>
    <version>${version}</version>
  </dependency>
</dependencies>
```

### Gradle

```kts
repositories {
  mavenCentral()
}

dependencies {
  implementation("io.github.skywolfxp:discord-channel-html-transcript:${version}")
}
```

## Testing & Development

1.

Run [TranscriptGeneratorTest#createTranscript()](src/test/java/io/github/skywolfxp/transcript/TranscriptGeneratorTest.java),
A
`discord-channel-html-transcript` folder will be created under:

- **Windows:** `%USERPROFILE%\AppData\Local\Temp`
- **macOS:** `/tmp`
- **Linux:** `/tmp`

2. Copy the CSS in [style.jte](src/main/resources/template/css/style.jte)
   to `/discord-channel-html-transcript/style.css` and experiment with your own CSS!

## Socials

<a href="https://fiverr.com/skywolfxp"><img alt="Fiverr" height="24" src="https://img.shields.io/badge/@skywolfxp-1DBF73?style=flat-square&logo=fiverr&logoColor=FFFFFF&logoSize=auto"></a>
<a href="https://upwork.com/freelancers/~013d98c8a8af272cbb"><img alt="Upwork" height="24" src="https://img.shields.io/badge/Omar_D.-6FDA44?style=flat-square&logo=upwork&logoColor=FFFFFF&logoSize=auto"></a>
<a href="https://reddit.com/user/skywolfxp"><img alt="Reddit" height="24" src="https://img.shields.io/badge/u/skywolfxp-FF4500?style=flat-square&logo=reddit&logoColor=FFFFFF&logoSize=auto"></a>
<a href="https://discord.com/users/974748803305455627"><img alt="Discord" height="24" src="https://img.shields.io/badge/skywolfxp.dev-5865F2?style=flat-square&logo=discord&logoColor=FFFFFF&logoSize=auto"></a>
