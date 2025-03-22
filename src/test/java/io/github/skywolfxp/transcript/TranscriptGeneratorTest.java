package io.github.skywolfxp.transcript;

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.output.Utf8ByteOutput;
import gg.jte.resolve.DirectoryCodeResolver;
import net.dv8tion.jda.api.entities.Message;
import net.dv8tion.jda.api.entities.MessageEmbed;
import net.dv8tion.jda.api.entities.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static io.github.skywolfxp.transcript.TranscriptTestUtils.*;
import static org.mockito.Mockito.when;

class TranscriptGeneratorTest {
private final static String AVATAR_URL_1 = "https://cdn.discordapp.com/avatars/545902760453996546/8d3a7164a3ed3e0f1a500e776fa07963.png";
private final static String AVATAR_URL_2 = "https://cdn.discordapp.com/avatars/1093684128437764136/812a2439d19dabf4da5e6f211b3eeb88.png";

private AutoCloseable session;

@Mock
private Transcript transcript;

@TempDir
private Path tempDir;

@BeforeEach
void setup() {
  session = MockitoAnnotations.openMocks(this);
  
  TemplateEngine templateEngine =
          TemplateEngine.create(new DirectoryCodeResolver(Path.of("src/main/resources/template")), ContentType.Html);
  Utf8ByteOutput utf8ByteOutput = new Utf8ByteOutput();
  
  when(transcript.getTemplateEngine()).thenReturn(templateEngine);
  when(transcript.getUtf8ByteOutput()).thenReturn(utf8ByteOutput);
}

@Test
void createTranscript() throws IOException {
  User author1 = mockAuthor("545902760453996546", "SkyWolfXP", AVATAR_URL_1, false);
  User author2 = mockAuthor("974748803305455627", "V0RT3X™", AVATAR_URL_2, true);
  
  Message.Attachment messageAttachmentImage = mockAttachment(true);
  Message.Attachment messageAttachmentFile = mockAttachment(false);
  
  List<MessageEmbed> embeds = new ArrayList<>();
  embeds.add(createMessageEmbed());
  
  Message message1 = new MessageMockBuilder(author1)
          .withContent(createMessageContentRaw())
          .withAttachments(List.of(messageAttachmentImage, messageAttachmentFile))
          .build();
  
  Message message2 = new MessageMockBuilder(author2)
          .withEmbeds(embeds)
          .withActionRows(createActionRows())
          .build();
  
  Message message3 = new MessageMockBuilder(author1)
          .withAttachments(List.of(messageAttachmentImage, messageAttachmentFile))
          .withReference(message2)
          .build();
  
  HashMap<String, Object> params = new HashMap<>();
  params.put("textChannel", mockTextChannel());
  params.put("messages", List.of(message1, message2, message3));
  
  transcript.getTemplateEngine().render("test-template.jte", params, transcript.getUtf8ByteOutput());
  
  try (FileOutputStream fileOutputStream = new FileOutputStream(tempDir.resolve("test-transcript.html").toFile())) {
    fileOutputStream.write(transcript.getUtf8ByteOutput().toByteArray());
  }
  
  Files.copy(tempDir.resolve("test-transcript.html"),
             Path.of("E:/SkyWolfXP/Downloads/transcript.html"),
             StandardCopyOption.REPLACE_EXISTING);
}
}