package io.github.skywolfxp.transcript;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.entities.*;
import net.dv8tion.jda.api.entities.channel.concrete.TextChannel;
import net.dv8tion.jda.api.entities.emoji.*;
import net.dv8tion.jda.api.interactions.InteractionType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.time.OffsetDateTime;
import java.time.ZoneOffset;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class TranscriptTestUtils {
  protected final static String AVATAR_URL_USER =
    "https://cdn.discordapp.com/avatars/545902760453996546/28198a269015c4aca5e25d63bc9b1a47.png?";
  protected final static String AVATAR_URL_BOT =
    "https://cdn.discordapp.com/avatars/1093684128437764136/812a2439d19dabf4da5e6f211b3eeb88.png?";
  protected final static String RICH_CUSTOM_EMOJI = "https://cdn.discordapp.com/emojis/1353135081476329523.webp?";
  protected final static OffsetDateTime TIME = OffsetDateTime.of(2030, 2, 20, 0, 0, 0, 0, ZoneOffset.UTC);

  @NotNull
  public static JDA mockJDA(@NotNull User user) {
    JDA jda = mock(JDA.class);
    when(jda.getUserById(user.getId())).thenReturn(user);

    return jda;
  }

  @NotNull
  public static TextChannel mockTextChannel(@NotNull String name, @Nullable Guild guild) {
    TextChannel textChannel = mock(TextChannel.class);
    when(textChannel.getName()).thenReturn(name);
    when(textChannel.getGuild()).thenReturn(guild);

    return textChannel;
  }

  @NotNull
  public static User mockAuthor(String userId, String name, String avatarUrl, boolean isBot) {
    User user = mock(User.class);
    when(user.getId()).thenReturn(userId);
    when(user.getEffectiveName()).thenReturn(name);
    when(user.getEffectiveAvatarUrl()).thenReturn(avatarUrl);
    when(user.isBot()).thenReturn(isBot);

    return user;
  }

  @NotNull
  public static Role mockRole(String name, int colorRaw) {
    Role role = mock(Role.class);
    when(role.getName()).thenReturn(name);
    when(role.getColorRaw()).thenReturn(colorRaw);

    return role;
  }

  @NotNull
  public static Message.Attachment mockAttachment(boolean isImage) {
    Message.Attachment attachment = mock(Message.Attachment.class);
    when(attachment.isImage()).thenReturn(isImage);
    when(attachment.getUrl()).thenReturn(AVATAR_URL_USER);
    when(attachment.getSize()).thenReturn(420);
    when(attachment.getFileName()).thenReturn(isImage ? "image.png" : "file.txt");

    return attachment;
  }

  @NotNull
  public static MessageReaction mockReactionUnicodeEmoji() {
    EmojiUnion emojiUnion = mock(EmojiUnion.class);
    UnicodeEmoji unicodeEmoji = mock(UnicodeEmoji.class);
    MessageReaction reaction = mock(MessageReaction.class);

    when(reaction.getCount()).thenReturn(69);
    when(reaction.getEmoji()).thenReturn(emojiUnion);
    when(reaction.getEmoji().getType()).thenReturn(Emoji.Type.UNICODE);
    when(reaction.getEmoji().asUnicode()).thenReturn(unicodeEmoji);
    when(reaction.getEmoji().asUnicode().getAsCodepoints()).thenReturn("U+1F49A");

    return reaction;
  }

  @NotNull
  public static MessageReaction mockReactionCustomEmoji() {
    EmojiUnion emojiUnion = mock(EmojiUnion.class);
    CustomEmoji customEmoji = mock(CustomEmoji.class);
    MessageReaction reaction = mock(MessageReaction.class);

    when(reaction.getCount()).thenReturn(69);
    when(reaction.getEmoji()).thenReturn(emojiUnion);
    when(reaction.getEmoji().getType()).thenReturn(Emoji.Type.CUSTOM);
    when(reaction.getEmoji().asCustom()).thenReturn(customEmoji);
    when(reaction.getEmoji().asCustom().getImageUrl()).thenReturn(AVATAR_URL_BOT);

    return reaction;
  }

  @NotNull
  public static MessageReaction mockReactionRichCustomEmoji() {
    EmojiUnion emojiUnion = mock(EmojiUnion.class);
    RichCustomEmoji richCustomEmoji = mock(RichCustomEmoji.class);
    MessageReaction reaction = mock(MessageReaction.class);

    when(reaction.getCount()).thenReturn(69);
    when(reaction.getEmoji()).thenReturn(emojiUnion);
    when(reaction.getEmoji().getType()).thenReturn(Emoji.Type.CUSTOM);
    when(reaction.getEmoji().asCustom()).thenReturn(richCustomEmoji);
    when(reaction.getEmoji().asCustom().getImageUrl()).thenReturn(RICH_CUSTOM_EMOJI);

    return reaction;
  }

  @NotNull
  @SuppressWarnings("deprecation")
  public static Message.Interaction mockInteraction(@NotNull User user) {
    Message.Interaction interaction = mock(Message.Interaction.class);
    when(interaction.getUser()).thenReturn(user);
    when(interaction.getType()).thenReturn(InteractionType.COMMAND);
    when(interaction.getName()).thenReturn("command");

    return interaction;
  }
}