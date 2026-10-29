package com.garaj.app.garaj

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.core.content.FileProvider
import android.content.Intent
import android.webkit.MimeTypeMap
import java.io.File

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "garaj/device_storage").setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "privateDirectory" -> result.success(noBackupFilesDir.absolutePath)
                    "excludeFromBackup" -> result.success(null)
                    "openDocument" -> {
                        val source = File(call.argument<String>("path") ?: "").canonicalFile
                        require(source.path.startsWith(noBackupFilesDir.canonicalPath + File.separator))
                        val directory = File(cacheDir, "documents").apply { mkdirs() }
                        val file = File(directory, source.name)
                        source.copyTo(file, overwrite = true)
                        val uri = FileProvider.getUriForFile(this, "$packageName.garaj.files", file)
                        val mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(file.extension.lowercase()) ?: "application/octet-stream"
                        startActivity(Intent(Intent.ACTION_VIEW).setDataAndType(uri, mime).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION))
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            } catch (error: Exception) { result.error("STORAGE_ERROR", error.message, null) }
        }
    }
}
