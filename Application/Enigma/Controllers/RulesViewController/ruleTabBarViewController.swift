//
//  ruleTabBarViewController.swift
//  Enigma
//
//  Created by Devang Patel on 20/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class ruleTabBarViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var rulesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Set status bar style to light
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

//MARK: - Extensions

extension ruleTabBarViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return constants.rules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rulesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! rulesTableViewCell
        return cell
    }
    // Setting custom header properties
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(ciColor: .black)
        headerView.tintColor = .black
        return headerView
    }
    // Setting custom header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    // Setting custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
