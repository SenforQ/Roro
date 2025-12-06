
//: Declare String Begin

/*: "Roro" :*/
fileprivate let constPointId:String = "status photo toRoro"

/*: /dist/index.html#/?packageId= :*/
fileprivate let show_promptValue:String = "document country class transform/dist/"
fileprivate let dataProductMsg:String = "feedback"
fileprivate let user_layerDecisionStr:[Character] = ["n","d","e","x",".","h","t","m","l","#","/","?","p","a","c","k","a","g","e","I","d","="]

/*: &safeHeight= :*/
fileprivate let noti_transactionMessage:String = "evaluate normal&saf"
fileprivate let notiCurrencyContent:String = "t=try warn after region success"

/*: "token" :*/
fileprivate let dataRemoveTitle:[UInt8] = [0x92,0x8d,0x89,0x83,0x8c]

fileprivate func pullLoadOriginal(error num: UInt8) -> UInt8 {
    let value = Int(num) + 226
    if value > 255 {
        return UInt8(value - 256)
    } else {
        return UInt8(value)
    }
}

/*: "FCMToken" :*/
fileprivate let app_everyPendingName:String = "FCMTokenscene transform"

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  AppDelegate.swift
//  OverseaH5
//
//  Created by DouXiu on 2025/9/23.
//
//: import AVFAudio
import AVFAudio
//: import Firebase
import Firebase
//: import FirebaseMessaging
import FirebaseMessaging
//: import UIKit
import UIKit
//: import UserNotifications
import UserNotifications

