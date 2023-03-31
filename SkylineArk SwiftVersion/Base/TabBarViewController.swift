//
//  TabBarViewController.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/10/12.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor=UIColor.white
        
        self.GetShowData()
    }
    
    
    func GetShowData(){
        let arrays:NSMutableArray = NSMutableArray.init()
        
        let vc1:VC1 = VC1.init()
        self.addChildViewController(childController: vc1, title: "首页", image: "btn_tanchuang_kong", selectedImage: "btn_tanchuang_man", netImageStr: "", netSelectImage: "");
        let Nav1:UINavigationController = UINavigationController.init(rootViewController: vc1)
        arrays.add(Nav1)
        
        let vc2:VC2 = VC2.init()
        self.addChildViewController(childController: vc2, title: "设置", image: "btn_tanchuang_kong", selectedImage: "btn_tanchuang_man", netImageStr: "", netSelectImage: "");
        let Nav2:UINavigationController = UINavigationController.init(rootViewController: vc2)
        arrays.add(Nav2)
        
        self.viewControllers=arrays as? [UIViewController]
        
        
    }
    
    
    func addChildViewController(childController:UIViewController,title:String,image:String,selectedImage:String,netImageStr:String,netSelectImage:String){
        childController.tabBarItem.title = title;
        childController.tabBarItem.image = UIImage.init(named: image)
//        childController.tabBarItem.image = childController.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
//        childController.tabBarItem.selectedImage = childController.tabBarItem.image?.withRenderingMode(.alwaysOriginal)
        
        //设置文字颜色
        if #available(iOS 11.0, *) {
            childController.tabBarItem.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: RGB_COLOR(R: 68, G: 68, B: 68)
            ], for: .normal)
            if let color = UIColor(named: "Color_text") {
                childController.tabBarItem.setTitleTextAttributes([
                    NSAttributedString.Key.foregroundColor: color
                ], for: .selected)
            }
            tabBar.tintColor = UIColor(named: "Color_text") //IOS13必须设置这个
            
            childController.tabBarItem.imageInsets = .zero
            childController.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -2)
        } else {
            childController.tabBarItem.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: RGB_COLOR(R: 68, G: 68, B: 68)
            ], for: .normal)
            childController.tabBarItem.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: RGB_COLOR(R: 51, G: 51, B: 51)
            ], for: .selected)
            tabBar.tintColor = RGB_COLOR(R: 51, G: 51, B: 51) //IOS13必须设置这个
            
            childController.tabBarItem.imageInsets = .zero
            childController.tabBarItem.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -2)
            
        }
        
        
        //    //调节title与图片之间的间隔(当首页有选中无字的效果时调用)
        //    if ([title isEqualToString:@"首页"]) {
        //
        //        if ([_isSHowNetImage isEqual:@"1"]){//如果是节日,则保持不变
        //            childController.tabBarItem.imageInsets = UIEdgeInsetsZero;
        //            childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
        //            childController.tabBarItem.title = title;
        //        }
        //        else{
        //            childController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        //            childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 20);
        //            childController.tabBarItem.title = @"";
        //        }
        //
        //    }else{
        //       childController.tabBarItem.imageInsets = UIEdgeInsetsZero;
        //        childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
        //        childController.tabBarItem.title = title;
        //    }
    }
    
    func GetServerData(){
//        let manager:AFHTTPSessionManager = AFNETWORK_REQUSET()
//        let url = "https://www.baidu.com"
        
        
        
        
    }
}
