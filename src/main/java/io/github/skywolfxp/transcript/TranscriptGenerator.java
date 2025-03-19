package io.github.skywolfxp.transcript;

import net.dv8tion.jda.api.entities.ISnowflake;
import net.dv8tion.jda.api.entities.Message;
import net.dv8tion.jda.api.entities.channel.concrete.TextChannel;
import org.jetbrains.annotations.NotNull;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

/**
 * Generates HTML transcripts from Discord text channels using a provided {@link Transcript}.
 *
 * <br><br>This handles the retrieval of messages from a {@link TextChannel} and generates the Transcript
 * as HTML using the <a href="https://github.com/casid/jte/">Java Template Engine</a>.
 */
public class TranscriptGenerator {
/**
 * @param transcript
 *         The {@link Transcript} to generate the transcript into.
 * @param textChannel
 *         The {@link TextChannel} for which to create the transcript.
 *
 * @return The {@link Transcript} populated with the generated {@link TextChannel} data.
 *
 * @throws IllegalArgumentException
 *         If the specified {@code textChannel} contains no messages
 */
public Transcript createTranscript(@NotNull Transcript transcript,
                                   @NotNull TextChannel textChannel) throws IllegalArgumentException {
  List<Message> messages = textChannel.getIterableHistory().stream()
                                      .sorted(Comparator.comparing(ISnowflake::getTimeCreated)).toList();
  
  if (messages.isEmpty()) {
    throw new IllegalArgumentException("TextChannel: %s contains no messages".formatted(textChannel.getName()));
  }
  
  HashMap<String, Object> params = new HashMap<>();
  params.put("textChannel", textChannel);
  params.put("messages", messages);
  
  transcript.getTemplateEngine().render("template/template.jte", params, transcript.getUtf8ByteOutput());
  
  return transcript;
}
}


