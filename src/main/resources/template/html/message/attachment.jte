@import net.dv8tion.jda.api.entities.Message
@import dev.skywolfxp.transcript.TranscriptUtils

@param Message message

@for(var attachment : message.getAttachments())
  @if(attachment.isImage())
    <a href="${attachment.getUrl()}">
      <img
        src="${attachment.getUrl()}"
        alt="Image"
        loading="lazy"
        class="attachment__image"
      >
    </a>
  @else
    <div class="attachment__file media__container">
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
