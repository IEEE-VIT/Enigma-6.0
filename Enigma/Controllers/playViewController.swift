//
//  playViewController.swift
//  Enigma
//
//  Created by Devang Patel on 09/10/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class playViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var answerText: UITextField!
    
    
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
    
}


//MARK: - Extensions
extension playViewController: UITextFieldDelegate {
    //Setup textfield delegates
    func textFieldDelegateSetUp() {
        answerText.delegate = self
    }
}
