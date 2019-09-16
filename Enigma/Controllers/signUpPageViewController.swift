//
//  signUpPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class signUpPageViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var cpasswordText: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
    }

    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - SignIn button action
    @IBAction func signIn(_ sender: UIButton) {
        
    }
    
}

//MARK: - Extensions
extension signUpPageViewController: UITextFieldDelegate {
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        emailText.delegate = self
        passwordText.delegate = self
        cpasswordText.delegate = self
    }
}
