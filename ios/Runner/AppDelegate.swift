import Flutter
import GoogleMaps
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var documentController: UIDocumentInteractionController?
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    let defines = dartDefines()
    if let key = defines["GOOGLE_MAPS_API_KEY_IOS"] ?? defines["GOOGLE_MAPS_API_KEY"], !key.isEmpty {
      GMSServices.provideAPIKey(key)
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Generated.xcconfig provides DART_DEFINES to Info.plist during Flutter builds.
  // These mobile SDK keys must be restricted to this app's bundle identifier.
  private func dartDefines() -> [String: String] {
    guard let encoded = Bundle.main.object(forInfoDictionaryKey: "GarajDartDefines") as? String else { return [:] }
    var values: [String: String] = [:]
    for entry in encoded.split(separator: ",") {
      guard let data = Data(base64Encoded: String(entry)),
            let value = String(data: data, encoding: .utf8) else { continue }
      let pair = value.split(separator: "=", maxSplits: 1, omittingEmptySubsequences: false)
      if pair.count == 2 { values[String(pair[0])] = String(pair[1]) }
    }
    return values
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "GarajStorage")!
    let channel = FlutterMethodChannel(name: "garaj/device_storage", binaryMessenger: registrar.messenger())
    channel.setMethodCallHandler { [weak self] call, result in
      do {
        let manager = FileManager.default
        var root = try manager.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        root.appendPathComponent("GarajPrivate", isDirectory: true)
        try manager.createDirectory(at: root, withIntermediateDirectories: true)
        var resources = URLResourceValues()
        resources.isExcludedFromBackup = true
        try root.setResourceValues(resources)
        switch call.method {
        case "privateDirectory": result(root.path)
        case "excludeFromBackup":
          if let args = call.arguments as? [String: Any], let path = args["path"] as? String {
            var url = URL(fileURLWithPath: path)
            guard url.standardizedFileURL.path.hasPrefix(root.standardizedFileURL.path + "/") else { throw NSError(domain: "GarajStorage", code: 1) }
            try url.setResourceValues(resources)
          }
          result(nil)
        case "openDocument":
          guard let args = call.arguments as? [String: Any], let path = args["path"] as? String, path.hasPrefix(root.path + "/") else { throw NSError(domain: "GarajStorage", code: 1) }
          let controller = UIDocumentInteractionController(url: URL(fileURLWithPath: path))
          self?.documentController = controller
          if let view = self?.window?.rootViewController?.view { controller.presentOptionsMenu(from: view.bounds, in: view, animated: true) }
          result(nil)
        default: result(FlutterMethodNotImplemented)
        }
      } catch { result(FlutterError(code: "STORAGE_ERROR", message: error.localizedDescription, details: nil)) }
    }
  }
}
