//
//  signUpPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase

class signUpPageViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var cpasswordText: UITextField!
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
        checkNewtork(ifError: "Cannot Signin")
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - SignIn button action
    @IBAction func signIn(_ sender: UIButton) {
        self.load.isHidden = false
        load.startAnimating()
        checkNewtork(ifError: "Cannot Signin")
        if passwordText.text! == cpasswordText.text! {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
                if error != nil{
                    // Vibrates on errors
                    UIDevice.invalidVibrate()
                    print(error?.localizedDescription ?? "Error")
                    if error?.localizedDescription == "The email address is already in use by another account." {
                        self.authAlert(titlepass: "Account Exists", message: "Account already exists please login")
                    }
                    self.authAlert(titlepass: "signIn failed",message: "Authentication failed please try again.")
                    self.load.isHidden = true
                } else {
                    print("Sucess")
                    Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                        let alert = UIAlertController(title: "Verification email", message: "Verification email has been sent please verify it.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                            // Vibrates on valid
                            UIDevice.validVibrate()
                            self.dismiss(animated: true, completion: nil)
                            self.load.stopAnimating()
                            self.load.isHidden = true
                        }))
                        
                        self.present(alert,animated: true,completion: nil)
                    })
                }
            }
        } else {
            authAlert(titlepass: "Error", message: "Password does not match please try again.")
        }
    }
    
    // Dismiss to loginViewController
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
