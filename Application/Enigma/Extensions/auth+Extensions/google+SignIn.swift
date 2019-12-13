//
//  google+SignIn.swift
//  Enigma
//
//  Created by Devang Patel on 19/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn

extension GIDSignInUIDelegate {
    
    // Setting up Google Sign In delegate and signIn function
    func gSignIn() {
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
}

