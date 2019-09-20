//
//  profileViewController.swift
//  Enigma
//
//  Created by Devang Patel on 18/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
class profileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//  
//    //MARK: - Set status bar style to light
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }
    
    @IBAction func logout(_ sender: Any) {
        do {
            GIDSignIn.sharedInstance().signOut()
            print("SignOut sucessful")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "loginPageViewController")
            self.present(controller, animated: true, completion: nil)
        }
    }
}
