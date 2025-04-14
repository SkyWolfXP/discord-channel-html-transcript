package io.github.skywolfxp.transcript;

import net.dv8tion.jda.api.EmbedBuilder;
import net.dv8tion.jda.api.entities.Guild;
import net.dv8tion.jda.api.entities.Message;
import net.dv8tion.jda.api.entities.MessageEmbed;
import net.dv8tion.jda.api.entities.User;
import net.dv8tion.jda.api.entities.emoji.Emoji;
import net.dv8tion.jda.api.interactions.components.ActionRow;
import net.dv8tion.jda.api.interactions.components.buttons.Button;
import net.dv8tion.jda.api.interactions.components.buttons.ButtonStyle;
import net.dv8tion.jda.api.interactions.components.selections.StringSelectMenu;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

import static io.github.skywolfxp.transcript.TranscriptTestUtils.*;

public class TranscriptGeneratorTestUtils {
  private final static User AUTHOR_1 = mockAuthor("545902760453996546", "SkyWolfXP", AVATAR_URL_USER, false);
  private final static User AUTHOR_2 = mockAuthor("974748803305455627", "V0RT3X™", AVATAR_URL_BOT, true);

  @NotNull
  public static Guild createGuild() {
    GuildMockBuilder guildBuilder = new GuildMockBuilder().withJDA(mockJDA(AUTHOR_1));
    guildBuilder.withGuildChannel("420", mockTextChannel("discord-channel-html-transcript", guildBuilder.build()));
    guildBuilder.withRole("420", mockRole("Admin", 51200));

    return guildBuilder.build();
  }

  @NotNull
  public static List<Message> createMessages(@NotNull Guild guild) {
    Message.Attachment messageAttachmentImage = mockAttachment(true);
    Message.Attachment messageAttachmentFile = mockAttachment(false);

    List<MessageEmbed> embeds = new ArrayList<>();
    embeds.add(createMessageEmbed());

    Message message1 = new MessageMockBuilder(AUTHOR_1).withContent("**This**").build();

    Message message2 = new MessageMockBuilder(AUTHOR_1)
      .withContent("[Library](https://github.com/SkyWolfXP/discord-channel-html-transcript)")
      .build();

    Message message3 = new MessageMockBuilder(AUTHOR_1).withContent("__is__ *Awesome!*").build();

    Message message4 = new MessageMockBuilder(AUTHOR_2).withEmbeds(embeds).withActionRows(createActionRows()).build();

    Message message5 = new MessageMockBuilder(AUTHOR_1)
      .withAttachments(List.of(messageAttachmentImage, messageAttachmentFile))
      .withReactions(List.of(mockReactionUnicodeEmoji(), mockReactionCustomEmoji(), mockReactionRichCustomEmoji()))
      .withReference(message4)
      .build();

    Message message6 = new MessageMockBuilder(AUTHOR_2)
      .withGuild(guild)
      .withContent("""
                   # Big Header
                   ## Medium Header
                   ### Small Header
                   
                   `Code Line`
                   ```
                   Code Block
                   ```
                   
                   **User Mentions:** <@545902760453996546> <@0>
                   **Role Mentions:** <@&420> <@&0>
                   **Channel Mentions:** <#420> <#0>
                   """)
      .withInteractionMetadata(mockInteraction(AUTHOR_1))
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

  @NotNull
  public static MessageEmbed createMessageEmbed() {
    return new EmbedBuilder()
      .setAuthor("Author Name", AVATAR_URL_USER, AVATAR_URL_USER)
      .setTitle("Title")
      .setDescription("Description")
      .addField("#1 Field Name", "#1 Field Value", false)
      .addField("#2 Field Name", "#2 Field Value", false)
      .setImage(AVATAR_URL_USER)
      .setThumbnail(AVATAR_URL_USER)
      .setFooter("Footer", AVATAR_URL_USER)
      .setTimestamp(TIME)
      .setColor(51200)
      .build();
  }

  @NotNull
  public static List<ActionRow> createActionRows() {
    List<Button> actionRowButtons = new ArrayList<>();
    actionRowButtons.add(Button.of(ButtonStyle.PRIMARY, "1", "Primary", Emoji.fromUnicode("💠")));
    actionRowButtons.add(Button.of(ButtonStyle.SECONDARY, "2", "Secondary", Emoji.fromUnicode("💠")));
    actionRowButtons.add(Button.of(ButtonStyle.SUCCESS, "3", "Success", Emoji.fromUnicode("💠")));
    actionRowButtons.add(Button.of(ButtonStyle.DANGER, "4", "Danger", Emoji.fromUnicode("💠")));
    actionRowButtons.add(Button.of(ButtonStyle.LINK, "https://github.com/SkyWolfXP", "Link", Emoji.fromUnicode("🔗")));

    List<ActionRow> actionRows = new ArrayList<>();
    actionRows.add(ActionRow.of(actionRowButtons));
    actionRows.add(ActionRow.of(actionRowButtons.stream().map(Button::asDisabled).toList()));
    actionRows.add(ActionRow.of(StringSelectMenu.create("0").addOption("Option #1", "Value #1").build()));

    return actionRows;
  }
}