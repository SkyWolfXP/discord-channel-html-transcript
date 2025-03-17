package com.github.skywolfxp.transcript;

import net.dv8tion.jda.api.entities.Message;
import net.dv8tion.jda.api.entities.channel.concrete.TextChannel;
import net.dv8tion.jda.api.utils.FileUpload;
import org.jetbrains.annotations.NotNull;
import org.thymeleaf.ITemplateEngine;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templatemode.TemplateMode;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

public class Transcript {
/**
 * @throws IllegalArgumentException If textChannel has no messages
 * @throws IOException              If fails writing the HTML
 */
public FileUpload generateTranscript(@NotNull TextChannel textChannel) throws IllegalArgumentException, IOException {
  List<Message> messages = textChannel.getIterableHistory().stream().toList();
  
  if (messages.isEmpty()) {
    throw new IllegalArgumentException("%s TextChannel has no messages".formatted(textChannel.getName()));
  }
  
  Context context = new Context(Locale.ENGLISH);
  
  for (Message message : messages) {
    
  }
  
  String processedHTML = buildTemplateEngine().process("template", context);
  
  File tempFile = File.createTempFile("template", ".html");
  
  try (FileWriter fileWriter = new FileWriter(tempFile)) {
    fileWriter.write(processedHTML);
  }
  
  return FileUpload.fromData(tempFile);
}

@NotNull
private static ClassLoaderTemplateResolver buildTemplateResolver() {
  final ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
  
  templateResolver.setTemplateMode(TemplateMode.HTML);
  // This will convert "home" to "/WEB-INF/templates/home.html"
  templateResolver.setPrefix("/WEB-INF/templates/");
  templateResolver.setSuffix(".html");
  templateResolver.setCacheTTLMs(3600000L);
  templateResolver.setCacheable(true);
  
  return templateResolver;
  
}

@NotNull
private static ITemplateEngine buildTemplateEngine() {
  final TemplateEngine templateEngine = new TemplateEngine();
  
  templateEngine.setTemplateResolver(buildTemplateResolver());
  
  return templateEngine;
}
}
