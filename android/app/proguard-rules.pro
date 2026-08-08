# The google_mlkit_text_recognition plugin references the recognizer options
# for every script it supports (Chinese, Devanagari, Japanese, Korean), but we
# only depend on the Latin recognizer — so those classes are genuinely absent
# from the APK and R8 must be told that's intentional rather than an error.
# Adding the other script artifacts instead would grow the APK for scripts this
# app doesn't offer.
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**

# Syncfusion's PDF library resolves some codecs and font handlers reflectively.
-keep class com.syncfusion.** { *; }
-dontwarn com.syncfusion.**
