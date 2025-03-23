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

import static io.github.skywolfxp.transcript.TranscriptTestUtils.mockTextChannel;
import static org.mockito.Mockito.when;

class TranscriptGeneratorTest {
private AutoCloseable closeable;

@Mock
private Transcript transcript;

@TempDir
private Path tempDir;

@BeforeEach
void setUp() {
  closeable = MockitoAnnotations.openMocks(this);
  
  TemplateEngine templateEngine =
          TemplateEngine.create(new DirectoryCodeResolver(Path.of("src/main/resources/template")), ContentType.Html);
  Utf8ByteOutput utf8ByteOutput = new Utf8ByteOutput();
  
  when(transcript.getTemplateEngine()).thenReturn(templateEngine);
  when(transcript.getUtf8ByteOutput()).thenReturn(utf8ByteOutput);
}

@AfterEach
void tearDown() throws Exception {
  closeable.close();
}

@Test
void createTranscript() throws IOException {
  HashMap<String, Object> params = new HashMap<>();
  params.put("textChannel", mockTextChannel());
  params.put("messages", TranscriptGeneratorTestUtils.createMessages());
  
  transcript.getTemplateEngine().render("test-template.jte", params, transcript.getUtf8ByteOutput());
  
  try (FileOutputStream fileOutputStream = new FileOutputStream(tempDir.resolve("test-transcript.html").toFile())) {
    fileOutputStream.write(transcript.getUtf8ByteOutput().toByteArray());
  }
  
  Files.copy(tempDir.resolve("test-transcript.html"),
             Path.of("E:/SkyWolfXP/Downloads/transcript.html"),
             StandardCopyOption.REPLACE_EXISTING);
}
}