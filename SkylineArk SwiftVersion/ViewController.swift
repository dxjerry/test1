//
//  ViewController.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/10/11.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = "http://test.shop.com/user?login"
        let parameters = ["name":"jack","password":"123456"]
        Alamofire.AF.request(url, method: .post, parameters: parameters).responseJSON { (response) in
            
            print(response)
            
            
            
        }
        
        
        
        
        
    }
    
}

