@import net.dv8tion.jda.api.entities.Message
@import net.dv8tion.jda.api.entities.emoji.Emoji
@import net.dv8tion.jda.api.interactions.components.buttons.Button
@import net.dv8tion.jda.api.interactions.components.selections.SelectMenu

@param Message message

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
                    alt="Custom Emoji"
                    loading="lazy"
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
          @if(component instanceof SelectMenu)
            <div class="action-row__select">
              <span>Make a selection</span>

              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                width="18"
                height="18"
                fill="white"
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