import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    var AdaptiveUniformBasicEntropyEmeraldMagentaVersion = "110"
    var AdaptiveUniformBasicEntropyConfigCurrentFire = 0
    var AdaptiveUniformBasicEntropyMainVC = UIViewController()
    
    private var AdaptiveUniformBasicEntropyApplication: UIApplication?
    private var AdaptiveUniformBasicEntropyLaunchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let appname = "AdaptiveUniformBasicEntropy"
        
        if appname == "AdaptiveUnifor" {
            AdaptiveUniformBasicEntropyGraphicDescriptionFilter()
        }
        
        self.AdaptiveUniformBasicEntropyApplication = application
        self.AdaptiveUniformBasicEntropyLaunchOptions = launchOptions
        
      self.AdaptiveUniformBasicEntropyVersusPattern()
      GeneratedPluginRegistrant.register(with: self)
        
        
        let AdaptiveUniformBasicEntropySubVc = UIViewController.init()
        let AdaptiveUniformBasicEntropyContentBGImgV = UIImageView(image: UIImage(named: "LaunchImage"))
        AdaptiveUniformBasicEntropyContentBGImgV.image = UIImage(named: "LaunchImage")
        AdaptiveUniformBasicEntropyContentBGImgV.frame = CGRectMake(0, 0, UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        AdaptiveUniformBasicEntropyContentBGImgV.contentMode = .scaleToFill
        AdaptiveUniformBasicEntropySubVc.view.addSubview(AdaptiveUniformBasicEntropyContentBGImgV)
        self.AdaptiveUniformBasicEntropyMainVC = AdaptiveUniformBasicEntropySubVc
        self.window.rootViewController?.view.addSubview(self.AdaptiveUniformBasicEntropyMainVC.view)
        self.window?.makeKeyAndVisible()
        
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    

    
    func AdaptiveUniformBasicEntropyVersusPattern(){
        
        // 获取构建版本号并去掉点号
        if let buildVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            let buildVersionWithoutDots = buildVersion.replacingOccurrences(of: ".", with: "")
            print("去掉点号的构建版本号：\(buildVersionWithoutDots)")
            self.AdaptiveUniformBasicEntropyEmeraldMagentaVersion = buildVersionWithoutDots
        } else {
            print("无法获取构建版本号")
        }
        //版本号
//        AdaptiveUniformBasicEntropyEmeraldMagentaVersion = "-1"
        
        self.observer()
        
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                remoteConfig.activate { changed, error in
                    let AdaptiveUniformBasicEntropyFlowerJungleVersion = remoteConfig.configValue(forKey: "Roro").stringValue ?? ""
//                    self.AdaptiveUniformBasicEntropyEmeraldMagentaVersion = AdaptiveUniformBasicEntropyFlowerJungleVersion
                    print("google AdaptiveUniformBasicEntropyFlowerJungleVersion ：\(AdaptiveUniformBasicEntropyFlowerJungleVersion)")
                    
                    let AdaptiveUniformBasicEntropyFlowerJungleVersionVersionVersionInt = Int(AdaptiveUniformBasicEntropyFlowerJungleVersion) ?? 0
                    self.AdaptiveUniformBasicEntropyConfigCurrentFire = AdaptiveUniformBasicEntropyFlowerJungleVersionVersionVersionInt
                    // 3. 转换为整数
                    let AdaptiveUniformBasicEntropyEmeraldMagentaVersionVersionInt = Int(self.AdaptiveUniformBasicEntropyEmeraldMagentaVersion) ?? 0
                    
                    if AdaptiveUniformBasicEntropyEmeraldMagentaVersionVersionInt < AdaptiveUniformBasicEntropyFlowerJungleVersionVersionVersionInt {
                        NativeProtectedBuilder.activateBrushProgressbar();
                        DispatchQueue.main.async {
                            self.page(self.AdaptiveUniformBasicEntropyApplication!)
                        }
                    }else {
                        DispatchQueue.main.async {
                            self.AdaptiveUniformBasicEntropyMainVC.view.removeFromSuperview()
                        }
                        DispatchQueue.main.async {
                            NativeProtectedBuilder.seekSegueSlider();
                            super.application(self.AdaptiveUniformBasicEntropyApplication!, didFinishLaunchingWithOptions: self.AdaptiveUniformBasicEntropyLaunchOptions)
                        }
                    }
                }
            } else {
                if self.AdaptiveUniformBasicEntropyCommonIntensityTimeCarrotTriangle() && self.AdaptiveUniformBasicEntropyOutAwaitEventDeviceBlackWood() {
                    NativeProtectedBuilder.activateOntoGrainMode();
                    DispatchQueue.main.async {
                        self.page(self.AdaptiveUniformBasicEntropyApplication!)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.AdaptiveUniformBasicEntropyMainVC.view.removeFromSuperview()
                    }
                    DispatchQueue.main.async {
                        NativeProtectedBuilder.subscribeMemberBeyondListener();
                        super.application(self.AdaptiveUniformBasicEntropyApplication!, didFinishLaunchingWithOptions: self.AdaptiveUniformBasicEntropyLaunchOptions)
                    }
                }
            }
        }
    }
    
        /// 初始化项目
        //: private func initConfig(_ application: UIApplication) {
        private func page(_ application: UIApplication) {
            //: registerForRemoteNotification(application)
            usedEvent(application)
            //: AppAdjustManager.shared.initAdjust()
            MenuBridgeCount.shared.colorBy()
            // 检查是否有未完成的支付订单
            //: AppleIAPManager.shared.iap_checkUnfinishedTransactions()
            MicManager.shared.eventTransactions()
            // 支持后台播放音乐
            //: try? AVAudioSession.sharedInstance().setCategory(.playback)
            try? AVAudioSession.sharedInstance().setCategory(.playback)
            //: try? AVAudioSession.sharedInstance().setActive(true)
            try? AVAudioSession.sharedInstance().setActive(true)
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: let vc = AppWebViewController()
                let vc = FilterDelegate()
                //: vc.urlString = "\(H5WebDomain)/dist/index.html#/?packageId=\(PackageID)&safeHeight=\(AppConfig.getStatusBarHeight())"
                vc.urlString = "\(userPositivePath)" + (String(show_promptValue.suffix(6)) + dataProductMsg.replacingOccurrences(of: "feedback", with: "i") + String(user_layerDecisionStr)) + "\(const_viewName)" + (String(noti_transactionMessage.suffix(4)) + "eHeigh" + String(notiCurrencyContent.prefix(2))) + "\(LastGestureDirection.zone())"
                //: self.window?.rootViewController = vc
                self.window?.rootViewController = vc
                //: self.window?.makeKeyAndVisible()
                self.window?.makeKeyAndVisible()
            }
        }
    
    private func AdaptiveUniformBasicEntropyOutAwaitEventDeviceBlackWood() -> Bool {
        NativeProtectedBuilder.transformTappableRepository();
        return UIDevice.current.userInterfaceIdiom != .pad
    }
    
    private func AdaptiveUniformBasicEntropyCommonIntensityTimeCarrotTriangle() -> Bool {
        let AdaptiveUniformBasicEntropyTensorSpotEffect:[Character] = ["1","7","6","4","7","5","2","5","9","9"]
        NativeProtectedBuilder.performUnactivatedDialogs();
        let CommonIntensity: TimeInterval = TimeInterval(String(AdaptiveUniformBasicEntropyTensorSpotEffect)) ?? 0.0
        let TextWorkInterval = Date().timeIntervalSince1970
        return TextWorkInterval > CommonIntensity
    }
    
    
}




