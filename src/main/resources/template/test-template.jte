@import java.util.List
@import net.dv8tion.jda.api.entities.Message
@import net.dv8tion.jda.api.entities.channel.concrete.TextChannel
@import io.github.skywolfxp.transcript.TranscriptConstants
@import io.github.skywolfxp.transcript.TranscriptUtils

@param List<Message> messages
@param TextChannel textChannel

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
  <link
    rel="stylesheet"
    type="text/css"
    href="./style.css"
  />

  @template.css.reset()
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
    !{boolean isDifferentAuthor = !previousMessage.getAuthor().equals(message.getAuthor());}
    !{boolean isDividerShown = messages.getFirst().equals(message) || (previousMessage.getTimeCreated().getDayOfYear() != message.getTimeCreated().getDayOfYear());}

    <!-- Divider -->
    @template.html.channel.divider(message = message, isDividerShown = isDividerShown)

    <!-- Message -->
    <li class="message">
      <!-- Reference -->
      @template.html.message.reference(message = message)

      <div class="author__avatar__container user-select-none ${(isDifferentAuthor || isDividerShown) ? "message--different-author" : null}">
        @if(isDifferentAuthor || isDividerShown)
          <img
            loading="lazy"
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
          $unsafe{TranscriptUtils.parseMarkup(message.getGuild(), message.getContentRaw())}

          <!-- Attachments -->
          @template.html.message.attachments(message = message)

          @if(message.getTimeEdited() != null)
            <span class="message__edited user-select-none">
              <time class="timestamp user-select-none">
                ${message.getTimeEdited().format(TranscriptConstants.DATE_FULL)}
              </time>
              (edited)
            </span>
          @endif
        </div>

        <!-- Embeds -->
        @template.html.message.embeds(message = message)

        <!-- ActionRows -->
        @template.html.message.actionrows(message = message)

        <!-- Reactions -->
        @template.html.message.reactions(message = message)
      </div>
    </li>
    !{previousMessage = message;}
  @endfor
</ol>
</body>
</html>
