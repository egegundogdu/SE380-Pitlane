import java.util.Base64
import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Flutter passes --dart-define values to Gradle as comma-separated Base64 pairs.
// Keep the same key source usable by both Dart's feature flag and native Maps.
val garajDartDefines = (project.findProperty("dart-defines") as? String)
    .orEmpty()
    .split(',')
    .filter { it.isNotBlank() }
    .mapNotNull { encoded ->
        runCatching {
            String(Base64.getDecoder().decode(encoded), Charsets.UTF_8)
                .split('=', limit = 2)
                .takeIf { it.size == 2 }
                ?.let { it[0] to it[1] }
        }.getOrNull()
    }
    .toMap()

val garajMapsApiKey = (project.findProperty("MAPS_API_KEY") as? String)
    ?.takeIf { it.isNotBlank() }
    ?: System.getenv("GOOGLE_MAPS_API_KEY_ANDROID")?.takeIf { it.isNotBlank() }
    ?: System.getenv("GOOGLE_MAPS_API_KEY")?.takeIf { it.isNotBlank() }
    ?: garajDartDefines["GOOGLE_MAPS_API_KEY_ANDROID"]
    ?: garajDartDefines["GOOGLE_MAPS_API_KEY"]
    ?: ""

if (garajDartDefines["MAPS_ENABLED"] == "true" && garajMapsApiKey.isBlank()) {
    throw GradleException("MAPS_ENABLED=true requires GOOGLE_MAPS_API_KEY_ANDROID or GOOGLE_MAPS_API_KEY.")
}

// Release signing comes from android/key.properties (never committed; see
// docs/native-config.md). Without it a release build is signed with the
// debug key: installable for testing, never for a store upload.
val garajReleaseKey = Properties().apply {
    val file = rootProject.file("key.properties")
    if (file.exists()) file.inputStream().use { load(it) }
}
if (garajReleaseKey.isEmpty) {
    logger.warn("android/key.properties not found: release builds use the debug signing key.")
}

android {
    namespace = "com.garaj.app.garaj"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        manifestPlaceholders["MAPS_API_KEY"] = garajMapsApiKey
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.garaj.app.garaj"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (!garajReleaseKey.isEmpty) {
            create("release") {
                keyAlias = garajReleaseKey.getProperty("keyAlias")
                keyPassword = garajReleaseKey.getProperty("keyPassword")
                storeFile = rootProject.file(garajReleaseKey.getProperty("storeFile"))
                storePassword = garajReleaseKey.getProperty("storePassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName(
                if (garajReleaseKey.isEmpty) "debug" else "release",
            )
            // Flutter enables R8 for release; these keep it from failing on
            // the OCR plugin's optional, deliberately absent language models.
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}
