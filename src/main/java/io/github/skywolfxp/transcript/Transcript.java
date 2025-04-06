package io.github.skywolfxp.transcript;

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import gg.jte.output.Utf8ByteOutput;
import net.dv8tion.jda.api.utils.FileUpload;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Represents a generated Transcript in HTML of your Discord Text Channel.
 *
 * <br><br>Provides access to the {@link TemplateEngine}
 * used and the {@link Utf8ByteOutput}.
 *
 * <br><br> Uses <a href="https://github.com/casid/jte/">Java Template
 * Engine</a> for HTML generation.
 */
public final class Transcript {
  private final TemplateEngine templateEngine;
  private final Utf8ByteOutput utf8ByteOutput;

  /**
   * Constructs {@link Transcript} with {@link TemplateEngine} precompiled template configuration.
   */
  public Transcript() {
    this.templateEngine = TemplateEngine.createPrecompiled(ContentType.Html);
    this.utf8ByteOutput = new Utf8ByteOutput();

    this.templateEngine.setBinaryStaticContent(true);
    this.templateEngine.setTrimControlStructures(true);
  }

  /**
   * Constructs {@link Transcript} with provided {@link TemplateEngine}.
   *
   * @param templateEngine
   *   The {@link TemplateEngine} to use for Transcript generation.
   */
  public Transcript(@NotNull TemplateEngine templateEngine) {
    this.templateEngine = templateEngine;
    this.utf8ByteOutput = new Utf8ByteOutput();
  }

  @NotNull
  public TemplateEngine getTemplateEngine() {
    return templateEngine;
  }

  @NotNull
  public Utf8ByteOutput getUtf8ByteOutput() {
    return utf8ByteOutput;
  }

  /**
   * Converts the output to a {@link FileUpload} to directly send anywhere on Discord.
   *
   * <br><br>The {@code fileName} is appended with {@code .html} if it is not suffixed with it.
   *
   * @param fileName
   *   The file name to use for the generated Transcript.
   *
   * @return A {@link FileUpload} of the generated Transcript.
   */
  @NotNull
  public FileUpload toFileUpload(@NotNull String fileName) {
    return FileUpload.fromData(
      utf8ByteOutput.toByteArray(),
      fileName.endsWith(".html") ? fileName : fileName + ".html");
  }

  /**
   * Converts the output to a specified {@link File}.
   *
   * @param file
   *   The {@link File} to which the transcript should be written.
   *
   * @throws IOException
   *   If an I/O error occurs during file writing.
   */
  public void toFile(@NotNull File file) throws IOException {
    try (FileOutputStream fileOutputStream = new FileOutputStream(file)) {
      fileOutputStream.write(utf8ByteOutput.toByteArray());
    }
  }
}