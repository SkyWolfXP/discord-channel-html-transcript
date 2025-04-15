<h1 align="center">Discord Channel HTML Transcript</h1>

<p align="center"><strong>Java library for generating easily shareable, offline HTML files of channels, retaining the familiar Discord visuals!</strong></p>

<p align="center">
    <a href="https://central.sonatype.com/artifact/io.github.skywolfxp/discord-channel-html-transcript"><img alt="Maven Central Version" src="https://img.shields.io/maven-central/v/io.github.skywolfxp/discord-channel-html-transcript?style=flat-square&label=MAVEN&labelColor=black&color=008E00"></a>
    <a href="https://github.com/SkyWolfXP/discord-channel-html-transcript/blob/main/LICENSE"><img alt="GitHub License" src="https://img.shields.io/github/license/skywolfxp/discord-channel-html-transcript?style=flat-square&label=LICENSE&labelColor=black&color=008E00&link=https%3A%2F%2Fgithub.com%2FSkyWolfXP%2Fdiscord-channel-html-transcript%2Fblob%2Fmain%2FLICENSE"></a>
</p>

## About

This Java library is the **only** up-to-date Transcript generator, displaying your favorite Discord look!\
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
Discord's "[gg sans](https://my.corebook.io/1zObrQ89Q4wHhgFCfYIUhMUvmNf4XjxO/03-typography/download)" font that is the
property of [Discord Inc](https://discord.com/). I do not claim any ownership of this font.**

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

1. Run [TranscriptGeneratorTest#createTranscript()](src/test/java/io/github/skywolfxp/transcript/TranscriptGeneratorTest.java), A
   `discord-channel-html-transcript` folder will be created under:
    - **Windows:** `%USERPROFILE%\AppData\Local\Temp`
    - **macOS:** `/tmp`
    - **Linux:** `/tmp`
2. Copy the CSS in [style.jte](src/main/resources/template/css/style.jte)
   to `/discord-channel-html-transcript/style.css` and experiment with your own CSS!

## Socials

<a href="https://www.fiverr.com/skywolfxp"><img alt="Fiverr" src="https://img.shields.io/badge/%40skywolfxp-%231DBF73?style=flat-square&logo=fiverr&logoColor=FFFFFF&logoSize=auto"></a>
<a href="https://www.upwork.com/freelancers/~013d98c8a8af272cbb"><img alt="Upwork" src="https://img.shields.io/badge/Omar_D.-%236FDA44?style=flat-square&logo=upwork&logoColor=FFFFFF"></a>
<a href="https://discord.com/users/974748803305455627"><img alt="Discord" src="https://img.shields.io/badge/%40skywolfxp.me-%235865F2?style=flat-square&logo=discord&logoColor=FFFFFF"></a>
<a href="https://www.reddit.com/user/skywolfxp"><img alt="Reddit" src="https://img.shields.io/badge/u%2Fskywolfxp-%23FF4500?style=flat-square&logo=reddit&logoColor=FFFFFF"></a>
<a href="https://stackoverflow.com/users/16410630"><img alt="Stack Overflow" src="https://img.shields.io/badge/SkyWolfXP-%23F58025?style=flat-square&logo=stackoverflow&logoColor=FFFFFF"></a>