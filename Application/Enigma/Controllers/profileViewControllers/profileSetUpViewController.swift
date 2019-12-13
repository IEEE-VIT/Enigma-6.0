//
//  profileSetUpViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class profileSetUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        // Get email function
        let email = getEmail()
        emailText.text = email
        // Hide activity monitor
        self.load.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot Setup profile!")
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Done button action
    @IBAction func doneAction(_ sender: UIButton) {
        
        // Start load animation
        self.load.isHidden = false
        load.startAnimating()
        
        if usernameText.text == "" || emailText.text == "" || firstNameText.text == "" || lastNameText.text == "" {
            authAlert(titlepass: "Please fill all the required details", message: "Fields empty!")
        }
        else {
            NetworkEngine.registerPlayer(username: usernameText.text!, email: getEmail()) { (sucess) in
                UserDefaults.standard.set("\(self.firstNameText.text ?? "Unknown")", forKey: "firstName")
                UserDefaults.standard.set("\(self.lastNameText.text ?? "Unknown")", forKey: "lastName")
                UserDefaults.standard.set("\(self.usernameText.text ?? "Unknown")", forKey: "userName")
                if sucess == "Player registered, Let the game begin!!!"
                {
                    self.performSegue(withIdentifier: "goToRules", sender: self)
                    // Vibrates on valid
                    UIDevice.validVibrate()
                }
                else if sucess == "User already registered, Signing In!" {
                    //                self.authAlert(titlepass: "Account exists", message: "User already registered, Please Signing In!")
                    self.performSegue(withIdentifier: "goToRules", sender: self)
                    // Vibrates on valid
                    UIDevice.validVibrate()
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
