<h1 style="text-align: center;">Discord Channel HTML Transcript</h1>

<p style="text-align: center;"><strong>Java library for generating easily shareable, offline HTML files of channels, retaining the familiar Discord visuals!</strong></p>

<p style="text-align: center;">
    <a href="https://central.sonatype.com/artifact/io.github.skywolfxp/discord-channel-html-transcript"><img alt="Maven Central Version" src="https://img.shields.io/maven-central/v/io.github.skywolfxp/discord-channel-html-transcript?style=flat-square&label=MAVEN&labelColor=101010&color=008E00"></a>
    <a href="https://github.com/SkyWolfXP/discord-channel-html-transcript/blob/main/LICENSE"><img alt="GitHub License" src="https://img.shields.io/github/license/skywolfxp/discord-channel-html-transcript?style=flat-square&label=LICENSE&labelColor=101010&color=008E00&link=https%3A%2F%2Fgithub.com%2FSkyWolfXP%2Fdiscord-channel-html-transcript%2Fblob%2Fmain%2FLICENSE"></a>
</p>

## About

This is currently the **only** up-to date Transcript generator, displaying the newest Discord interface.\
Uses [**Java Discord API**](https://github.com/discord-jda/JDA)
& [**Java Template Engine**](https://github.com/casid/jte/).

<details>
  <summary><strong>Contents</strong></summary>
  <ol>
    <li><a href="#features">Features</a></li>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#testing--development">Testing & Development</a></li>
    <li><a href="#socials">Socials</a></li>
  </ol>
</details>

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

## Prerequisites

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

1. Run `TranscriptGeneratorTest`, This will create a `discord-channel-html-transcript` directory under:
    - **Windows:** `%USERPROFILE%\AppData\Local\Temp`
    - **macOS:** `/tmp`
    - **Linux:** `/tmp`
2. Copy the CSS styles of [style.jte](https://github.com/SkyWolfXP/discord-channel-html-transcript/blob/main/src/main/resources/template/css/style.jte)
   to `%temp%/discord-channel-html-transcript/style.css` and experiment with your own CSS!

## Work In-Progress

- [ ] System Messages
- [ ] Thread Started Message

## Socials

[![Fiverr](https://img.shields.io/badge/%40SkyWolfXP-FFFFFF?style=flat-square&logo=fiverr&logoColor=FFFFFF&logoSize=auto&color=%231DBF73)](https://www.fiverr.com/skywolfxp) [![Discord](https://img.shields.io/badge/%40SkyWolfXP-FFFFFF?style=flat-square&logo=discord&logoColor=FFFFFF&color=%235865F2)](https://discord.com/users/545902760453996546) [![Reddit](https://img.shields.io/badge/u%2FSkyWolfXP-FFFFFF?style=flat-square&logo=reddit&logoColor=FFFFFF&color=%23FF4500)](https://reddit.com/user/skywolfxp) [![Stackoverflow](https://img.shields.io/badge/SkyWolfXP-FFFFFF?style=flat-square&logo=stackoverflow&logoColor=FFFFFF&color=%23F58025)](https://stackoverflow.com/users/16410630)