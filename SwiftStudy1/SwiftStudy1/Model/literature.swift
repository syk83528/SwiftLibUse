//
//  literature.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/2.
//  Copyright © 2018年 syk. All rights reserved.
//
import Foundation
import ObjectMapper

class literature: Mappable {
    var count : Int?
    var start : Int?
    var total : rating?
    var books : [book]?
    
    required init?(map: Map) {
        
    }
    
    //映射字典中的所有键值
    func mapping(map: Map) {
        count <- map["count"]
        start <- map["start"]
        total <- map["total"]
        books <- map["books"]
    }
}
