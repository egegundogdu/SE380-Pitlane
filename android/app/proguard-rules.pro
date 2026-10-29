# google_mlkit_text_recognition refers to the Chinese, Devanagari, Japanese
# and Korean recognisers. Garaj reads Turkish receipts with the Latin model
# only, so those optional artifacts are absent on purpose; without these rules
# R8 stops the release build on the missing classes.
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**

# ML Kit registers its parts as Firebase components: at start-up
# MlKitInitProvider creates each ComponentRegistrar named in the manifest
# through its no-argument constructor, by reflection. The rule shipped with
# firebase-components 16.1.0 keeps those classes but, in R8 full mode (the
# default since AGP 8), not that constructor. Without it text recognition is
# never registered and a release build reads no receipt.
-keep class * implements com.google.firebase.components.ComponentRegistrar {
    <init>();
}
