<style>
  :root {
    --background-primary: #313338;
    --background-secondary: #2b2d31;
    --background-tertiary: #1e1f22;
    --background-brand: #5865f2;
    --text-normal: hsl(240 3.226% 93.922%);
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
    --interactive-normal: #b5bac1;
    --text-link: #00aafc;
    --channel-icon: hsl(233.333 3.734% 52.745%);
    --border-subtle: hsl(240 4% 60.784% /0.12156862745098039);
    --header-bar-background: hsl(240 7.143% 10.98%);
    --background-base-lower: hsl(240 7.143% 10.98%);
    --background-base-lowest: hsl(240 5.263% 7.451%);
    font-family: "DM Sans", "sans-serif";
  }

  body {
    display: flex;
    flex-direction: column;
    background-color: var(--background-base-lower);
  }

  /* Divider */
  .divider {
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
    height: 0;
    margin: 1.5rem 0.875rem 0.5rem 1rem;
    border-top: thin solid var(--border-subtle);
  }

  .divider__content {
    display: block;
    padding: 0.125rem 0.25rem;
    background-color: var(--background-base-lower);
    font-size: 0.75rem;
    font-weight: 600;
    line-height: 0.8125rem;
    color: var(--text-muted);
  }

  /* Header */
  .header {
    display: flex;
    flex-direction: column;
    position: sticky;
    top: 0;
    width: 100%;
    color: var(--text-normal);
  }

  /* Bar */
  .bar {
    display: flex;
    justify-content: center;
    height: 34px;
    background-color: var(--background-base-lowest);
  }

  .bar__guild {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    bottom: 0;
    max-width: 50vw;
  }

  .bar__guild__icon {
    width: 20px;
    height: 20px;
  }

  .bar__guild__name {
    overflow: hidden;
    font-size: 14px;
    font-weight: 500;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  /* Channel Header */
  .channel__header {
    display: flex;
    align-items: center;
    height: 46px;
    padding: 0.5rem;
    background-color: var(--header-bar-background);
    border-bottom: 1px solid var(--border-subtle);
    font-size: 16px;
    line-height: 20px;
  }

  .channel__header__icon {
    fill: var(--channel-icon);
    width: 20px;
    height: 20px;
    margin: 0 0.5rem;
  }

  .channel__header__title {
    flex-grow: 1;
    overflow: hidden;
    font-weight: 500;
    color: var(--text-normal);
  }

  /* .channel__header__help-icon {
    fill: var(--channel-header-icon);
    width: 24px;
    height: 24px;
    margin: 0 0.5rem;
  }
  
  .channel__header__help-icon:hover {
    fill: var(--interactive-normal);
    cursor: pointer;
  } */

  .channel__content {
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
  .reference {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    grid-column: 2;
    height: 18px;
    margin-bottom: 0.25rem;
    font-size: 0.875rem;
    line-height: 1.125rem;
    color: var(--header-primary);
  }

  .reference__spine {
    grid-column: 1;
    margin: 0.5rem 0.25rem 0.25rem 1.125rem;
    border-top: 2px solid #4f545c;
    border-left: 2px solid #4f545c;
    border-radius: 8px 0 0 0;
  }

  .reference__author__avatar {
    width: 16px;
    height: 16px;
    border-radius: 100%;
  }

  .reference__author__name {
    opacity: 0.64;
    overflow: hidden;
    font-size: 0.875rem;
    font-weight: 500;
    color: var(--header-primary);
  }

  .reference__author__name:hover {
    text-decoration: underline;
  }

  .reference__message__context {
    display: flex;
    align-items: center;
    gap: 0.25rem;
    opacity: 0.64;
    overflow: hidden;
    max-height: 18px;
    line-height: inherit;
    color: var(--header-primary);
  }

  .reference__message__context:hover {
    opacity: 1;
    cursor: pointer;
  }

  .reference__interaction__content {
    opacity: 0.64;
    color: var(--header-primary);
  }

  .reference__interaction__mention {
    gap: 0.25rem;
    padding: 0 2px;
    background-color: rgba(88, 101, 242, 0.3);
    border-radius: 3px;
    font-weight: 500;
    color: var(--text-link);
  }

  .reference__interaction__mention:hover {
    opacity: 1;
    background-color: var(--background-brand);
    color: white;
  }

  .timestamp {
    box-shadow: 0 2px 20px #00000050;
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
    width: max-content;
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
    color: var(--text-link);
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

  /* Reactions */
  .reactions {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    padding-top: 0.125rem;
  }

  .reaction {
    display: flex;
    align-items: center;
    gap: 0.375rem;
    min-height: 24px;
    margin-right: 0.25rem;
    padding: 0.125rem 0.375rem;
    transition: none 0.1s ease;
    transition-property: background-color, border-color;
    background: var(--background-secondary);
    cursor: pointer;
    border: 0.0625rem solid transparent;
    border-radius: 0.5rem;
  }

  .reaction:hover {
    background-color: var(--background-primary);
    border-color: rgba(255, 255, 255, 0.2);
  }

  .reaction__emoji {
    width: 20px;
    height: 20px;
    margin: 0.125rem 0;
    line-height: 1.25rem;
  }

  .reaction__count {
    font-weight: 600;
    line-height: 1.25rem;
    color: var(--interactive-normal);
    text-align: center;
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
  .markup__link {
    color: var(--text-link);
  }

  .markup__link:hover {
    text-decoration: underline;
  }

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
</style>