# Keep the names of the classes for firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.android.play.core.** { *; }

# Keep the names of the classes for flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }

# Add additional rules as needed
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }