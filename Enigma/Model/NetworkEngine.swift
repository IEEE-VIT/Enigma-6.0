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

class NetworkEngine: UIViewController {
    
    //MARK: - Network Engine for register player
    public static func registerPlayer(username: String, email: String, completion: @escaping (String) -> ()) {
        let route = "/api/registerPlayer"
        let url = constants.baseurl + route
        let params = [
            "name":username,
            "email":email
        ]
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default,headers: headers).responseJSON{
            response in if response.result.isSuccess{
                let json = JSON(response.result.value!)
                //                print(json)
                if json["wasUserRegistered"] == true || json["isRegSuccess"] == true{
                    UserDefaults.standard.set(true, forKey: "login")
                    completion(json["payload"]["msg"].stringValue)
                } else {
                    completion(json["payload"]["msg"].stringValue)
                }
            } else {
                completion("Error in registration")
            }
        }
    }
    
    
    //MARk: - Network Engine for fecthing questions
    
    public static func fetchQuestion(completion: @escaping (Dictionary<String,JSON>) -> ()) {
        let route = "/api/auth/getCurrent"
        let url = constants.baseurl + route
        Alamofire.request(url, method: .post, headers: headers).responseJSON{
            response in if response.result.isSuccess{
                let json = JSON(response.result.value!)
//                print(json)
                completion(json["payload"].dictionaryValue)
                
            }
            else{
                print("Error")
            }
        }
    }
    
    
    //MARK: - Check answer
    
    public static func checkAnswer(answer: String, completion: @escaping (Bool) -> ()) {
        let route = "/api/auth/checkAnswer"
        let url = constants.baseurl + route
        let params = [
            "answer":answer
        ]
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default,headers: headers).responseJSON{
            response in if response.result.isSuccess{
                let json = JSON(response.result.value!)
//                print(json)
                completion(json["isAnswerCorrect"].boolValue)
                
            } else
            {
                print("Error in checking answer")
            }
            
        }
    }
    
    
    //MARk: - Network engine for leaderboard
    
    public static func getLeaderBoard(completion: @escaping (Dictionary<String,JSON>) -> ()) {
        let route = "/api/auth/leaderBoard"
        let url = constants.baseurl + route
      
        Alamofire.request(url, method: .post, headers: headers).responseJSON{
            response in if response.result.isSuccess{
                let json = JSON(response.result.value!)
//                print(json["payload"]["leaderBoard"])
                completion(json["payload"].dictionaryValue)
                
            } else
            {
                print("Error in checking answer")
            }
            
        }
    }
    
    
    
}
