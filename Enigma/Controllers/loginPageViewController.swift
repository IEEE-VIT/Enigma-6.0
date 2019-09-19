//
//  loginPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class loginPageViewController: UIViewController, GIDSignInUIDelegate{

    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        // Hide activity monitor
        self.load.isHidden = true
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
        self.load.isHidden = false
        load.startAnimating()
        checkNewtork(ifError: "Cannot login")
        Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!) { (user, error)
            in
            if error != nil {
                // Vibrates on errors
                UIDevice.invalidVibrate()
                print(error?.localizedDescription ?? "Error")
                self.authAlert(titlepass: "Login failed",message: "Authentication failed please try again.")
                self.load.isHidden = true
            }
            else {
                // Vibrates on valid
                UIDevice.validVibrate()
                print("login Sucess")
                self.performSegue(withIdentifier: "goToSetUp", sender: self)
                self.load.stopAnimating()
                self.load.isHidden = true
            }
        }
    }
    
    //MARK: - Login with Google action
    @IBAction func googleLogin(_ sender: UIButton) {
        checkNewtork(ifError: "Cannot login")
        self.load.isHidden = false
        load.startAnimating()
        gSignIn()
    }
    
    
    //MARK: - Forget passwork button Action
    @IBAction func forgetButton(_ sender: UIButton) {
        
        self.load.isHidden = false
        load.startAnimating()
        if emailText.text == "" {
            authAlert(titlepass: "Enter email", message: "Please enter valid email to reset password.")
            self.load.isHidden = true
        } else if emailText.text != nil {
        
            Auth.auth().sendPasswordReset(withEmail: emailText.text ?? " ") { error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                self.authAlert(titlepass: "Reset failed",message: "Please try again.")
                self.load.isHidden = true
            }
            else {
                print("Success!")
                self.authAlert(titlepass: "Note",message: "Reset password email has been send.")
                self.load.isHidden = true
                }
            }
        }
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
