//
//  APIError.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/3.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
enum APIError: Error {
    /*
     请求出错，服务器会返回对应的描述文字
     */
    case error(wrong: String)
    /*
     服务器返回的数据不是 JSON
     */
    case dataJSON(wrong: String)
    /*
     服务器返回的数据为空
     */
    case dataEmpty(wrong: String)
    /*
     服务器返回的数据不能解析
     */
    case datamatch(wrong: String)
    /*
     网络请求错误
     */
    case network(wrong: String)
    
    /*
     使用 NSError 创建网络请求错误
     */
    static func networkWrong(with error: NSError) -> APIError {
        if let errorMessage = error.userInfo["NSLocalizedDescription"] as? String {
            return APIError.network(wrong: errorMessage)
        }
        
        if error.domain == "Alamofire.AFError" {
            // 处理 Alamofire 返回的错误
            if error.code == 4 {
                return APIError.dataEmpty(wrong: "Server return data is nil or zero length.")
            }
        }
        
        return APIError.network(wrong: "Unknown Network Wrong.")
    }
}

// 这里写了一个 Extension 用来做错误的提示
// 注意这里会有重复代码，但是为了给错误做区分，还是使用了这种方式
// 这里可以考虑将 APIError 写成一个 Class，然后添加一个 ErrorType 的枚举，可能代码会少一点，但是在使用的时候其实还是一样的
// 当然，如果不考虑错误类型，那就不需要 ErrorType ，直接一个错误描述就可以。
extension APIError {
    func showHUD() {
        switch self {
        case .error(let wrong):
//            HUD.showError(with: wrong)
            break
        case .dataEmpty(let wrong):
//            HUD.showError(with: wrong)
            break
        case .dataJSON(let wrong):
//            HUD.showError(with: wrong)
            break
        case .datamatch(let wrong):
//            HUD.showError(with: wrong)
            break
        case .network(let wrong):
//            HUD.showError(with: wrong)
            break
        }
    }
}
