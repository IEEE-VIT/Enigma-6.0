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
    
    //MARK: - Variables
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        leaderTable.addSubview(refreshControl)
    }
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        refreshControl.endRefreshing()
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
        if indexPath.row == 0 {
            cell.name.text = "NAME"
            cell.rank.text = "RANK"
            cell.ques.text = "QUES"
            cell.score.text = "SCORE"
            cell.name.textColor = #colorLiteral(red: 0.6431372549, green: 0.1333333333, blue: 1, alpha: 1)
            cell.rank.textColor = #colorLiteral(red: 0.6431372549, green: 0.1333333333, blue: 1, alpha: 1)
            cell.ques.textColor = #colorLiteral(red: 0.6431372549, green: 0.1333333333, blue: 1, alpha: 1)
            cell.score.textColor = #colorLiteral(red: 0.6431372549, green: 0.1333333333, blue: 1, alpha: 1)
        }
        else {
            cell.name.text = "Cell \(indexPath.row)"
            cell.rank.text = "Cell \(indexPath.row)"
            cell.ques.text = "Cell \(indexPath.row)"
            cell.score.text = "Cell \(indexPath.row)"
            cell.name.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.rank.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.ques.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.score.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
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


