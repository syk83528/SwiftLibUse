
import Foundation
import ObjectMapper

/// 服务器规定，接口调用成功为 200，其他数字则为失败
///
/// - success: 请求成功
/// - fail: 未定义的请求失败
/// - logout: 强制登出
enum ResponseCode: Int {
    case success = 200
    case fail = -1
    case logout = 10504
}

/// response 最外层的数据，内层模型不需要继承 base
class BaseResp<T>: Mappable {
    
    var args : NSDictionary?
    var headers : T?
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
