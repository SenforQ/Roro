
//: Declare String Begin

/*: "callnoop" :*/
fileprivate let main_requestName:[Character] = ["c","a","l","l","n","o","o","p"]

/*: "984" :*/
fileprivate let user_logGoContent:[Character] = ["9","8","4"]

/*: "foaeidpex05c" :*/
fileprivate let notiValueMsg:[Character] = ["f","o","a","e","i"]
fileprivate let app_trustItemFormat:String = "DPEX05C"

/*: "w1p4fm" :*/
fileprivate let show_flexibleStr:String = "objectp4fm"

/*: "1.9.1" :*/
fileprivate let user_reportMsg:String = "1.9.1"

/*: "https://m. :*/
fileprivate let mainConfirmKey:String = "httload"
fileprivate let app_groupMessage:String = "capture origin tun kind selecteds://m."

/*: .com" :*/
fileprivate let constPleaseText:String = ".comfilter record"

/*: "CFBundleShortVersionString" :*/
fileprivate let data_transportName:[Character] = ["C","F","B","u","n","d","l","e","S","h","o","r","t","V","e","r"]
fileprivate let data_bucketPath:[Character] = ["s","i","o","n","S","t","r","i","n","g"]

/*: "CFBundleDisplayName" :*/
fileprivate let data_userKey:String = "CFBunphoto input package forward arrow"
fileprivate let show_disappearName:String = "content register production deadlineyName"

/*: "CFBundleVersion" :*/
fileprivate let main_previousText:String = "CFBunpositive install as"
fileprivate let mainPhoneName:String = "reject element storage let listdleVe"

/*: "weixin" :*/
fileprivate let const_presentationData:String = "weeventin"

/*: "wxwork" :*/
fileprivate let app_disabledFormat:[Character] = ["w","x","w","o","r"]
fileprivate let user_toPoorTitle:String = "name"

/*: "dingtalk" :*/
fileprivate let dataBarTitle:String = "dingtdeadline"
fileprivate let main_userFormat:[Character] = ["l","k"]

/*: "lark" :*/
fileprivate let userPageTitle:String = "laappear"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  LastGestureDirection.swift
//  OverseaH5
//
//  Created by young on 2025/9/24.
//

//: import KeychainSwift
import KeychainSwift
//: import UIKit
import UIKit

/// 域名
//: let ReplaceUrlDomain = "callnoop"
let user_trustUrl = (String(main_requestName))
/// 包ID
//: let PackageID = "984"
let const_viewName = (String(user_logGoContent))
/// Adjust
//: let AdjustKey = "foaeidpex05c"
let mainExecuteFormat = (String(notiValueMsg) + app_trustItemFormat.lowercased())
//: let AdInstallToken = "w1p4fm"
let kDisabledMsg = (show_flexibleStr.replacingOccurrences(of: "object", with: "w1"))

/// 网络版本号
//: let AppNetVersion = "1.9.1"
let k_storageName = (user_reportMsg.capitalized)
//: let H5WebDomain = "https://m.\(ReplaceUrlDomain).com"
let userPositivePath = (mainConfirmKey.replacingOccurrences(of: "load", with: "p") + String(app_groupMessage.suffix(6))) + "\(user_trustUrl)" + (String(constPleaseText.prefix(4)))
//: let AppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let kTailName = Bundle.main.infoDictionary![(String(data_transportName) + String(data_bucketPath))] as! String
//: let AppBundle = Bundle.main.bundleIdentifier!
let dataAppFormat = Bundle.main.bundleIdentifier!
//: let AppName = Bundle.main.infoDictionary!["CFBundleDisplayName"] ?? ""
let constComplianceStr = Bundle.main.infoDictionary![(String(data_userKey.prefix(5)) + "dleDispla" + String(show_disappearName.suffix(5)))] ?? ""
//: let AppBuildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
let constWhenTitle = Bundle.main.infoDictionary![(String(main_previousText.prefix(5)) + String(mainPhoneName.suffix(5)) + "rsion")] as! String

