//
//  profileViewController.swift
//  Enigma
//
//  Created by Devang Patel on 18/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase

class profileViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var hintsUsed: UILabel!
    @IBOutlet weak var questionSolved: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var rank: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //    //MARK: - Set status bar style to light
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return UIStatusBarStyle.lightContent
    //    }
    
    @IBAction func logout(_ sender: Any) {
      signOut()
    }
}
