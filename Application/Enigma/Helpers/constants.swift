//
//  constants.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import Alamofire

class constants {
    public static let baseurl = "https://enigma6-backend.herokuapp.com"
    public static let headers: HTTPHeaders = ["Authorization":"Bearer \(getUID())"]
    public static let rules = ["For every correct answer without using hints,you will get x points","For every correct answer without using hints, you will get x points","For every correct answer without using hints, you will get x points","For every correct answer without using hints, you will get x points","For every correct answer without using hints, you will get x points","For every correct answer without using hints, you will get x points","For every correct answer without using hints, you will get x points"]
}
