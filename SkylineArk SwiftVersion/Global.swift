//
//  Global.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/10/12.
//

import UIKit
import Alamofire

let WIN_WIDTH:CGFloat = UIScreen.main.bounds.size.width
let WIN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height

//func AFNETWORK_REQUSET() -> AFHTTPSessionManager{
//    let manager:AFHTTPSessionManager = DDAFHttpSessionManager.share() as! AFHTTPSessionManager
//    manager.responseSerializer.acceptableContentTypes?.insert("text/json")
//    manager.responseSerializer.acceptableContentTypes?.insert("text/html")
//    manager.responseSerializer.acceptableContentTypes?.insert("application/json")
//    manager.responseSerializer.acceptableContentTypes?.insert("text/javascript")
//    manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
//    manager.responseSerializer.acceptableContentTypes?.insert("text/xml")
//    manager.responseSerializer.acceptableContentTypes?.insert("image/*")
//
////    manager.requestSerializer=AFHTTPRequestSerializer.serializer
//    manager.requestSerializer.timeoutInterval = 30.0
//
//    return manager;
//}

func IS_IPHONE_X() -> Bool {
    var isBangsScreen:Bool = false
    if #available(iOS 11.0, *){
        let window = UIApplication.shared.windows[0]
        isBangsScreen = window.safeAreaInsets.bottom > 0;
    }
    
    return isBangsScreen
}

private func GetHeight_StatusBar() -> CGFloat{
    if IS_IPHONE_X() == true{
        return 44.0
    }
    else{
        return 20.0
    }
}
let Height_StatusBar:CGFloat = GetHeight_StatusBar()

private func GetHeight_Indicator() -> CGFloat{
    if IS_IPHONE_X() == true{
        return 34.0
    }
    else{
        return 0.0
    }
}
let Height_Indicator:CGFloat = GetHeight_Indicator()

private func GetHeight_NavBar() -> CGFloat{
    if IS_IPHONE_X() == true{
        return 88.0
    }
    else{
        return 64.0
    }
}

let Height_NavBar:CGFloat = GetHeight_NavBar()

private func GetHeight_TabBar() -> CGFloat{
    if IS_IPHONE_X() == true{
        return 83.0
    }
    else{
        return 49.0
    }
}
let Height_TabBar:CGFloat = GetHeight_TabBar()

func RGB_COLOR(R:CGFloat,G:CGFloat,B:CGFloat) ->UIColor {
    return UIColor.init(red: R, green: G, blue: B, alpha: 1)
}

func RGB_COLOR_ALPHA(R:CGFloat,G:CGFloat,B:CGFloat,Alpha:CGFloat) ->UIColor {
    return UIColor.init(red: R, green: G, blue: B, alpha: Alpha)
}
