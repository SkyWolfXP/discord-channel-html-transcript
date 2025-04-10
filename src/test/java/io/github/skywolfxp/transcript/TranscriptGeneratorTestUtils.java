package io.github.skywolfxp.transcript;

import net.dv8tion.jda.api.entities.Message;
import net.dv8tion.jda.api.entities.MessageEmbed;
import net.dv8tion.jda.api.entities.User;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

import static io.github.skywolfxp.transcript.TranscriptTestUtils.*;

public class TranscriptGeneratorTestUtils {
  @NotNull
  public static List<Message> createMessages() {
    User author1 = mockAuthor("545902760453996546", "SkyWolfXP", AVATAR_URL_USER, false);
    User author2 = mockAuthor("974748803305455627", "V0RT3X™", AVATAR_URL_BOT, true);

    Message.Attachment messageAttachmentImage = mockAttachment(true);
    Message.Attachment messageAttachmentFile = mockAttachment(false);

    List<MessageEmbed> embeds = new ArrayList<>();
    embeds.add(createMessageEmbed());

    Message message1 = new MessageMockBuilder(author1).withContent("**This**").build();

    Message message2 = new MessageMockBuilder(author1)
      .withContent("[Library](https://github.com/SkyWolfXP/discord-jda-html-channel-transcript)")
      .build();

    Message message3 = new MessageMockBuilder(author1).withContent("__is__ *Awesome*!").build();

    Message message4 = new MessageMockBuilder(author2).withEmbeds(embeds).withActionRows(createActionRows()).build();

    Message message5 = new MessageMockBuilder(author1)
      .withAttachments(List.of(messageAttachmentImage, messageAttachmentFile))
      .withReactions(List.of(mockReactionUnicodeEmoji(), mockReactionCustomEmoji(), mockReactionRichCustomEmoji()))
      .withReference(message4)
      .build();

    Message message6 = new MessageMockBuilder(author2)
      .withContent("""
                   # Big Header
                   ## Medium Header
                   ### Small Header
                   
                   `Code Inline`
                   
                   ```
                   Code Block
                   ```
                   """)
      .withInteractionMetadata(mockInteraction(author1))
      .build();

    List<Message> messages = new ArrayList<>();
    messages.add(message1);
    messages.add(message2);
    messages.add(message3);
    messages.add(message4);
    messages.add(message5);
    messages.add(message6);

    return messages;
  }
}