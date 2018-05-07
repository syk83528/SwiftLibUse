////
////  UserResp.swift
////  SwiftStudy1
////
////  Created by syk on 2018/5/3.
////  Copyright © 2018年 syk. All rights reserved.
////
//
//import UIKit
//import HandyJSON
//class UserResp: BaseResp {
//    var user: User?
//
//    override func mapping(mapper: HelpingMapper) {
//        super.mapping(mapper: mapper)
//
//        mapper <<<
//            self.user <-- "prData"
//    }
//
//}
//
//// 而作为我们真正使用的 User 类，它是没有 Base 的数据的，所以不用继承
//class User: HandyJSON {
//
//    var email: String?
//
//    var userName: String?
//
//    var userToken: String?
//
//    required init() { }
//
//    func mapping(mapper: HelpingMapper) {
//        mapper <<<
//            [
//                self.email              <-- "mail",
//                self.userName           <-- "userName",
//                self.userToken          <-- "utoken"
//        ]
//    }
//
//}

