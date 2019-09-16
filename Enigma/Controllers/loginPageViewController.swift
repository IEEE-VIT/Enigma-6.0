//
//  loginPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class loginPageViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
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
    
    //MARK: - Login Button Action
    @IBAction func loginButton(_ sender: UIButton) {
    }
    
    
    //MARK: - Forget passwork button Action
    @IBAction func forgetButton(_ sender: UIButton) {
    }

    func textFieldDelegateSetUp() {
        emailText.delegate = self
        passText.delegate = self
    }
    
}
