//
//  profileViewController.swift
//  Enigma
//
//  Created by Devang Patel on 18/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit
import Firebase

class profileViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var hintsUsed: UILabel!
    @IBOutlet weak var questionSolved: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: - Variables
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up profile function called
        profileSetUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot fetch profile!")
        viewInitial()
    }
    
    //MARK: - Function for profile view setup
    private func profileSetUp() {
        
        NetworkEngine.getProfile { (response,status) in
            print(response)
            //            print(response["name"]!.stringValue)
            //            print(status)
            if status == 200 {
                self.username.text = response["name"]!.stringValue
                self.rank.text = response["rank"]!.stringValue
                self.score.text = response["points"]!.stringValue
                self.questionSolved.text = response["level"]!.stringValue
            }
            else {
                self.authAlert(titlepass: "Error", message: "Cannot fetch the profile please try again!")
            }
        }
        
    }
    
    //MARK: - Function for initialisation
    private func viewInitial() {
        
        // Pull to refresh setup
        scrollView.alwaysBounceVertical = true
        scrollView.bounces  = true
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        self.scrollView.addSubview(refreshControl)
        
        // Setting up the profile first and last name
        name.text = "\(UserDefaults.standard.string(forKey: "firstName") ?? "NOT PROVIDED") \(UserDefaults.standard.string(forKey: "lastName") ?? "NOT PROVIDED")"
        email.text = getEmail()
    }
    
    // Selector for the pull to refresh
    @objc func didPullToRefresh() {
        profileSetUp()
        // For End refrshing
        refreshControl?.endRefreshing()
    }
    
    
    
    @IBAction func logout(_ sender: Any) {
        // calling signOut function
        signOut()
        // Deleting all user Defaults
        if let appDomain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: appDomain)
        }
    }
}
