import java.util.Properties

plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// La clé d'envoi. Le fichier vit hors du dépôt (`android/.gitignore` l'exclut,
// et il pointe vers `C:\Users\thomas\cles-android\`) : un mot de passe de
// signature dans un dépôt public est une clé publique.
//
// Absent, on retombe sur la clé de debug pour que `flutter run --release`
// continue de marcher sur une machine qui n'a pas la clé — mais un AAB signé
// en debug est refusé par Play, d'où le message au moment du build release.
val fichierCle = rootProject.file("key.properties")
val proprietesCle = Properties().apply {
    if (fichierCle.exists()) fichierCle.inputStream().use { load(it) }
}
val cleDisponible = fichierCle.exists()

// Un fichier declare mais dont le magasin est introuvable fait echouer le
// build, il ne fait pas retomber sur la cle de debug.
//
// C'est arrive au premier essai : `storeFile` valait un chemin Windows
// `C:\Users\...`, or dans un fichier .properties l'antislash est un caractere
// d'echappement — `\U` devient `U`, `\t` devient une tabulation. Le chemin
// etait donc muet et faux, la cle « absente », et un AAB signe en debug est
// sorti sans une ligne d'erreur. Il n'a ete repere qu'en imprimant le
// certificat du bundle. D'ou l'echec franc, et les slashes.
if (cleDisponible) {
    val magasin = proprietesCle.getProperty("storeFile")
        ?: throw GradleException("key.properties existe mais ne declare pas storeFile")
    if (!file(magasin).exists()) {
        throw GradleException(
            "Magasin de cles introuvable : $magasin\n" +
                "Dans un fichier .properties, ecrire le chemin avec des / " +
                "et non des \\ — l'antislash y est un caractere d'echappement.",
        )
    }
}

android {
    namespace = "fr.trombone.pdf"
    compileSdk = 37
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // Définitif dès la première publication sur Play : un applicationId ne
        // se change plus jamais ensuite (ce serait une autre application, avec
        // d'autres installations et d'autres avis). D'où le choix d'un
        // identifiant qui ne nomme aucun outil en particulier — l'ancien,
        // `com.fusionpdf.fusion_pdf`, aurait figé « fusion » dans une
        // application qui en propose vingt-quatre.
        applicationId = "fr.trombone.pdf"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (cleDisponible) {
            create("upload") {
                storeFile = file(proprietesCle.getProperty("storeFile"))
                storePassword = proprietesCle.getProperty("storePassword")
                keyAlias = proprietesCle.getProperty("keyAlias")
                keyPassword = proprietesCle.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (cleDisponible) {
                signingConfigs.getByName("upload")
            } else {
                logger.warn(
                    "key.properties introuvable : le build release est signé " +
                        "avec la clé de debug. Play refusera cet artefact.",
                )
                signingConfigs.getByName("debug")
            }
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
