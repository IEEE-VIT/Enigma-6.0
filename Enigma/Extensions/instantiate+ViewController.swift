//
//  instantiate+ViewController.swift
//  Enigma
//
//  Created by Devang Patel on 23/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension AppDelegate {
  
    // Function setting up intial view controller
    func setInitialViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let UID = getUID()
        print(UID)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if UID == "notFound" {
            let VC = mainStoryboard.instantiateViewController(withIdentifier: "loginPageViewController") as! loginPageViewController
            appDelegate.window?.rootViewController = VC
            appDelegate.window?.makeKeyAndVisible()
        } else {
            let tap = mainStoryboard.instantiateViewController(withIdentifier: "tapBar") as! UITabBarController
            appDelegate.window?.rootViewController = tap
            appDelegate.window?.makeKeyAndVisible()
        }
       
    }
    
}

