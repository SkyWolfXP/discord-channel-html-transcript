package io.github.skywolfxp.transcript;

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.output.Utf8ByteOutput;
import gg.jte.resolve.DirectoryCodeResolver;
import org.junit.jupiter.api.AfterEach;
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
import java.util.HashMap;

import static org.mockito.Mockito.when;

class TranscriptGeneratorTest {
private static final Path OUTPUT_DIR = Path.of(System.getProperty("java.io.tmpdir"))
                                           .resolve("discord-jda-html-channel-transcript");

AutoCloseable autoCloseable;

@Mock
Transcript transcript;

@TempDir
Path tempDir;

@BeforeEach
void setUp() throws IOException {
  autoCloseable = MockitoAnnotations.openMocks(this);
  
  when(transcript.getTemplateEngine()).thenReturn(
          TemplateEngine.create(new DirectoryCodeResolver(Path.of("src/main/resources/template")), ContentType.Html));
  when(transcript.getUtf8ByteOutput()).thenReturn(new Utf8ByteOutput());
  
  if (!Files.exists(OUTPUT_DIR)) {
    Files.createDirectories(OUTPUT_DIR);
  }
}

@AfterEach
void tearDown() throws Exception {
  autoCloseable.close();
}

@Test
void createTranscript() throws IOException {
  HashMap<String, Object> params = new HashMap<>();
  params.put("textChannel", TranscriptTestUtils.mockTextChannel());
  params.put("messages", TranscriptGeneratorTestUtils.createMessages());
  
  transcript.getTemplateEngine().render("template-test.jte", params, transcript.getUtf8ByteOutput());
  
  try (FileOutputStream fileOutputStream = new FileOutputStream(tempDir.resolve("transcript-test.html").toFile())) {
    fileOutputStream.write(transcript.getUtf8ByteOutput().toByteArray());
  }
  
  Files.copy(tempDir.resolve("transcript-test.html"),
             OUTPUT_DIR.resolve("transcript.html"),
             StandardCopyOption.REPLACE_EXISTING);
}
}