//
//  BaseViewController.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/11/30.
//

import UIKit
import RxSwift
import SnapKit

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    lazy var topTitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "nav_back"), for: .normal)
        button.addTarget(self, action: #selector(navback), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        // Do any additional setup after loading the view.
    }
    func addCustomNavBack() {
        self.view.addSubview(backButton)
        self.view.bringSubviewToFront(backButton)
        backButton.snp.makeConstraints { (make) in
            make.left.equalTo(15)
//            make.top.equalTo(view.safeAreaInsets.top)
            make.top.equalTo(Height_NavBar)
            make.height.equalTo(44)
        }
    }
    
    @objc func navback() {
        self.navigationController?.popViewController(animated: true)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("\(String(describing: type(of: self)))销毁")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
