//
//  ViewController.swift
//  TryToGoogleAdMob
//
//  Created by 陳昶安 on 2016/12/22.
//  Copyright © 2016年 ANAN. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController,GADInterstitialDelegate {

    @IBOutlet weak var bannerView: GADBannerView!
    
    var interstitial: GADInterstitial!
    
    func createAndLoadInterstitial()->GADInterstitial {
        
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-7477154425870542/5702918916")
        
        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        return interstitial
    }

    
    @IBAction func interstitialBtn(_ sender: Any) {
        
        if interstitial.isReady {
            
            self.interstitial.present(fromRootViewController: self)
            
            interstitial = createAndLoadInterstitial()
            //每次按都重新對伺服器請求的話，就每次按都會跳出插頁式廣告
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.bannerView.adUnitID = "ca-app-pub-7477154425870542/5829173313"
        self.bannerView.rootViewController = self
        
        let request: GADRequest = GADRequest()
        
        self.bannerView.load(request)
        //橫幅式廣告碼:ca-app-pub-7477154425870542/5829173313
        
        
        interstitial = createAndLoadInterstitial()
        
        //插頁式廣告碼:ca-app-pub-7477154425870542/5702918916
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

