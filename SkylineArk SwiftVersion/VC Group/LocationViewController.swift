//
//  LocationViewController.swift
//  SkylineArk SwiftVersion
//
//  Created by Dxjerry on 2021/12/6.
//

import UIKit

class LocationViewController: BaseViewController,AMapLocationManagerDelegate {
    
    let locationManager = AMapLocationManager()
    
    let buttonStartLocation = UIButton()
    var FlagIsLocation:Bool = false
    
    let labelLon = UILabel()
    let labelLat = UILabel()
    let labelAccuracy = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "定位"
        
        
        locationManager.delegate = self
        
        setUI()
    }
    
    func setUI(){
        self.view.addSubview(buttonStartLocation)
        buttonStartLocation.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.center.equalToSuperview()
        }
        buttonStartLocation.setTitle("location", for: .normal)
        buttonStartLocation.setTitleColor(.black, for: .normal)
        buttonStartLocation.backgroundColor = .red
        buttonStartLocation.addTarget(self, action: #selector(StartLocation), for: .touchUpInside)
        
        self.view.addSubview(labelLon)
        labelLon.snp.makeConstraints { (make) in
            make.top.equalTo(buttonStartLocation.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
        labelLon.textColor = .black
        labelLon.textAlignment = .center
        
        self.view.addSubview(labelLat)
        labelLat.snp.makeConstraints { (make) in
            make.top.equalTo(labelLon.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
        labelLat.textColor = .black
        labelLat.textAlignment = .center
        
        self.view.addSubview(labelAccuracy)
        labelAccuracy.snp.makeConstraints { (make) in
            make.top.equalTo(labelLat.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
        labelAccuracy.textColor = .black
        labelAccuracy.textAlignment = .center
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func StartLocation(){
        if (FlagIsLocation == false){
            //调用AMapLocationManager提供的startUpdatingLocation方法开启持续定位。
            locationManager.startUpdatingLocation()
            FlagIsLocation = true
            buttonStartLocation.backgroundColor = .green
        }
        else{
            locationManager.stopUpdatingLocation()
            FlagIsLocation = false
            buttonStartLocation.backgroundColor = .red
        }
    }
    
    
    //接收位置更新,实现AMapLocationManagerDelegate代理的amapLocationManager:didUpdateLocation方法，处理位置更新
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode?) {
//        NSLog("location:{lat:\(location.coordinate.latitude); lon:\(location.coordinate.longitude); accuracy:\(location.horizontalAccuracy);};");
        labelLon.text = "经度：\(location.coordinate.longitude)"
        labelLat.text = "纬度：\(location.coordinate.latitude)"
        labelAccuracy.text = "精确度：\(location.horizontalAccuracy)"
        
        if let reGeocode = reGeocode {
            NSLog("reGeocode:%@", reGeocode)
        }
    }

}
