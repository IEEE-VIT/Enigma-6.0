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
import GoogleSignIn

extension AppDelegate {
  
    // Function setting up intial view controller
    func setInitialViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let UID = getUID()
        print(UID)
        let loginstatus = UserDefaults.standard.bool(forKey: "login")
        print("Login status=\(loginstatus)")
        if loginstatus == false {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                GIDSignIn.sharedInstance().signOut()
                print("SignOut sucessful")
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            if UID == "notFound" {
                let VC = mainStoryboard.instantiateViewController(withIdentifier: "loginPageViewController") as! loginPageViewController
                appDelegate.window?.rootViewController = VC
                appDelegate.window?.makeKeyAndVisible()
            }
        }
        else if loginstatus == true {
            let tap = mainStoryboard.instantiateViewController(withIdentifier: "tapBar") as! UITabBarController
            appDelegate.window?.rootViewController = tap
            appDelegate.window?.makeKeyAndVisible()
        }
       
    }
    
}

