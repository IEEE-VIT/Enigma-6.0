//
//  haptic+Feedback.swift
//  Enigma
//
//  Created by Devang Patel on 19/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension UIDevice {
    // Vibrates when any error occur like invalid password etc.
    static func invalidVibrate() {
        let tryAgain = SystemSoundID(1102)
        AudioServicesPlaySystemSound(tryAgain)
    }
    // For sucess login
    static func validVibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
