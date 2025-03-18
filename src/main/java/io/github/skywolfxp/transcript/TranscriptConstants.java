package io.github.skywolfxp.transcript;

import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class TranscriptConstants {
public static final DateTimeFormatter DATE_FULL = DateTimeFormatter
        .ofPattern("eeee, MMMM M, u 'at' h:mm a (O)").withZone(ZoneId.systemDefault());
public static final DateTimeFormatter DATE_LONG = DateTimeFormatter
        .ofPattern("MMMM d, u").withZone(ZoneId.systemDefault());
public static final DateTimeFormatter DATE_SHORT = DateTimeFormatter
        .ofPattern("M/d/uu, h:mm a (O)").withZone(ZoneId.systemDefault());
public static final DateTimeFormatter TIME_SHORT = DateTimeFormatter
        .ofPattern("h:mm a").withZone(ZoneId.systemDefault());
}
