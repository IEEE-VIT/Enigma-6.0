//
//  signUpPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class signUpPageViewController: UIViewController, GIDSignInUIDelegate {

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
//        Auth.auth().sendEmailVerification(withEmail: emailText.text!) { error in
//            if error != nil {
//                print(error?.localizedDescription ?? "Error")
//                self.authAlert(titlepass: "Signin failed",message: "Authentication failed please try again.")
//                self.load.isHidden = true
//            }
//        }
    }
    
    //MARK: - Google signin button
    @IBAction func googleSignIn(_ sender: UIButton) {
        checkNewtork(ifError: "Cannot Signin")
        self.load.isHidden = false
        load.startAnimating()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    //MARK: Make Full screen
    override var prefersStatusBarHidden: Bool {
        return true
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
