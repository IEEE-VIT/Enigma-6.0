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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot fetch profile!")
        viewInitial()
    }
    
    //MARK: - Function for initialisation
    func viewInitial() {
        name.text = "\(UserDefaults.standard.string(forKey: "firstName") ?? "NOT PROVIDED") \(UserDefaults.standard.string(forKey: "lastName") ?? "NOT PROVIDED")"
        username.text = "\(UserDefaults.standard.string(forKey: "userName") ?? "NOT PROVIDED")"
        email.text = getEmail()
    }
    
    
    
    @IBAction func logout(_ sender: Any) {
        // calling signOut function
        signOut()
        // Deleting all user Defaults
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    }
}
