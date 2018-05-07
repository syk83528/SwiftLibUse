//
//  RequestTool.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/4.
//  Copyright © 2018年 syk. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RequestTool {
    
    static func get(url:String) {
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<BaseResp<ResponseHeader>>) in
            let myResponse = response.result.value
//            print(myResponse?.books)
//            if let books = myResponse?.books{
//                self.dataArray = books;
//                self.tableView?.reloadData();
//            }
        }
    }
}
