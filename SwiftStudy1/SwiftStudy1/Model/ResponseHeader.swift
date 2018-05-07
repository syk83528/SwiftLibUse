//
//  ResponseHeader.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/2.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseHeader: Mappable {
    
    var accept : String?
    var acceptEncoding : String?
    var acceptLanguage : String?
    var cacheControl : String?
    var host : String?
    var userAgent : String?
    
    required init?(map: Map) {
        
    }
    
    //映射heades字典中的所有键值
    func mapping(map: Map) {
        accept <- map["Accept"]
        acceptEncoding <- map["Accept-Encoding"]
        acceptLanguage <- map["Accept-Language"]
        cacheControl <- map["Cache-Control"]
        host <- map["Host"]
        userAgent <- map["User-Agent"]
    }
}
