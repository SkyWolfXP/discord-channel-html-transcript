package io.github.skywolfxp.transcript;

import net.dv8tion.jda.api.entities.*;
import net.dv8tion.jda.api.interactions.components.ActionRow;
import org.jetbrains.annotations.NotNull;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Random;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public final class MessageMockBuilder {
  private final Message message = mock(Message.class);

  public MessageMockBuilder(@NotNull User author) {
    Guild guild = mock(Guild.class);
    when(message.getGuild()).thenReturn(guild);

    when(message.getAuthor()).thenReturn(author);
    when(message.getContentRaw()).thenReturn("");
    when(message.getTimeCreated()).thenReturn(OffsetDateTime.now());
    when(message.getId()).thenReturn(String.valueOf(new Random().nextLong(100000000000000000L, 999999999999999999L)));
  }

  public MessageMockBuilder withContent(@NotNull String content) {
    when(message.getContentRaw()).thenReturn(content);
    return this;
  }

  public MessageMockBuilder withAttachments(List<Message.Attachment> attachments) {
    when(message.getAttachments()).thenReturn(attachments);
    return this;
  }

  public MessageMockBuilder withEmbeds(List<MessageEmbed> embeds) {
    when(message.getEmbeds()).thenReturn(embeds);
    return this;
  }

  public MessageMockBuilder withActionRows(List<ActionRow> actionRows) {
    when(message.getActionRows()).thenReturn(actionRows);
    return this;
  }

  public MessageMockBuilder withReactions(List<MessageReaction> messageReactions) {
    when(message.getReactions()).thenReturn(messageReactions);
    return this;
  }

  public MessageMockBuilder withReference(@NotNull Message referencedMessage) {
    when(message.getReferencedMessage()).thenReturn(referencedMessage);
    return this;
  }

  @SuppressWarnings("deprecation")
  public MessageMockBuilder withInteractionMetadata(@NotNull Message.Interaction interaction) {
    when(message.getInteraction()).thenReturn(interaction);
    return this;
  }

  public Message build() {
    return message;
  }
}