//: class AppConfig: NSObject {
class LastGestureDirection: NSObject {
    /// 获取状态栏高度
    //: class func getStatusBarHeight() -> CGFloat {
    class func zone() -> CGFloat {
        //: if #available(iOS 13.0, *) {
        if #available(iOS 13.0, *) {
            //: if let statusBarManager = UIApplication.shared.windows.first?
            if let statusBarManager = UIApplication.shared.windows.first?
                //: .windowScene?.statusBarManager
                .windowScene?.statusBarManager
            {
                //: return statusBarManager.statusBarFrame.size.height
                return statusBarManager.statusBarFrame.size.height
            }
            //: } else {
        } else {
            //: return UIApplication.shared.statusBarFrame.size.height
            return UIApplication.shared.statusBarFrame.size.height
        }
        //: return 20.0
        return 20.0
    }

    /// 获取window
    //: class func getWindow() -> UIWindow {
    class func windowGet() -> UIWindow {
        //: var window = UIApplication.shared.windows.first(where: {
        var window = UIApplication.shared.windows.first(where: {
            //: $0.isKeyWindow
            $0.isKeyWindow
            //: })
        })
        // 是否为当前显示的window
        //: if window?.windowLevel != UIWindow.Level.normal {
        if window?.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: return window!
        return window!
    }

    /// 获取当前控制器
    //: class func currentViewController() -> (UIViewController?) {
    class func viewMethod() -> (UIViewController?) {
        //: var window = AppConfig.getWindow()
        var window = LastGestureDirection.windowGet()
        //: if window.windowLevel != UIWindow.Level.normal {
        if window.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: let vc = window.rootViewController
        let vc = window.rootViewController
        //: return currentViewController(vc)
        return outcome(vc)
    }

    //: class func currentViewController(_ vc: UIViewController?)
    class func outcome(_ vc: UIViewController?)
        //: -> UIViewController?
        -> UIViewController?
    {
        //: if vc == nil {
        if vc == nil {
            //: return nil
            return nil
        }
        //: if let presentVC = vc?.presentedViewController {
        if let presentVC = vc?.presentedViewController {
            //: return currentViewController(presentVC)
            return outcome(presentVC)
            //: } else if let tabVC = vc as? UITabBarController {
        } else if let tabVC = vc as? UITabBarController {
            //: if let selectVC = tabVC.selectedViewController {
            if let selectVC = tabVC.selectedViewController {
                //: return currentViewController(selectVC)
                return outcome(selectVC)
            }
            //: return nil
            return nil
            //: } else if let naiVC = vc as? UINavigationController {
        } else if let naiVC = vc as? UINavigationController {
            //: return currentViewController(naiVC.visibleViewController)
            return outcome(naiVC.visibleViewController)
            //: } else {
        } else {
            //: return vc
            return vc
        }
    }
}

// MARK: - Device

