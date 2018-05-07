//
//  AppDelegate+Push.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/3.
//  Copyright © 2018年 syk. All rights reserved.
//

import UIKit

// MARK: - 存放推送配置或者方法等
extension AppDelegate {
    
//    可以把push那一推的方法丢到这里来,来执行即可
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}
