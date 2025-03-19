@import java.util.List
@import net.dv8tion.jda.api.entities.Message
@import net.dv8tion.jda.api.entities.emoji.Emoji
@import net.dv8tion.jda.api.entities.channel.concrete.TextChannel
@import net.dv8tion.jda.api.interactions.components.buttons.Button
@import net.dv8tion.jda.api.interactions.components.selections.SelectMenu
@import io.github.skywolfxp.transcript.TranscriptConstants
@import io.github.skywolfxp.transcript.TranscriptUtils

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

  <link
    rel="stylesheet"
    type="text/css"
    href="./style.css"
  />

  <!-- Your Stylesheet -->
  @template.css.reset()
  @template.css.style()
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
