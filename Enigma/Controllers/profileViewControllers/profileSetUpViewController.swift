//
//  profileSetUpViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class profileSetUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        let email = getEmail()
        emailText.text = email
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Done button action
    @IBAction func doneAction(_ sender: UIButton) {
        

        if usernameText.text == "" || emailText.text == "" {
            authAlert(titlepass: "Please fill all the required details", message: "Fields empty!")
        }
        else {
        NetworkEngine.registerPlayer(username: usernameText.text!, email: getEmail()) { (sucess) in
            if sucess == "Player registered, Let the game begin!!!"
            {
                self.performSegue(withIdentifier: "goToRules", sender: self)
            }
            else if sucess == "User already registered, Signing In!" {
//                self.authAlert(titlepass: "Account exists", message: "User already registered, Please Signing In!")
                self.performSegue(withIdentifier: "goToRules", sender: self)
            }
            else if sucess == "Username already Taken" {
                self.authAlert(titlepass: "Username already Taken", message: "Please use other username!")
            }
            else {
                self.authAlert(titlepass: "Registration Failed", message: "Please try after some time!")
            }
        }
        
        }
    }
}

//MARK: - Extensions
extension profileSetUpViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        emailText.delegate = self
        firstNameText.delegate = self
        lastNameText.delegate = self
        usernameText.delegate = self
    }
}
