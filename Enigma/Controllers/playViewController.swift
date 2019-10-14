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
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Variables
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up textFields
        textFieldDelegateSetUp()
        questionText.isHidden = true
        //EXTENSION: - Hide keyborad
        hideKeyboardWhenTappedAround()
        
        // Pull to refresh setup
        scrollView.alwaysBounceVertical = true
        scrollView.bounces  = true
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
        
    }
    
    // Selector for the pull to refresh
    @objc func didPullToRefresh() {
        quesF()
        // For End refrshing
        refreshControl?.endRefreshing()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot fetch question")
        // Setup question
        quesF()
    }
    
    //MARK: - Function to fetch the qestion and display
    func quesF() {
        NetworkEngine.fetchQuestion { (sucess,status) in
            //            print(status)
            if status == 200 {
                self.questionText.isHidden = false
                self.questionText.text = sucess["question"]!.stringValue
                self.questionNumber.setTitle(sucess["level"]!.stringValue, for: .normal)
            }
            else {
                self.authAlert(titlepass: "Error", message: "Cannot fetch the question please try again!")
            }
        }
    }
    
    //MARK: - Function for checking answers
    func checkAns() {
        // Function for checking newtwork connection
        super.checkNewtork(ifError: "Cannot fetch question")
        if answerText.text == "" {
            authAlert(titlepass: "Error", message: "Answer Can't be blank")
        }
        else {
            NetworkEngine.checkAnswer(answer: answerText.text!) { (response) in
                if response == true {
                    self.authAlert(titlepass: "Accurate", message: "Correct Answer")
                    self.answerText.text = ""
                }
                else if response == false {
                    self.authAlert(titlepass: "Answer not correct", message: "You are miles far!")
                }
                else {
                    self.authAlert(titlepass: "Error", message: "Cannot submit answers please try again!")
                }
            }
            
        }
    }
    
    //MARK: - check answer function and action
    
    @IBAction func answerSubmit(_ sender: UIButton) {
        
        checkAns()
        
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
