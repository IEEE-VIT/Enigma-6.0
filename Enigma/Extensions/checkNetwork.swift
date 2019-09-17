//
//  checkNetwork.swift
//  Enigma
//
//  Created by Devang Patel on 17/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation

internal func checkNewtork() {

    checkConnection { (status, statusCode) in
    if statusCode == 404{
        print("No connection!")
    }else{
        print("connection existing")
        }
    }
}
