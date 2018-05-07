//
//  MyResponse.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/2.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
import ObjectMapper

class MyResponse: Mappable {
    var args : NSDictionary?
    var headers : ResponseHeader?
    var origin : String?
    var url : String?
    
    required init?(map: Map) {
        
    }
    
    //映射字典中的所有键值
    func mapping(map: Map) {
        args <- map["args"]
        headers <- map["headers"]
        origin <- map["origin"]
        url <- map["url"]
    }
}
