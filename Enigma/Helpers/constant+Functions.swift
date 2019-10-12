//
//  constant+Functions.swift
//  Enigma
//
//  Created by Devang Patel on 23/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import Firebase

// function to get uid
internal func getUID() -> String {
    let uid = Auth.auth().currentUser?.uid
    return uid ?? "notFound"
}

internal func getEmail() -> String {
    let userEmail = Auth.auth().currentUser?.email
    return userEmail ?? "notFound"
}
