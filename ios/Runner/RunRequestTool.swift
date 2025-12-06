
//: Declare String Begin

/*: "Net Error, Try again later" :*/
fileprivate let noti_revenuePath:String = "log guard version methodNet Er"
fileprivate let mainDisappearData:String = "domain manager image minimum importy "
fileprivate let k_accessValue:String = "afterai"

/*: "data" :*/
fileprivate let k_cornerContent:[Character] = ["d","a","t","a"]

/*: ":null" :*/
fileprivate let k_eventUrl:String = ":nulldrop feedback"

/*: "json error" :*/
fileprivate let kProductionData:String = "jconsumeron"

/*: "platform=iphone&version= :*/
fileprivate let mainEndStr:[Character] = ["p","l","a","t","f","o","r","m","=","i","p","h","o","n","e","&","v","e","r","s","i","o","n","="]

/*: &packageId= :*/
fileprivate let app_hideFormat:String = "&packagesuper load filter safe"
fileprivate let data_tagNeedText:[Character] = ["I","d","="]

/*: &bundleId= :*/
fileprivate let notiShowText:String = "&bundformat pad prompt"
fileprivate let userSourceMsg:[Character] = ["l","e","I","d","="]

/*: &lang= :*/
fileprivate let appLargeNetText:String = "foundation please same&lang="

/*: ; build: :*/
fileprivate let mainDropPath:String = "global"
fileprivate let showDateMessage:[Character] = [" ","b","u","i","l","d",":"]

/*: ; iOS  :*/
fileprivate let noti_activeMsg:String = "; iOS empty photo"

//: Declare String End

//: import Alamofire
import Alamofire
//: import CoreMedia
import CoreMedia
//: import HandyJSON
import HandyJSON
// __DEBUG__
// __CLOSE_PRINT__
//: import UIKit
import UIKit

//: typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: AppErrorResponse?) -> Void
typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: ExcludeErrorResponse?) -> Void

//: @objc class AppRequestTool: NSObject {
@objc class RunRequestTool: NSObject {
    /// 发起Post请求
    /// - Parameters:
    ///   - model: 请求参数
    ///   - completion: 回调
    //: class func startPostRequest(model: AppRequestModel, completion: @escaping FinishBlock) {
    class func consumer(model: RequestModel, completion: @escaping FinishBlock) {
        //: let serverUrl = self.buildServerUrl(model: model)
        let serverUrl = self.enablece(model: model)
        //: let headers = self.getRequestHeader(model: model)
        let headers = self.currency(model: model)
        //: AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
        AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
            //: switch responseData.result {
            switch responseData.result {
            //: case .success:
            case .success:
                //: func__requestSucess(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)
                funcCompletion(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)

            //: case .failure:
            case .failure:
                //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "Net Error, Try again later"))
                completion(false, nil, ExcludeErrorResponse(errorCode: BridgeSignedTotal.NetError.rawValue, errorMsg: (String(noti_revenuePath.suffix(6)) + "ror, Tr" + String(mainDisappearData.suffix(2)) + k_accessValue.replacingOccurrences(of: "after", with: "ag") + "n later")))
            }
        }
    }

    //: class func func__requestSucess(model: AppRequestModel, response: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
    class func funcCompletion(model _: RequestModel, response _: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
        //: var responseJson = String(data: responseData, encoding: .utf8)
        var responseJson = String(data: responseData, encoding: .utf8)
        //: responseJson = responseJson?.replacingOccurrences(of: "\"data\":null", with: "\"data\":{}")
        responseJson = responseJson?.replacingOccurrences(of: "\"" + (String(k_cornerContent)) + "\"" + (String(k_eventUrl.prefix(5))), with: "" + "\"" + (String(k_cornerContent)) + "\"" + ":{}")
        //: if let responseModel = JSONDeserializer<AppBaseResponse>.deserializeFrom(json: responseJson) {
        if let responseModel = JSONDeserializer<BigModelType>.deserializeFrom(json: responseJson) {
            //: if responseModel.errno == RequestResultCode.Normal.rawValue {
            if responseModel.errno == BridgeSignedTotal.Normal.rawValue {
                //: completion(true, responseModel.data, nil)
                completion(true, responseModel.data, nil)
                //: } else {
            } else {
                //: completion(false, responseModel.data, AppErrorResponse.init(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                completion(false, responseModel.data, ExcludeErrorResponse(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                //: switch responseModel.errno {
                switch responseModel.errno {
//                case BridgeSignedTotal.NeedReLogin.rawValue:
//                    NotificationCenter.default.post(name: DID_LOGIN_OUT_SUCCESS_NOTIFICATION, object: nil, userInfo: nil)
                //: default:
                default:
                    //: break
                    break
                }
            }
            //: } else {
        } else {
            //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "json error"))
            completion(false, nil, ExcludeErrorResponse(errorCode: BridgeSignedTotal.NetError.rawValue, errorMsg: (kProductionData.replacingOccurrences(of: "consumer", with: "s") + " error")))
        }
    }

    //: class func buildServerUrl(model: AppRequestModel) -> String {
    class func enablece(model: RequestModel) -> String {
        //: var serverUrl: String = model.requestServer
        var serverUrl: String = model.requestServer
        //: let otherParams = "platform=iphone&version=\(AppNetVersion)&packageId=\(PackageID)&bundleId=\(AppBundle)&lang=\(UIDevice.interfaceLang)"
        let otherParams = (String(mainEndStr)) + "\(k_storageName)" + (String(app_hideFormat.prefix(8)) + String(data_tagNeedText)) + "\(const_viewName)" + (String(notiShowText.prefix(5)) + String(userSourceMsg)) + "\(dataAppFormat)" + (String(appLargeNetText.suffix(6))) + "\(UIDevice.interfaceLang)"
        //: if !model.requestPath.isEmpty {
        if !model.requestPath.isEmpty {
            //: serverUrl.append("/\(model.requestPath)")
            serverUrl.append("/\(model.requestPath)")
        }
        //: serverUrl.append("?\(otherParams)")
        serverUrl.append("?\(otherParams)")

        //: return serverUrl
        return serverUrl
    }

    /// 获取请求头参数
    /// - Parameter model: 请求模型
    /// - Returns: 请求头参数
    //: class func getRequestHeader(model: AppRequestModel) -> HTTPHeaders {
    class func currency(model _: RequestModel) -> HTTPHeaders {
        //: let userAgent = "\(AppName)/\(AppVersion) (\(AppBundle); build:\(AppBuildNumber); iOS \(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        let userAgent = "\(constComplianceStr)/\(kTailName) (\(dataAppFormat)" + (mainDropPath.replacingOccurrences(of: "global", with: ";") + String(showDateMessage)) + "\(constWhenTitle)" + (String(noti_activeMsg.prefix(6))) + "\(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        //: let headers = [HTTPHeader.userAgent(userAgent)]
        let headers = [HTTPHeader.userAgent(userAgent)]
        //: return HTTPHeaders(headers)
        return HTTPHeaders(headers)
    }
}
