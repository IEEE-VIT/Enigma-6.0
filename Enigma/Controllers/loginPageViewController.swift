//
//  loginPageViewController.swift
//  Enigma
//
//  Created by Devang Patel on 16/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase
import Network

class loginPageViewController: UIViewController{

    //MARK: - Outlets
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    //MARK: - Variables
    let monitor = NWPathMonitor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up textFields
        textFieldDelegateSetUp()
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
            } else {
                print("No connection.")
            }
            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
    }
    
    //MARK:- TextField Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Login Button Action
    @IBAction func loginButton(_ sender: UIButton) {
        
        Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!) { (user, error)
            in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
            else {
                print("login Sucess")
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
