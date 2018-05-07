////
////  API.swift
////  SwiftStudy1
////
////  Created by syk on 2018/5/3.
////  Copyright © 2018年 syk. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import HandyJSON
//class API {
//    static var headers: HTTPHeaders {
//        get {
//
//            let os = "iOS"
//            let client = UIDevice.sysNameVersion // 获取系统的版本号，在工具类中
//
//            let result: [String: String] = ["os": os, "client": client]
//
//            return result
//        }
//    }
//}
//
//extension API  {
//
//    /// 将 Alamofire、RxSwift、HandyJSON 结合
//    ///
//    /// 可以通过 RxSwift 的方式通过 Alamofire 获取到数据后使用 HandyJSON 将数据转换成需要的模型
//    ///
//    /// - Parameters:
//    ///   - url: 访问路径
//    ///   - method: 请求方式
//    ///   - uploadData: 请求参数
//    ///   - parameters: 上传数据
//    ///   - returnType: 返回模型的类型
//    /// - Returns: Observable<HandyJSON> onNext 说明请求正确，发送的数据就是需要的数据，onError 说明请求失败，会返回失败原因
//    fileprivate class func request<T: HandyJSON>(_ url: Router, method: HTTPMethod = .post, uploadData: Data? = nil, parameters: Parameters?, returnType: T.Type) -> Observable<T> {
//        return Observable.create({ observer in
//
//            if let uploadData = uploadData {
//                upload(observer: observer, url: url, method: method, uploadData: uploadData, parameters: parameters, returnType: returnType)
//            } else {
//                requestData(observer: observer, url: url, method: method, parameters: parameters, returnType: returnType)
//            }
//
//            return Disposables.create {}
//        })
//    }
//
//    /// Post 请求
//    ///
//    /// - Parameters:
//    ///   - observer: Rx 观察者， 用来向外部传递数据
//    ///   - url: 请求链接
//    ///   - method: 请求方式
//    ///   - parameters: 请求参数
//    ///   - returnType: 返回值类型
//    fileprivate class func requestData<T: HandyJSON>(observer: AnyObserver<T>, url: Router, method: HTTPMethod = .post, parameters: Parameters?, returnType: T.Type) {
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON(completionHandler: { response in
//            switch response.result {
//            case .success:
//                self.successHandle(observer: observer, result: response.result, returnType: returnType)
//                break
//            case .failure(let error):
//                observer.onError(APIError.networkWrong(with: error as NSError))
//                observer.onCompleted()
//                break
//            }
//        })
//    }
//
//    /// 上传图片或其他信息
//    ///
//    /// - Parameters:
//    ///   - observer: Rx 观察者，用来向外部传递数据
//    ///   - url: 请求链接
//    ///   - method: 请求方式
//    ///   - uploadData: 上传数据
//    ///   - parameters: 请求参数
//    ///   - returnType: 返回值类型
//    fileprivate class func upload<T: HandyJSON>(observer: AnyObserver<T>, url: Router, method: HTTPMethod = .post, uploadData: Data, parameters: Parameters?, returnType: T.Type) {
//        Alamofire.upload(multipartFormData: { (data: MultipartFormData) in
//
//            // Parameters
//            if let parameters = parameters {
//                for param in parameters {
//                    let value = (param.value as! String).data(using: .utf8)
//                    data.append(value!, withName: param.key)
//                }
//            }
//
//            // uploadData
//            data.append(uploadData, withName: "attachment", fileName: "attachment.jpg", mimeType: "image/jpg")
//
//        },
//                         to: url,
//                         method: .post,
//                         headers: headers,
//                         encodingCompletion: { (result: SessionManager.MultipartFormDataEncodingResult) in
//                            switch result {
//                            case .success(let upload, _, _):
//                                upload.responseJSON(completionHandler: { (response: DataResponse<Any>) in
//                                    self.successHandle(observer: observer, result: response.result, returnType: returnType)
//                                })
//                                break
//
//                            case .failure(let encodingError):
//                                self.failHandle(observer: observer, error: encodingError)
//                                break
//                            }
//        })
//    }
//
//}
//
///// MARK: - Result Handler
/////
///// 请求结果的处理，在这里只是第一步，首先确认的就是数据是否符合要求：
///// 1. 是否不为空
///// 2. 是否是 JSON
///// 3. 是否可以转化为我们自定义的 Model
/////
/////  而这个 Model 中的数据错误，将在另外一个方法中进行甄别
//extension API {
//
//    /// 请求成功的处理
//    ///
//    /// - Parameters:
//    ///   - observer: Rx 观察者，给外部传递数据
//    ///   - result: 请求结果
//    ///   - returnType: 返回值的类型
//    fileprivate class func successHandle<T: HandyJSON>(observer: AnyObserver<T>, result: Result<Any>, returnType: T.Type) {
//        // 服务器返回数据残缺
//        guard let JSON = result.value,
//            let jsonDic = JSON as? Dictionary<String, AnyObject> else {
//                observer.onError(APIError.dataJSON(wrong: "Server Data is not JSON!"))
//                observer.onCompleted()
//                return
//        }
//
//        //
//        guard let responseModel = returnType.deserialize(from: NSDictionary(dictionary: jsonDic)) else {
//            // 数据解析错误
//            observer.onError(APIError.datamatch(wrong: "Data match wrong!"))
//            observer.onCompleted()
//            return
//        }
//
//        // 数据解析成功
//        observer.onNext(responseModel)
//        observer.onCompleted()
//    }
//
//    /// 请求失败的处理
//    ///
//    /// - Parameters:
//    ///   - observer: Rx 观察者 ，给外部传递数据
//    ///   - error: 返回值的类型
//    fileprivate class func failHandle<T: HandyJSON>(observer: AnyObserver<T>, error: Error) {
//        observer.onError(APIError.networkWrong(with: error as NSError))
//        observer.onCompleted()
//    }
//}

