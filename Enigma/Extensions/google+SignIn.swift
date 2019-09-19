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
    func gSignIn() {
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
}

