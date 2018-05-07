//
//  Router.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/3.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
import Alamofire
/// 请求路由
enum Router: String, URLConvertible {
    
    /// 登录
    case login = "Account/login"
    /// 注册
    case register = "Account/register"
    /// 其他
    
    /// 域名
    static var baseURL: String {
        get {
//            if Cache.isTestEnvironment {
                // 测试环境
                return "http://test/api.com/"
//            } else {
//                // 正式环境
//                return "https://api.xxxxx.com/Api/"
//            }
        }
    }
    
    var appendURL: String {
        get {
            return rawValue
        }
    }
    
    func asURL() throws -> URL {
        let nowTimeInterval = Int64(NSDate().timeIntervalSince1970)
        let urlString = Router.baseURL.appending(appendURL) + "?t=\(nowTimeInterval)"
        
        return URL(string: urlString)!
    }
}
