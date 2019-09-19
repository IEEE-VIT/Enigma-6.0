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

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutButton(_ sender: UIButton) {
        do {
            GIDSignIn.sharedInstance().signOut()
            print("SignOut sucessful")
            performSegue(withIdentifier: "goToLogin", sender: self)
           }
    }
}
