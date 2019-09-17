//
//  loginPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase

class loginPageViewController: UIViewController{

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot login")
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Login Button Action
    @IBAction func loginButton(_ sender: UIButton) {
        checkNewtork(ifError: "Cannot login")
        Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!) { (user, error)
            in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                self.authAlert(titlepass: "Login failed")
            }
            else {
                print("login Sucess")
                self.performSegue(withIdentifier: "goToPlay", sender: self)
            }
        }
    }
    
    //MARK: - Forget passwork button Action
    @IBAction func forgetButton(_ sender: UIButton) {
    }
    
    //MARK: Make Full screen
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

//MARK: - Extensions
extension loginPageViewController: UITextFieldDelegate {
    
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        emailText.delegate = self
        passText.delegate = self
    }
}
