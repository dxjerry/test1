//
//  VC2.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/10/12.
//

import UIKit

class VC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var mainview:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: WIN_WIDTH, height: WIN_HEIGHT-Height_TabBar))
        mainview.backgroundColor=UIColor.yellow
        self.view.addSubview(mainview)
    }
}
