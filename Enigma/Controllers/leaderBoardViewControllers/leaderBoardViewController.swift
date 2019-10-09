//
//  leaderBoardViewController.swift
//  Enigma
//
//  Created by Devang Patel on 23/09/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class leaderBoardViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var leaderTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


//MARK: - Extensions

extension leaderBoardViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaderTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! leaderBoardTableViewCell
//        cell.textLabel?.textColor = .white
//        cell.textLabel?.text = "Cell \(indexPath.row)"
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
        return 10
    }
    // Setting custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}


