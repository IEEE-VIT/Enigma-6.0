//
//  checkNetwork.swift
//  Enigma
//
//  Created by Devang Patel on 17/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    internal func checkNewtork(ifError: String) {
        checkConnection { (status, statusCode) in
            if statusCode == 404{
                print("No connection!!")
                // Vibrates on errors
                UIDevice.invalidVibrate()
                self.errorAlert(titlepass: ifError)
            }else{
                print("connection existing")
            }
        }
    }
}
