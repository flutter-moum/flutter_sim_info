import Flutter
import UIKit
import CoreTelephony

public class SwiftSimInfoPlugin: NSObject, FlutterPlugin {
    
    lazy var carrier: CTCarrier? = {
        let networkInfo = CTTelephonyNetworkInfo()
        if #available(iOS 12.0, *) {
            return networkInfo.serviceSubscriberCellularProviders?.first?.value
        } else {
            return networkInfo.subscriberCellularProvider
        }
    }()
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter.moum.sim_info", binaryMessenger: registrar.messenger())
    let instance = SwiftSimInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let carrier = carrier else {
        result(FlutterError(code: "SIM_STATE_NOT_READY",
                            message: nil,
                            details: nil))
        return
    }
    if (call.method == "allowsVOIP") {
        result(carrier.allowsVOIP)
    } else if (call.method == "carrierName") {
        result(carrier.carrierName)
    } else if (call.method == "isoCountryCode") {
        result(carrier.isoCountryCode)
    } else if (call.method == "mobileCountryCode") {
        result(carrier.mobileCountryCode)
    } else if (call.method == "mobileNetworkCode") {
        result(carrier.mobileNetworkCode)
    }
  }
}
