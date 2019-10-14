//
//  email+SignOut.swift
//  Enigma
//
//  Created by Devang Patel on 23/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

extension UIViewController {
    
    //MARK: - Signout settings
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            // Set initial user default for login as false
            UserDefaults.standard.set(false, forKey: "login")
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance().signOut()
            print("SignOut sucessful")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "loginPageViewController")
            self.present(controller, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
