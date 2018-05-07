//
//  Common.swift
//  SwiftStudy1
//
//  Created by syk on 2018/5/3.
//  Copyright © 2018年 syk. All rights reserved.
//

import UIKit

// 快速使用全项目都将要用到的弹簧动画
func bounceAnimation(withDuration duration: TimeInterval = 0.5,
                     delay: TimeInterval = 0,
                     usingSpringWithDamping dampingRatio: CGFloat = 0.65,
                     initialSpringVelocity velocity: CGFloat = 0,
                     options: UIViewAnimationOptions = .curveEaseInOut,
                     animations: @escaping () -> Swift.Void,
                     completion: ((Bool) -> Swift.Void)? = nil) {
    UIView.animate(withDuration: duration,
                   delay: delay,
                   usingSpringWithDamping: dampingRatio,
                   initialSpringVelocity: velocity,
                   options: options,
                   animations: {
                    animations()
    }, completion: completion)
}

// 快速使用全项目都将要用到的普通动画
func viewAnimation(withDuration duration: TimeInterval = 0.3,
                   animations: @escaping () -> Swift.Void,
                   completion: ((Bool) -> Swift.Void)? = nil) {
    UIView.animate(withDuration: duration,
                   animations: {
                    animations()
    }, completion: completion)
}

// MARK: - UIDevice Extension
extension UIDevice {
    static let isLandScape = (UIDevice.current.orientation == .landscapeLeft ||  UIDevice.current.orientation == .landscapeRight)
    
    static let isiPad = (UIDevice.current.userInterfaceIdiom == .pad)
    static let isiPhone = (UIDevice.current.userInterfaceIdiom == .phone)
    
    static let isiPhone4 = ((UIDevice.isiPhone) && (UIScreen.height < 568.0))
    static let isiPhone5 = ((UIDevice.isiPhone) && (UIScreen.height == 568.0))
    static let isiPhone6 = ((UIDevice.isiPhone) && (UIScreen.height == 667.0))
    static let isiPhone6p = ((UIDevice.isiPhone) && (UIScreen.height == 736.0))
    static let isiPhoneX = ((UIDevice.isiPhone) && (UIScreen.height == 812.0))
    
    static let isiOS8AndLater = (Float(UIDevice.current.systemVersion)! >= Float(8.0))
    static let isiOS8Family = (Float(UIDevice.current.systemVersion)! >= Float(8.0)) && (Float(UIDevice.current.systemVersion)! < Float(9.0))
    static let isiOS9Family = (Float(UIDevice.current.systemVersion)! >= Float(9.0)) && (Float(UIDevice.current.systemVersion)! < Float(10.0))
    static let isiOS10Family = (Float(UIDevice.current.systemVersion)! >= Float(10.0)) && (Float(UIDevice.current.systemVersion)! < Float(11.0))
    
    static var sysNameVersion: String {
        get {
            return UIDevice.current.systemName + " " + UIDevice.current.systemVersion
        }
    }
}

// MARK: - UIScreen Extension
extension UIScreen {
    // 屏幕宽度
    static let width = UIScreen.main.bounds.size.width
    // 屏幕高度
    static let height = UIScreen.main.bounds.size.height
    
}

/// 状态栏高度
var statusBarHeight: CGFloat {
    get {
        return UIDevice.isiPhoneX ? 44 : 20
    }
}

/// 导航栏高度
var navigationBarHeight: CGFloat {
    get {
        return 44;
    }
}

/// tabbar 的内容高度
var tabBarContentHeight: CGFloat = 49

/// tabbar 的高度
var tabBarHeight: CGFloat {
    get {
        return tabBarContentHeight + bottomBarBottomHeight
    }
}

/// toolbar 的内容高度
var toolbarContentHeight: CGFloat = 49

/// toolbar 的高度
var toolBarHeight: CGFloat {
    get {
        return toolbarContentHeight + bottomBarBottomHeight
    }
}

/// toolbar/tabbar 底部的高度
/// 如果是 iPhoneX 那么这个高度就是 34 否则为 0
var bottomBarBottomHeight: CGFloat {
    get {
        return UIDevice.isiPhoneX ? 34 : 0
    }
}

// MARK: - Alert
//func alert(title: String = "", message: String = "", confirmTitle: String = "", cancelTitle: String = "", confirm: @escaping () -> (), cancel:  (() -> ())? = nil) {
//    let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
//
//    if confirmTitle.count > 0 {
//        alert.addAction(UIAlertAction.init(title: confirmTitle, style: .default, handler: { (action: UIAlertAction) in
//            confirm()
//        }))
//    }
//
//    if cancelTitle.count > 0 {
//        alert.addAction(UIAlertAction.init(title: cancelTitle, style: .default, handler: { (action: UIAlertAction) in
//            if let cancel = cancel {
//                cancel()
//            }
//        }))
//    }
//
//    centerViewController?.present(alert, animated: true, completion: nil)
//}

