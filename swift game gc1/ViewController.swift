//
//  ViewController.swift
//  swift game gc1
//
//  Created by Dxjerry on 2017/12/8.
//  Copyright © 2017年 dxjerry. All rights reserved.
//

import UIKit
import SpriteKit

var skview1:SKView=SKView(frame:CGRect(origin: CGPoint(x:0,y:0),size: UIScreen.main.bounds.size))

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let skview1 = skview1 as SKView? {
            let scene = SecondScene(size: view.bounds.size)
            scene.scaleMode = .aspectFill
            skview1.presentScene(scene)
            scene.backgroundColor=UIColor.init(red: 167/255, green: 207/255, blue: 255/255, alpha: 1)
            //显示物理
            skview1.showsPhysics=true
            skview1.showsFPS = true
            skview1.showsNodeCount = true
        }
        self.view.addSubview(skview1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

