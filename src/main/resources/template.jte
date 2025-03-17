@import java.util.List
@import net.dv8tion.jda.api.entities.Message
@import net.dv8tion.jda.api.entities.emoji.Emoji
@import net.dv8tion.jda.api.entities.channel.concrete.TextChannel
@import net.dv8tion.jda.api.interactions.components.buttons.Button
@import net.dv8tion.jda.api.interactions.components.selections.SelectMenu
@import com.github.skywolfxp.jda.transcriptGenerator.TranscriptConstants
@import com.github.skywolfxp.jda.transcriptGenerator.TranscriptUtils

@param List<Message> messages 
@param TextChannel textChannel
@param String pathToStylesheet

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>#${textChannel.getName()} | ${textChannel.getGuild().getName()}</title>

  <!-- Google 'DM Sans' Font -->
  <link
    rel="preconnect"
    href="https://fonts.googleapis.com"
  />
  <link
    rel="preconnect"
    href="https://fonts.gstatic.com"
    crossorigin
  />
  <link
    href="https://fonts.googleapis.com/css2?family=DM+Sans:opsz,wght@9..40,100..1000&display=swap"
    rel="stylesheet"
  />

  <!-- Discord base64 Favicon -->
  <link
    rel="icon"
    type="image/png"
    href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAARVBMVEVHcExZZvJYZfJYZfJYZfJYZfJYZfJYZfJYZfJXZfL///+aovd+iPX19v6+w/rY2/xfa/Njb/PM0Pvm6P2utfnw8f6or/j9ROK/AAAACXRSTlMA/kkXkqjk77G+t86PAAAAiklEQVQY02WPWQ7EIAxDCQXahH3r/Y9a05FGo+H92YoTRymgrSNyVqsPhzn55TTHqy/+ci3H8A8GecxX70PwviKllWWmJBKjSCJmqxxzgFjEwOwU3CF9zDm6DEzDoCap5lyTNAhESpaZRfKUXBCxTHfsqbXU401YirMUfCEqPtA6uxXbq2/P/b3/ADsOB/2gWaLHAAAAAElFTkSuQmCC"
  />

  <!-- Your Stylesheet -->
  <style>
    /* CSS Reset */
    @layer base {
      *,
      ::after,
      ::before,
      ::backdrop,
      ::file-selector-button {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        border: 0 solid;
      }
      html,
      :host {
        line-height: 1.5;
        -webkit-text-size-adjust: 100%;
        tab-size: 4;
        -webkit-tap-highlight-color: transparent;
      }
      body {
        line-height: inherit;
      }
      hr {
        height: 0;
        color: inherit;
        border-top-width: 1px;
      }
      abbr:where([title]) {
        -webkit-text-decoration: underline dotted;
        text-decoration: underline dotted;
      }
      h1,
      h2,
      h3,
      h4,
      h5,
      h6 {
        font-size: inherit;
        font-weight: inherit;
      }
      a {
        color: inherit;
        text-decoration: inherit;
      }
      b,
      strong {
        font-weight: bolder;
      }
      code,
      kbd,
      samp,
      pre {
        font-size: 1em;
      }
      small {
        font-size: 80%;
      }
      sub,
      sup {
        font-size: 75%;
        line-height: 0;
        position: relative;
        vertical-align: baseline;
      }
      sub {
        bottom: -0.25em;
      }
      sup {
        top: -0.5em;
      }
      table {
        text-indent: 0;
        border-color: inherit;
        border-collapse: collapse;
      }
      :-moz-focusring {
        outline: auto;
      }
      progress {
        vertical-align: baseline;
      }
      summary {
        display: list-item;
      }
      ol,
      ul,
      menu {
        list-style: none;
      }
      img,
      video {
        max-width: 100%;
        height: auto;
      }
      button,
      input,
      select,
      optgroup,
      textarea,
      ::file-selector-button {
        font: inherit;
        font-feature-settings: inherit;
        font-variation-settings: inherit;
        letter-spacing: inherit;
        color: inherit;
        border-radius: 0;
        background-color: transparent;
        opacity: 1;
      }
      :where(select:is([multiple], [size])) optgroup {
        font-weight: bolder;
      }
      :where(select:is([multiple], [size])) optgroup option {
        padding-inline-start: 20px;
      }
      ::file-selector-button {
        margin-inline-end: 4px;
      }
      ::placeholder {
        opacity: 1;
        color: color-mix(in oklab, currentColor 50%, transparent);
      }
      textarea {
        resize: vertical;
      }
      ::-webkit-search-decoration {
        -webkit-appearance: none;
      }
      ::-webkit-date-and-time-value {
        min-height: 1lh;
        text-align: inherit;
      }
      ::-webkit-datetime-edit {
        display: inline-flex;
      }
      ::-webkit-datetime-edit-fields-wrapper {
        padding: 0;
      }
      ::-webkit-datetime-edit,
      ::-webkit-datetime-edit-year-field,
      ::-webkit-datetime-edit-month-field,
      ::-webkit-datetime-edit-day-field,
      ::-webkit-datetime-edit-hour-field,
      ::-webkit-datetime-edit-minute-field,
      ::-webkit-datetime-edit-second-field,
      ::-webkit-datetime-edit-millisecond-field,
      ::-webkit-datetime-edit-meridiem-field {
        padding-block: 0;
      }
      :-moz-ui-invalid {
        box-shadow: none;
      }
      button,
      input:where([type="button"], [type="reset"], [type="submit"]),
      ::file-selector-button {
        appearance: button;
      }
    }
    
    /* Global */
    body {
      display: flex;
      flex-direction: column;
      background-color: var(--background-primary);
    }
    
    /* Divider */
    .divider {
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 1;
      height: 0;
      margin: 1.5rem 0.875rem 0.5rem 1rem;
      border-top: thin solid #4e50587a;
    }
    
    .divider__content {
      display: block;
      padding: 0.125rem 0.25rem;
      background-color: var(--background-primary);
      font-size: 0.75rem;
      font-weight: 600;
      line-height: 0.8125rem;
      color: var(--text-muted);
    }
    
    /* Channel Header */
    .channel__header {
      display: flex;
      align-items: center;
      position: fixed;
      z-index: 100;
      width: 100%;
      min-height: 3rem;
      padding: 0.5rem;
      background-color: var(--background-primary);
      border-bottom-width: 1px;
      border-bottom-color: #262626;
      font-size: 16px;
      line-height: 20px;
    }
    
    .channel__header__channel-icon {
      fill: var(--channel-header-icon);
      width: 24px;
      height: 24px;
      margin: 0 0.5rem;
    }
    
    .channel__header__title {
      flex-grow: 1;
      overflow: hidden;
      font-size: 1rem;
      font-weight: 600;
      line-height: 1.25;
      color: var(--text-normal);
    }
    
    .channel__header__help-icon {
      fill: var(--channel-header-icon);
      justify-items: self-start;
      width: 24px;
      height: 24px;
      margin: 0 0.5rem;
    }
    
    .channel__header__help-icon:hover {
      fill: #b5bac1;
      cursor: pointer;
    }
    
    .channel__content {
      margin-top: 3rem;
      padding: 0 1rem 1.5rem 1rem;
    }
    
    /* Author */
    .author {
      display: flex;
      align-items: center;
      gap: 0.25rem;
    }
    
    .author__avatar {
      width: 2.5rem;
      height: 2.5rem;
      border-radius: 100%;
    }
    
    .author__avatar__container {
      grid-column: 1;
      width: 3.5rem;
    }
    
    .author__name {
      overflow: hidden;
      font-size: 1rem;
      font-weight: 500;
      line-height: 1.375rem;
      color: var(--header-primary);
    }
    
    .author__name:hover {
      text-decoration: underline;
    }
    
    .author__tag {
      padding: 0 0.275rem;
      background-color: var(--background-brand);
      border-radius: 0.25rem;
      font-size: 0.8rem;
      font-weight: 600;
      line-height: 0.9375rem;
      color: white;
    }
    
    .author__timestamp {
      display: flex;
      justify-content: center;
      margin-left: 0.25rem;
      cursor: default;
      font-size: 0.75rem;
      font-weight: 500;
      line-height: 0.75rem;
      color: var(--text-muted);
    }
    
    .author__timestamp:hover > .timestamp {
      display: block;
    }
    
    /* Message */
    .message {
      display: grid;
      grid-template-columns: auto 1fr;
    }
    
    .message--different-author {
      align-items: normal;
    }
    
    .message:has(.message--different-author) {
      padding-top: 1rem;
    }
    
    /* Message Content */
    .message__content {
      -webkit-user-select: text;
      -moz-user-select: text;
      user-select: text;
      gap: 0.25rem;
      overflow: hidden;
      padding: 0.125rem 0 0.125rem 0;
      font-weight: 400;
      color: var(--text-normal);
    }
    
    .message__content:has(.message__edited) {
      flex-direction: row;
    }
    
    /* Message Timestamp */
    .message__timestamp {
      z-index: 1;
      opacity: 0;
      width: 2.5rem;
      height: 1.375rem;
      font-size: 0.6875rem;
      line-height: 1.375rem;
      color: var(--text-muted);
    }
    
    .message:hover .message__timestamp {
      opacity: 1;
    }
    
    /* Message Edited */
    .message__edited {
      display: inline-flex;
      justify-content: center;
      font-size: 0.625rem;
      font-weight: 400;
      line-height: 1;
      color: var(--text-muted);
    }
    
    .message__edited:hover > .timestamp {
      display: block;
    }
    
    /* Message Reference */
    .message__reference {
      display: flex;
      align-items: center;
      gap: 0.25rem;
      grid-column: 2;
      position: relative;
      margin-bottom: 0.25rem;
      font-size: 0.875rem;
      line-height: 1.125rem;
      color: white;
    }
    
    .message__reference__spine {
      grid-column: 1;
      margin: 0.5rem 0.25rem 0.25rem 1.125rem;
      border-top: 2px solid #4f545c;
      border-left: 2px solid #4f545c;
      border-radius: 8px 0 0 0;
    }
    
    .message__reference__author__avatar {
      width: 16px;
      height: 16px;
    }
    
    .message__reference__author__name {
      opacity: 0.64;
      font-size: inherit;
      line-height: inherit;
    }
    
    .message__reference__preview {
      display: flex;
      opacity: 0.64;
      overflow: hidden;
      max-height: 32px;
      font-size: inherit;
      line-height: inherit;
      color: var(--header-primary);
    }
    
    .message__reference__preview:hover {
      opacity: 1;
      cursor: pointer;
    }
    
    .timestamp {
      box-shadow: 0px 2px 20px #00000050;
      display: none;
      align-self: self-end;
      position: absolute;
      z-index: 100;
      margin-bottom: 1.25rem;
      padding: 0.5rem 0.75rem;
      background-color: #111214;
      border-radius: 0.25rem;
      font-size: 0.875rem;
      font-weight: 500;
      line-height: 0.75rem;
      color: var(--text-normal);
    }
    
    /* Attachment */
    .attachment__image {
      display: flex;
      flex-flow: row nowrap;
      overflow: hidden;
      width: 100%;
      max-width: 550px;
      height: 100%;
      padding: 0.125rem 0 0.125rem 0;
      border-radius: 8px;
    }
    
    .attachment__file {
      display: flex;
      gap: 0.5rem;
      width: 432px;
      max-width: 100%;
      margin-top: 0.5rem;
      padding: 1rem;
      background-color: var(--background-secondary);
      border: 1px solid #232428;
      border-radius: 8px;
    }
    
    .attachment__file__wrapper {
      display: flex;
      flex-direction: column;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    
    .attachment__file__name {
      overflow: hidden;
      color: #00aafc;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
    
    .attachment__file__name:hover {
      text-decoration: underline;
    }
    
    .attachment__file__size {
      font-size: 0.75rem;
      font-weight: 400;
      line-height: 1.3333333333333333;
      color: var(--text-muted);
    }
    
    /* Embed */
    .embed {
      display: grid;
      grid-template-rows: auto;
      grid-template-columns: auto min-content;
      overflow: hidden;
      max-width: max-content;
      padding: 0.5rem 1rem 1rem 0.75rem;
      background: var(--background-secondary);
      border-left: 0.25rem solid var(--background-tertiary);
      border-radius: 0.25rem;
    }
    
    .embed--margin {
      margin-top: 0.5rem;
    }
    
    /* Embed Author */
    .embed__author {
      display: flex;
      align-items: center;
      grid-column: 1/1;
    }
    
    .embed__author__icon {
      width: 1.5rem;
      height: 1.5rem;
      margin-right: 0.5rem;
      border-radius: 100%;
    }
    
    .embed__author__name {
      font-size: 0.875rem;
      font-weight: 600;
      color: var(--header-primary);
    }
    
    /* Embed Title */
    .embed__title {
      display: inline-flex;
      grid-column: 1/1;
      font-size: 1rem;
      font-weight: 600;
      color: var(--header-primary);
    }
    
    /* Embed Description */
    .embed__description {
      grid-column: 1/1;
      font-size: 0.875rem;
      font-weight: 400;
      line-height: 1.125rem;
      color: var(--text-normal);
    }
    
    /* Embed Fields */
    .embed__fields {
      display: grid;
      grid-gap: 0.5rem;
      grid-column: 1/1;
      margin-top: 0.5rem;
    }
    
    .embed__field {
      grid-column: 1 / 13;
      min-width: 0;
      font-size: 0.875rem;
      line-height: 1.125rem;
    }
    
    .embed__field__name {
      margin-bottom: 0.125rem;
      font-weight: 600;
      color: var(--header-primary);
    }
    
    .embed__field__value {
      min-width: 0;
      font-size: 0.875rem;
      font-weight: 400;
      line-height: 1.125rem;
      color: var(--text-normal);
    }
    
    /* Embed Image */
    .embed__image {
      -o-object-fit: fill;
      object-fit: fill;
      grid-column: 1/3;
      margin-top: 1rem;
    }
    
    .embed__image__wrapper {
      aspect-ratio: 128 / 128;
      display: flex;
      width: 100%;
      max-width: 128px;
      height: 100%;
    }
    
    /* Embed Thumbnail */
    .embed__thumbnail {
      -o-object-fit: fill;
      object-fit: fill;
      grid-row: 1/8;
      grid-column: 2/2;
      width: 80px;
      height: 80px;
      margin: 0.5rem 0 0 1rem;
    }
    
    .embed__thumbnail__wrapper {
      aspect-ratio: 128 / 128;
      overflow: hidden;
      width: 100%;
      height: 100%;
    }
    
    /* Embed Footer */
    .embed__footer {
      display: flex;
      align-items: center;
      grid-row: auto/auto;
      grid-column: 1/3;
    }
    
    .embed__footer__icon {
      width: 1.25rem;
      height: 1.25rem;
      margin-right: 0.5rem;
      border-radius: 100%;
    }
    
    .embed__footer__text {
      font-size: 0.75rem;
      font-weight: 500;
      line-height: 1rem;
      color: var(--text-normal);
    }
    
    .embed__footer__text__separator {
      font-weight: 500;
      color: var(--text-normal);
    }
    
    /* ActionRow */
    .action-rows {
      display: flex;
      flex-direction: column;
      row-gap: 6px;
      overflow: hidden;
      width: 100%;
      margin-top: 0.25rem;
      font-weight: 500;
      color: #ffffff;
    }
    
    .action-row {
      display: flex;
      flex-wrap: wrap;
      gap: 0.5rem;
    }
    
    /* ActionRow Button */
    .action-row__button {
      display: flex;
      align-items: center;
      min-width: 60px;
      height: 32px;
      padding: 0.125rem 1rem;
      transition: background-color 170ms ease;
      cursor: pointer;
      border-radius: 3px;
      font-size: 14px;
      line-height: 1.375rem;
    }
    
    .action-row__button[aria-disabled="true"] {
      opacity: 0.5;
      cursor: not-allowed;
    }
    
    .action-row__button__emoji {
      width: 22px;
      height: 22px;
      margin-right: 0.25rem;
      font-size: 1rem;
    }
    
    .action-row__button--primary {
      background-color: var(--button-primary-background);
    }
    
    .action-row__button--primary:not([aria-disabled]):hover {
      background-color: var(--button-primary-background-hover);
    }
    
    .action-row__button--secondary {
      background-color: var(--button-secondary-background);
    }
    
    .action-row__button--secondary:not([aria-disabled]):hover {
      background-color: var(--button-secondary-background-hover);
    }
    
    .action-row__button--success {
      background-color: var(--button-success-background);
    }
    
    .action-row__button--success:not([aria-disabled]):hover {
      background-color: var(--button-success-background-hover);
    }
    
    .action-row__button--danger {
      background-color: var(--button-danger-background);
    }
    
    .action-row__button--danger:not([aria-disabled]):hover {
      background-color: var(--button-danger-background-hover);
    }
    
    .action-row__button--link {
      background-color: var(--button-secondary-background);
    }
    
    .action-row__button--link:not([aria-disabled]):hover {
      background-color: var(--button-secondary-background-hover);
    }
    
    .action-row__button__link-icon {
      margin-left: 0.5rem;
    }
    
    /* ActionRow Select */
    .action-row__select {
      display: grid;
      align-items: center;
      gap: 8px;
      grid-template-columns: 1fr auto;
      width: 90%;
      max-width: 400px;
      padding: 0.5rem;
      background-color: #1e1f22;
      cursor: pointer;
      border-radius: 4px;
    }
    
    .action-row__select__text {
      color: #87898c;
    }
    
    /* Discord Utility */
    .image__container {
      display: flex;
      flex-flow: row nowrap;
      flex: auto;
      width: 100%;
      height: 100%;
    }
    
    /* Discord Markup */
    .markup__code-block {
      display: block;
      overflow-x: auto;
      max-width: 90%;
      margin-top: 0.375rem;
      padding: 0.5em;
      background: var(--background-secondary);
      border: 1px solid var(--background-tertiary);
      border-radius: 4px;
      font-size: 0.875rem;
      line-height: 1.125rem;
      color: var(--text-normal);
    }
    
    .embed .markup__code-block {
      background-color: var(--background-tertiary);
    }
    
    .markup__code-inline {
      padding: 0 0.2em;
      background: var(--background-secondary);
      border: 1px solid var(--background-tertiary);
      border-radius: 4px;
      font-size: 0.875rem;
      line-height: 1.125rem;
    }
    
    .embed .markup__code-inline {
      background-color: var(--background-tertiary);
    }
    
    .markup__header {
      display: inline-flex;
      margin: 1rem 0 0.5rem;
      font-weight: 700;
      line-height: 1.375em;
      color: var(--header-primary);
    }
    
    h1.markup__header {
      font-size: 1.5rem;
    }
    
    h2.markup__header {
      font-size: 1.25rem;
    }
    
    h3.markup__header {
      font-size: 1rem;
    }
    
    .markup__subtext {
      display: block;
      font-size: 0.8125rem;
      line-height: 1.11719rem;
      color: var(--text-muted);
    }
    
    .mention {
      display: inline-flex;
      align-items: center;
      gap: 0.25rem;
      padding: 0 2px;
      transition: background-color 50ms ease-out, color 50ms ease-out;
      background: var(--mention-background-color-hover);
      cursor: pointer;
      border-radius: 3px;
      font-weight: 500;
      color: #c9cdfb;
    }
    
    .mention:hover {
      background: var(--mention-background-color);
      color: white;
    }
    
    .mention:not([href]) {
      cursor: default;
    }
    
    .mention__channel-icon {
      width: 16px;
      height: 16px;
    }
    
    .mention__channel-name {
      overflow: hidden;
      text-overflow: ellipsis;
    }
    
    /* Utility */
    .user-select-none {
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }
    
    :root {
      --background-primary: #313338;
      --background-secondary: #2b2d31;
      --background-tertiary: #1e1f22;
      --background-brand: #5865f2;
      --text-normal: #dbdee1;
      --text-muted: #949ba4;
      --channel-header-icon: #80848e;
      --header-primary: #f2f3f5;
      --mention-background-color: var(--background-brand);
      --mention-background-color-hover: #5865f270;
      --button-primary-background: var(--background-brand);
      --button-primary-background-hover: #4752c4;
      --button-secondary-background: #4e5058;
      --button-secondary-background-hover: #6d6f78;
      --button-success-background: #248045;
      --button-success-background-hover: #1a6334;
      --button-danger-background: #da373c;
      --button-danger-background-hover: #a12829;
      font-family: "DM Sans", "sans-serif";
    }
  </style>
</head>

<body>
<!-- Channel Header -->
<section class="channel__header">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    class="channel__header__channel-icon"
  >
    <path
      fill-rule="evenodd"
      d="M10.99 3.16A1 1 0 1 0 9 2.84L8.15 8H4a1 1 0 0 0 0 2h3.82l-.67 4H3a1 1 0 1 0 0 2h3.82l-.8 4.84a1 1 0 0 0 1.97.32L8.85 16h4.97l-.8 4.84a1 1 0 0 0 1.97.32l.86-5.16H20a1 1 0 1 0 0-2h-3.82l.67-4H21a1 1 0 1 0 0-2h-3.82l.8-4.84a1 1 0 1 0-1.97-.32L15.15 8h-4.97l.8-4.84ZM14.15 14l.67-4H9.85l-.67 4h4.97Z"
    />
  </svg>

  <h1 class="channel__header__title user-select-none">${textChannel.getName()}</h1>

  <svg
    xmlns="http://www.w3.org/2000/svg"
    class="channel__header__help-icon"
  >
    <circle
      cx="12"
      cy="12"
      r="10"
      fill="transparent"
    />
    <path
      fill-rule="evenodd"
      d="M12 23a11 11 0 1 0 0-22 11 11 0 0 0 0 22Zm-.28-16c-.98 0-1.81.47-2.27 1.14A1 1 0 1 1 7.8 7.01 4.73 4.73 0 0 1 11.72 5c2.5 0 4.65 1.88 4.65 4.38 0 2.1-1.54 3.77-3.52 4.24l.14 1a1 1 0 0 1-1.98.27l-.28-2a1 1 0 0 1 .99-1.14c1.54 0 2.65-1.14 2.65-2.38 0-1.23-1.1-2.37-2.65-2.37ZM13 17.88a1.13 1.13 0 1 1-2.25 0 1.13 1.13 0 0 1 2.25 0Z"
    />
  </svg>
</section>

<!-- Channel Content -->
<ol class="channel__content">
  !{var previousMessage = messages.getFirst();}

  @for(var message : messages)
    !{boolean isDifferentAuthor = (previousMessage == messages.getFirst()) || (!previousMessage.getAuthor().equals(message.getAuthor()));}
    !{boolean isDividerShown = false;}

    <!-- Divider -->
    @if((previousMessage == messages.getFirst()) || (previousMessage.getTimeCreated().getDayOfYear() != message.getTimeCreated().getDayOfYear()))
      !{isDividerShown = true;}

      <div class="divider">
        <span class="divider__content user-select-none">
          ${message.getTimeCreated().format(TranscriptConstants.DATE_LONG)}
        </span>
      </div>
    @endif

    <!-- Message -->
    <li class="message">
      <!-- Message Reference -->
      @if(message.getReferencedMessage() != null)
        <div class="message__reference__spine"></div>

        <div class="message__reference user-select-none">
          <img
            src="${message.getReferencedMessage().getAuthor().getEffectiveAvatarUrl()}"
            class="message__reference__author__avatar author__avatar"
          />

          @if(message.getReferencedMessage().getAuthor().isBot())
            <span class="author__tag">APP</span>
          @endif

          <a
            href="https://discord.com/users/${message.getReferencedMessage().getAuthor().getId()}"
            class="message__reference__author__name author__name"
          >
            ${message.getReferencedMessage().getAuthor().getEffectiveName()}
          </a>

          <a
            href="#${message.getReferencedMessage().getId()}"
            class="message__reference__preview user-select-none"
          >
            ${message.getReferencedMessage().getContentRaw()}
          </a>
        </div>
      @endif

      <div class="author__avatar__container user-select-none ${(isDifferentAuthor || isDividerShown) ? "message--different-author" : null}">
        @if(isDifferentAuthor || isDividerShown)
          <img
            src="${message.getAuthor().getEffectiveAvatarUrl()}"
            class="author__avatar"
          />
        @else
          <span class="message__timestamp">${message.getTimeCreated().format(TranscriptConstants.TIME_SHORT)}</span>
        @endif
      </div>

      <div>
        @if(isDifferentAuthor || isDividerShown)
          <h3 class="author">
            <a
              href="https://discord.com/users/${message.getAuthor().getId()}"
              class="author__name"
            >
              ${message.getAuthor().getEffectiveName()}
            </a>

            @if(message.getAuthor().isBot())
              <span class="author__tag user-select-none">APP</span>
            @endif

            <time class="author__timestamp">
              <time class="timestamp user-select-none">
                ${message.getTimeCreated().format(TranscriptConstants.DATE_FULL)}
              </time>

              ${message.getTimeCreated().format(TranscriptConstants.DATE_SHORT)}
            </time>
          </h3>
        @endif

        <!-- Message Content -->
        <div
          id="${message.getId()}"
          class="message__content markup"
        >
          $unsafe{TranscriptUtils.parseMarkup(textChannel.getGuild(), message.getContentRaw())}

          <!-- Attachment -->
          @for(var attachment : message.getAttachments())
            @if(attachment.isImage())
              <a
                href="${attachment.getUrl()}"
                class="attachment__image"
              > <img
                  src="${attachment.getUrl()}"
                  loading="lazy"
                /> </a>
            @else
              <div class="attachment__file">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 72 96"
                  width="30"
                  height="40"
                >
                  <path
                    d="m72 29.3v60.3c0 2.24 0 3.36-.44 4.22-.38.74-1 1.36-1.74 1.74-.86.44-1.98.44-4.22.44h-59.2c-2.24 0-3.36 0-4.22-.44-.74-.38-1.36-1-1.74-1.74-.44-.86-.44-1.98-.44-4.22v-83.2c0-2.24 0-3.36.44-4.22.38-.74 1-1.36 1.74-1.74.86-.44 1.98-.44 4.22-.44h36.3c1.96 0 2.94 0 3.86.22.5.12.98.28 1.44.5v16.88c0 2.24 0 3.36.44 4.22.38.74 1 1.36 1.74 1.74.86.44 1.98.44 4.22.44h16.88c.22.46.38.94.5 1.44.22.92.22 1.9.22 3.86z"
                    fill="#d3d6fd"
                  />
                  <path
                    d="m68.26 20.26c1.38 1.38 2.06 2.06 2.56 2.88.18.28.32.56.46.86h-16.88c-2.24 0-3.36 0-4.22-.44-.74-.38-1.36-1-1.74-1.74-.44-.86-.44-1.98-.44-4.22v-16.880029c.3.14.58.28.86.459999.82.5 1.5 1.18 2.88 2.56z"
                    fill="#939bf9"
                  />
                </svg>

                <div class="attachment__file__wrapper">
                  <a
                    href="${attachment.getUrl()}"
                    class="attachment__file__name"
                  >
                    ${attachment.getFileName()}
                  </a>

                  <span class="attachment__file__size">${TranscriptUtils.formatBytes(attachment.getSize())}</span>
                </div>
              </div>
            @endif
          @endfor

          @if(message.getTimeEdited() != null)
            <span class="message__edited user-select-none">
              <time class="timestamp user-select-none">
                ${message.getTimeEdited().format(TranscriptConstants.DATE_FULL)}
              </time>
              (edited)
            </span>
          @endif
        </div>

        <!-- Embed -->
        @for(var embed : message.getEmbeds())
          <article
            style="border-left: 0.25rem solid ${"#%06X".formatted(0xFFFFFF & embed.getColorRaw())};"
            class="embed"
          >
            <!-- Embed Author -->
            @if(embed.getAuthor() != null)
              <div class="embed__author embed--margin">
                @if(embed.getAuthor().getIconUrl() != null)
                  <img
                    src="${embed.getAuthor().getIconUrl()}"
                    class="embed__author__icon"
                  />
                @endif

                @if(embed.getAuthor().getName() != null)
                  <span class="embed__author__name">
                    ${embed.getAuthor().getName()}
                  </span>
                @endif
              </div>
            @endif

            <!-- Embed Title -->
            @if(embed.getTitle() != null)
              <div class="embed__title embed--margin">
                <span>${embed.getTitle()}</span>
              </div>
            @endif

            <!-- Embed Description -->
            @if(embed.getDescription() != null)
              <div class="embed__description embed--margin">
                <span>$unsafe{TranscriptUtils.parseMarkup(textChannel.getGuild(), embed.getDescription())}</span>
              </div>
            @endif

            <!-- Embed Fields -->
            @if(!embed.getFields().isEmpty())
              <div class="embed__fields">
                <!-- Embed Field -->
                @for(var field : embed.getFields())
                  <div class="embed__field">
                    @if(field.getName() != null)
                      <div class="embed__field__name">
                        <span>${field.getName()}</span>
                      </div>
                    @endif

                    @if(field.getValue() != null)
                      <div class="embed__field__value">
                        <span>${field.getValue()}</span>
                      </div>
                    @endif
                  </div>
                @endfor
              </div>
            @endif

            <!-- Embed Image -->
            @if(embed.getImage() != null)
              <div class="embed__image">
                <img
                  src="${embed.getImage().getUrl()}"
                  class="embed__image__wrapper"
                />
              </div>
            @endif

            <!-- Embed Thumbnail -->
            @if(embed.getThumbnail() != null)
              <div class="embed__thumbnail">
                <img
                  src="${embed.getThumbnail().getUrl()}"
                  class="embed__thumbnail__wrapper"
                />
              </div>
            @endif

            <!-- Embed Footer -->
            @if(embed.getFooter() != null)
              <div class="embed__footer embed--margin">
                @if(embed.getFooter().getIconUrl() != null)
                  <img
                    src="${embed.getFooter().getIconUrl()}"
                    class="embed__footer__icon"
                  />
                @endif

                @if(embed.getFooter().getText() != null)
                  <span class="embed__footer__text">
                    <span>${embed.getFooter().getText()}</span>

                    @if(embed.getTimestamp() != null)
                      <span class="embed__footer__text__separator">•</span>

                      <span>${embed.getTimestamp().format(TranscriptConstants.DATE_SHORT)}</span>
                    @endif
                  </span>
                @endif
              </div>
            @endif
          </article>
        @endfor

        <!-- ActionRow -->
        @if(!message.getActionRows().isEmpty())
          <div class="action-rows user-select-none">
            @for(var actionRow : message.getActionRows())
              <div class="action-row">
                @for(var component : actionRow.getComponents())
                  <!-- ActionRow Button -->
                  @if(component instanceof Button button)
                    <a
                      href="${button.isDisabled() ? null : button.getUrl()}"
                      role="button"
                      aria-disabled="${button.isDisabled()}"
                      class="action-row__button action-row__button--${button.getStyle().name().toLowerCase()}"
                    >
                      @if(button.getEmoji() != null)
                        @if(button.getEmoji().getType().equals(Emoji.Type.CUSTOM))
                          <img
                            src="${button.getEmoji().asCustom().getImageUrl()}"
                            class="action-row__button__emoji"
                          />
                        @else
                          <span class="action-row__button__emoji">
                            &#x${button.getEmoji().asUnicode().getAsCodepoints().replace("U+", "")};
                          </span>
                        @endif
                      @endif

                      <span>${button.getLabel()}</span>

                      @if(button.getUrl() != null)
                        <svg
                          xmlns="http://www.w3.org/2000/svg"
                          viewBox="0 0 24 24"
                          width="16"
                          height="16"
                          fill="currentColor"
                          class="action-row__button__link-icon"
                        >
                          <path d="M15 2a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0V4.41l-4.3 4.3a1 1 0 1 1-1.4-1.42L19.58 3H16a1 1 0 0 1-1-1Z" />
                          <path d="M5 2a3 3 0 0 0-3 3v14a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3v-6a1 1 0 1 0-2 0v6a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V5a1 1 0 0 1 1-1h6a1 1 0 1 0 0-2H5Z" />
                        </svg>
                      @endif
                    </a>
                  @endif

                  <!-- ActionRow Select -->
                  @if(component instanceof SelectMenu select)
                    <div class="action-row__select">
                      <span class="action-row__select__text">Make a selection</span>

                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24"
                        width="18"
                        height="18"
                        fill="currentColor"
                      >
                        <path d="M5.3 9.3a1 1 0 0 1 1.4 0l5.3 5.29 5.3-5.3a1 1 0 1 1 1.4 1.42l-6 6a1 1 0 0 1-1.4 0l-6-6a1 1 0 0 1 0-1.42Z" />
                      </svg>
                    </div>
                  @endif
                @endfor
              </div>
            @endfor
          </div>
        @endif
      </div>
    </li>
    !{previousMessage = message;}
  @endfor
</ol>
</body>
</html>
