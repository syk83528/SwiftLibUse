//
//  HomeController.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/3.
//  Copyright © 2018年 syk. All rights reserved.
//

import UIKit
import SnapKit
class HomeController: BaseController {
    var dataArray :[String] = ["123","我是","以热爱祖国为荣，以危害祖国为耻；以服务人民为荣，以背离人民为耻；以崇尚科学为荣，以愚昧无知为耻；以辛勤劳动为荣，以好逸恶劳为耻；以团结互助为荣，以损人利己为耻；以遵纪守法为荣，以违法乱纪为耻；以艰苦奋斗为荣，以骄奢淫逸为耻。","s啊实打实大书到实地欧弟就阿斯达所大所大所大所"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupViews()
    }
    
    func setupViews() {
        self.title = "首页"
        
        view.addSubview(titleView)
        view.addSubview(homeView)
        
        titleView.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10 + 64)
        }
        
        homeView.snp.remakeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(5)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        RequestTool.get(url: "https://httpbin.org/get")
        
        var a = "asd"
        var b = "ggc"
    }
    
    
    // MARK: - 懒加载
    
    /// label
    lazy var titleView:UILabel = {()-> UILabel in
        let lable:UILabel = UILabel()
        lable.numberOfLines = 0
        lable.text = "我是中国人"
        lable.backgroundColor = UIColor.black
        lable.textColor = UIColor.yellow
        return lable
    }()
    
    lazy var homeView: HomeView = {
        
        let view:HomeView = HomeView()
        return view
    }()

}