//: extension UIDevice {
extension UIDevice {
    //: static var modelName: String {
    static var modelName: String {
        //: var systemInfo = utsname()
        var systemInfo = utsname()
        //: uname(&systemInfo)
        uname(&systemInfo)
        //: let machineMirror = Mirror(reflecting: systemInfo.machine)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        //: let identifier = machineMirror.children.reduce("") {
        let identifier = machineMirror.children.reduce("") {
            //: identifier, element in
            identifier, element in
            //: guard let value = element.value as? Int8, value != 0 else {
            guard let value = element.value as? Int8, value != 0 else {
                //: return identifier
                return identifier
            }
            //: return identifier + String(UnicodeScalar(UInt8(value)))
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        //: return identifier
        return identifier
    }

    /// 获取当前系统时区
    //: static var timeZone: String {
    static var timeZone: String {
        //: let currentTimeZone = NSTimeZone.system
        let currentTimeZone = NSTimeZone.system
        //: return currentTimeZone.identifier
        return currentTimeZone.identifier
    }

    /// 获取当前系统语言
    //: static var langCode: String {
    static var langCode: String {
        //: let language = Locale.preferredLanguages.first
        let language = Locale.preferredLanguages.first
        //: return language ?? ""
        return language ?? ""
    }

    /// 获取接口语言
    //: static var interfaceLang: String {
    static var interfaceLang: String {
        //: let lang = UIDevice.getSystemLangCode()
        let lang = UIDevice.publicTransport()
        //: if ["en", "ar", "es", "pt"].contains(lang) {
        if ["en", "ar", "es", "pt"].contains(lang) {
            //: return lang
            return lang
        }
        //: return "en"
        return "en"
    }

    /// 获取当前系统地区
    //: static var countryCode: String {
    static var countryCode: String {
        //: let locale = Locale.current
        let locale = Locale.current
        //: let countryCode = locale.regionCode
        let countryCode = locale.regionCode
        //: return countryCode ?? ""
        return countryCode ?? ""
    }

    /// 获取系统UUID（每次调用都会产生新值，所以需要keychain）
    //: static var systemUUID: String {
    static var systemUUID: String {
        //: let key = KeychainSwift()
        let key = KeychainSwift()
        //: if let value = key.get(AdjustKey) {
        if let value = key.get(mainExecuteFormat) {
            //: return value
            return value
            //: } else {
        } else {
            //: let value = NSUUID().uuidString
            let value = NSUUID().uuidString
            //: key.set(value, forKey: AdjustKey)
            key.set(value, forKey: mainExecuteFormat)
            //: return value
            return value
        }
    }

    /// 获取已安装应用信息
    //: static var getInstalledApps: String {
    static var getInstalledApps: String {
        //: var appsArr: [String] = []
        var appsArr: [String] = []
        //: if UIDevice.canOpenApp("weixin") {
        if UIDevice.transaction((const_presentationData.replacingOccurrences(of: "event", with: "ix"))) {
            //: appsArr.append("weixin")
            appsArr.append((const_presentationData.replacingOccurrences(of: "event", with: "ix")))
        }
        //: if UIDevice.canOpenApp("wxwork") {
        if UIDevice.transaction((String(app_disabledFormat) + user_toPoorTitle.replacingOccurrences(of: "name", with: "k"))) {
            //: appsArr.append("wxwork")
            appsArr.append((String(app_disabledFormat) + user_toPoorTitle.replacingOccurrences(of: "name", with: "k")))
        }
        //: if UIDevice.canOpenApp("dingtalk") {
        if UIDevice.transaction((dataBarTitle.replacingOccurrences(of: "deadline", with: "a") + String(main_userFormat))) {
            //: appsArr.append("dingtalk")
            appsArr.append((dataBarTitle.replacingOccurrences(of: "deadline", with: "a") + String(main_userFormat)))
        }
        //: if UIDevice.canOpenApp("lark") {
        if UIDevice.transaction((userPageTitle.replacingOccurrences(of: "appear", with: "rk"))) {
            //: appsArr.append("lark")
            appsArr.append((userPageTitle.replacingOccurrences(of: "appear", with: "rk")))
        }
        //: if appsArr.count > 0 {
        if appsArr.count > 0 {
            //: return appsArr.joined(separator: ",")
            return appsArr.joined(separator: ",")
        }
        //: return ""
        return ""
    }

    /// 判断是否安装app
    //: static func canOpenApp(_ scheme: String) -> Bool {
    static func transaction(_ scheme: String) -> Bool {
        //: let url = URL(string: "\(scheme)://")!
        let url = URL(string: "\(scheme)://")!
        //: if UIApplication.shared.canOpenURL(url) {
        if UIApplication.shared.canOpenURL(url) {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 获取系统语言
    /// - Returns: 国际通用语言Code
    //: @objc public class func getSystemLangCode() -> String {
    @objc public class func publicTransport() -> String {
        //: let language = NSLocale.preferredLanguages.first
        let language = NSLocale.preferredLanguages.first
        //: let array = language?.components(separatedBy: "-")
        let array = language?.components(separatedBy: "-")
        //: return array?.first ?? "en"
        return array?.first ?? "en"
    }
}
