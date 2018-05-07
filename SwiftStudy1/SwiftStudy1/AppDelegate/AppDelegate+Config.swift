//
//  AppDelegate+Config.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/3.
//  Copyright © 2018年 syk. All rights reserved.
//

import UIKit


// MARK: - 存放一些稍微繁琐的配置
extension AppDelegate {
    func setupRootController() -> UIViewController {
        let tabarController = BaseTabBarController()
        
        let homeVC = HomeController()
        let homeNaviVC = BaseNavigationController(rootViewController: homeVC)
        let userVC = UserController()
        let userNaviVC = BaseNavigationController(rootViewController: userVC)
        
        tabarController.viewControllers = [homeNaviVC,userNaviVC]
        
        return tabarController
        //self.window!.backgroundColor = UIColor.whiteColor()
    }
}

