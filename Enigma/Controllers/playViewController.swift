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
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var questionNumber: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up textFields
        textFieldDelegateSetUp()
        questionText.isHidden = true
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        // Setup question
        quesF()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot fetch question")
    }
    
    //MARK: - Function to fetch the qestion and display
    func quesF() {
        NetworkEngine.fetchQuestion { (sucess) in
            self.questionText.isHidden = false
            self.questionText.text = sucess["question"]!.stringValue
            self.questionNumber.setTitle(sucess["level"]!.stringValue, for: .normal)


        }
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
