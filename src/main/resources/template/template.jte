@import java.util.List
@import net.dv8tion.jda.api.entities.Message
@import net.dv8tion.jda.api.entities.channel.concrete.TextChannel
@import io.github.skywolfxp.transcript.TranscriptConstants
@import io.github.skywolfxp.transcript.TranscriptUtils

@param List<Message> messages
@param TextChannel textChannel
@param boolean isDev

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
  @template.css.reset()

  @if(isDev)
    <link
      rel="stylesheet"
      type="text/css"
      href="./style.css"
    />
  @else
    @template.css.style()
  @endif
</head>

<body>
<!-- Header -->
<div class="header user-select-none">
  <!-- Bar -->
  <div class="bar">
    <div class="bar__guild">
      <img
        src="${textChannel.getGuild().getIconUrl()}"
        alt="Server Icon"
        loading="lazy"
        class="size-5"
      />

      <div class="bar__guild__name">
        ${textChannel.getGuild().getName()}
      </div>
    </div>
  </div>

  <!-- Channel Header -->
  <section class="channel__header">
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 24 24"
      aria-hidden="true"
      role="img"
      class="channel__header__icon size-5"
    >
      <path
        fill-rule="evenodd"
        d="M10.99 3.16A1 1 0 1 0 9 2.84L8.15 8H4a1 1 0 0 0 0 2h3.82l-.67 4H3a1 1 0 1 0 0 2h3.82l-.8 4.84a1 1 0 0 0 1.97.32L8.85 16h4.97l-.8 4.84a1 1 0 0 0 1.97.32l.86-5.16H20a1 1 0 1 0 0-2h-3.82l.67-4H21a1 1 0 1 0 0-2h-3.82l.8-4.84a1 1 0 1 0-1.97-.32L15.15 8h-4.97l.8-4.84ZM14.15 14l.67-4H9.85l-.67 4h4.97Z"
      />
    </svg>

    <h1 class="channel__header__title">${textChannel.getName()}</h1>
  </section>
</div>

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
            src="${message.getAuthor().getEffectiveAvatarUrl()}"
            alt="Author Avatar"
            loading="lazy"
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
          @template.html.message.attachment(message = message)

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
        @template.html.message.embed(message = message)

        <!-- ActionRows -->
        @template.html.message.action-row(message = message)

        <!-- Reactions -->
        @template.html.message.reaction(message = message)
      </div>
    </li>
    !{previousMessage = message;}
  @endfor
</ol>

@template.html.license()
</body>
</html>