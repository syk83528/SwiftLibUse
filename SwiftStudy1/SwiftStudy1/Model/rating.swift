//
//  rating.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/2.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
import ObjectMapper

class rating: Mappable {
    var max : Int?
    var numRaters : Int?
    var average : String?
    var min : Int?
    
    required init?(map: Map) {
        
    }
    
    //映射字典中的所有键值
    func mapping(map: Map) {
        max <- map["max"]
        numRaters <- map["numRaters"]
        average <- map["average"]
        min <- map["min"]
    }
}
