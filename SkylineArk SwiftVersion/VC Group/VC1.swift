//
//  VC1.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/10/12.
//

import UIKit

class VC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button1 = UIButton.init(frame: CGRect.init(x: 50, y: 50, width: 100, height: 100))
        button1.backgroundColor = .yellow
        button1.addTarget(self, action: #selector(button1act), for: .touchUpInside)
        self.view.addSubview(button1)
        
        
        let button2 = UIButton.init(frame: CGRect.init(x: 50, y: 50+100+50, width: 100, height: 100))
        button2.backgroundColor = .gray
        button2.addTarget(self, action: #selector(button2act), for: .touchUpInside)
        self.view.addSubview(button2)
    }
    
    @objc func button1act(){
        let vc = LocationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func button2act(){
        let showview = UIView()
        showview.frame.size = CGSize(width: UIScreen.main.bounds.size.width, height: 600)
        showview.backgroundColor = .orange
        
        
        let pushView = DDPushView()
        pushView.title = "title"
        pushView.mainview = showview;
        pushView.pushAlert()
        pushView.comfirm = { (index:NSInteger) -> () in
            print(index)
        }
    }
}
