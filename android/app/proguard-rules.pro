# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# SQLCipher & SQLite
-keep class net.sqlcipher.** { *; }
-keep class net.sqlcipher.database.** { *; }
-keep class org.sqlite.** { *; }

# Firebase App Check & Play Integrity
-keep class com.google.firebase.appcheck.** { *; }
-keep class com.google.android.play.core.integrity.** { *; }

# Drift
-keep class com.simonmick.drift.** { *; }

# Ignore missing Play Core classes referenced by Flutter
-dontwarn com.google.android.play.core.**
