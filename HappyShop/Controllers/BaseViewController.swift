//
//  BaseViewController.swift
//  HappyShop
//
//  Created by Suresh on 4/18/16.
//  Copyright © 2016 Suresh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initiate the Network Monitoring...
        AFNetworkReachabilityManager.sharedManager().startMonitoring();
        
        //Set View's gradient background color
        self.setGradientBackgroundColor(self.view);
    
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //Add reachability observer for the current class...
        self.addreachabilityObserver()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Remove reachability obser for the current class...
        self.removeReachabilityObserver()

    }
    
    //MARK:- Reachability observer - notifier
    //Add Reachability Observer
    func addreachabilityObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("networkChanged:"), name: AFNetworkingReachabilityDidChangeNotification, object: nil);
    }
    
    //Remove Rechability Observer
    func removeReachabilityObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: AFNetworkingReachabilityDidChangeNotification, object: nil);
    }
    
    func networkChanged(sender : AnyObject) {
        let isConnected = AFNetworkReachabilityManager.sharedManager().reachable
        if(!isConnected) {
            let alertView = UIAlertView(title: "Network Unavailable!", message: "You're seems to be offline, please connect to a network", delegate: self, cancelButtonTitle: "Ok")
            alertView.show()
            
        }
    }
    
    //MARK:- Set Background Color
    func setGradientBackgroundColor(view : UIView!) {
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [kSNOW_COLOR.CGColor, kWHITE_COLOR.CGColor, kSNOW_COLOR.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
        
    }
    
    
    //MARK:- After DidLayout Actions
    override func viewDidLayoutSubviews() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: Selector("didFinishLayout"), object: nil)
        self.performSelector(Selector("didFinishLayout"), withObject: nil, afterDelay: 0)
    }
    
    
    //When all subviews finish layout...
    func didFinishLayout() {
        
        
    }


}
