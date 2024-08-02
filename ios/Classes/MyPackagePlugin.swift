import Flutter
import UIKit
import GoogleMaps

public class MyPackagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "my_package", binaryMessenger: registrar.messenger())
    let instance = MyPackagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)

    case "setGoogleMapKey":
     if let jsonResult = call.arguments as? Dictionary<String, AnyObject> {
                        let googleMapsApiKey =  jsonResult["mapKey"] as? String ?? ""
                        GMSServices.provideAPIKey(googleMapsApiKey)
                    }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
