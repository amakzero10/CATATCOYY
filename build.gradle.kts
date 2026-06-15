import java.util.Properties
import java.io.FileInputStream

val envFile = rootProject.file(".env.example")
val envProps = Properties()

if (envFile.exists()) {
    FileInputStream(envFile).use { envProps.load(it) }
} else {
    println("Warning: .env.example not found, using default/empty config")
}

android {
    defaultConfig {
        buildConfigField("String", "GEMINI_API_KEY", "\"${envProps.getProperty("GEMINI_API_KEY", "")}\"")
    }
}
