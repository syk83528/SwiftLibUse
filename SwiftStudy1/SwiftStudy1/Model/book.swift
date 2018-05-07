//
//  book.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/2.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
import ObjectMapper

class book: Mappable {
    var rating : rating?
    var subtitle : String?
    var author : [String]?
    var pubdate : String?
    
    required init?(map: Map) {
        
    }
    
    //映射字典中的所有键值
    func mapping(map: Map) {
        rating <- map["rating.value"]
        subtitle <- map["subtitle"]
        author <- map["author"]
        pubdate <- map["pubdate"]
    }
}