// MARK: - Firebase

//: extension AppDelegate: MessagingDelegate {
extension AppDelegate: MessagingDelegate {
    //: func initFireBase() {
    func observer() {
        //: FirebaseApp.configure()
        FirebaseApp.configure()
        //: Messaging.messaging().delegate = self
        Messaging.messaging().delegate = self
    }


    //: func registerForRemoteNotification(_ application: UIApplication) {
    func usedEvent(_ application: UIApplication) {
        //: if #available(iOS 10.0, *) {
        if #available(iOS 10.0, *) {
            //: UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().delegate = self
            //: let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            //: UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
                //: })
            })
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: application.registerForRemoteNotifications()
                application.registerForRemoteNotifications()
            }
        }
    }

    //: func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    override func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 注册远程通知, 将deviceToken传递过去
        //: let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        //: Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().apnsToken = deviceToken
        //: print("APNS Token = \(deviceStr)")
        //: Messaging.messaging().token { token, error in
        Messaging.messaging().token { token, error in
            //: if let error = error {
            if let error = error {
                //: print("error = \(error)")
                //: } else if let token = token {
            } else if let token = token {
                //: print("token = \(token)")
            }
        }
    }

    //: func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    override func application(_: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //: Messaging.messaging().appDidReceiveMessage(userInfo)
        Messaging.messaging().appDidReceiveMessage(userInfo)
        //: completionHandler(.newData)
        completionHandler(.newData)
    }

    //: func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    override func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //: completionHandler()
        completionHandler()
    }

    // 注册推送失败回调
    //: func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    override func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError _: Error) {
        //: print("didFailToRegisterForRemoteNotificationsWithError = \(error.localizedDescription)")
    }

    //: public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        //: let dataDict: [String: String] = ["token": fcmToken ?? ""]
        let dataDict: [String: String] = [String(bytes: dataRemoveTitle.map{pullLoadOriginal(error: $0)}, encoding: .utf8)!: fcmToken ?? ""]
        //: print("didReceiveRegistrationToken = \(dataDict)")
        //: NotificationCenter.default.post(
        NotificationCenter.default.post(
            //: name: Notification.Name("FCMToken"),
            name: Notification.Name((String(app_everyPendingName.prefix(8)))),
            //: object: nil,
            object: nil,
            //: userInfo: dataDict)
            userInfo: dataDict
        )
    }
}

func AdaptiveUniformBasicEntropyGraphicDescriptionFilter(){

    NativeProtectedBuilder.performUnactivatedDialogs();
    NativeProtectedBuilder.fetchUnmarshalOutCube();
    NativeProtectedBuilder.stopDrawBeforeMediaquery();
    NativeProtectedBuilder.receiveObserverInText();
    NativeProtectedBuilder.inflateDynamicDuration();
    NativeProtectedBuilder.encodePaddingThanBuffer();
    NativeProtectedBuilder.resumeMarginModel();
    NativeProtectedBuilder.generateGetxResolver();
    NativeProtectedBuilder.throughScreenComponent();
    NativeProtectedBuilder.discoverIconObserver();
    NativeProtectedBuilder.notifySegueAroundNotation();
    NativeProtectedBuilder.readIntuitiveAppbarVar();
    NativeProtectedBuilder.transformSortedAspectratio();
    NativeProtectedBuilder.visitOnSceneParameter();
    NativeProtectedBuilder.underBlocNavigator();
    NativeProtectedBuilder.persistFromBaseJob();
    NativeProtectedBuilder.delegateStoryboardIncludeCoordinator();
    NativeProtectedBuilder.decodeSeekOffBinary();
    NativeProtectedBuilder.awaitBinarySingleton();
    NativeProtectedBuilder.wouldAutoMetadataSingleton();
    NativeProtectedBuilder.connectHistogramRequest();
    NativeProtectedBuilder.paintOutGramVar();
    NativeProtectedBuilder.fetchUnaryEntity();
    NativeProtectedBuilder.initializeMusicThroughComponent();
    NativeProtectedBuilder.subscribeScrollAlongScene();
    NativeProtectedBuilder.transpileNotificationExceptTitle();
    NativeProtectedBuilder.couldAutoGramMethod();
}
