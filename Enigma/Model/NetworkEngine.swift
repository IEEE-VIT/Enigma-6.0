//
//  NetworkEngine.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkEngine {
    
    
    public static func registerPlayer(username: String, email: String, completion: @escaping (Bool) -> ()) {
        let route = "/api/registerPlayer"
        let url = constants.baseurl + route
        let params = [
            "name":username,
            "email":email
        ]
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default,headers: headers).responseJSON{
            response in if response.result.isSuccess{
                let json = JSON(response.result.value!)
                print(json)
                print(json["wasUserRegistered"])
                if json["wasUserRegistered"] == true{

                    completion(true)
                } else {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
    
    
}
