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
    let leader = leaderB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Pull to refresh
        refreshControl.tintColor = .white
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        leaderTable.addSubview(refreshControl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Function for checking newtwork connection
        checkNewtork(ifError: "Cannot fetch leaderboard!")
        //Loading table and refresh UI
        loadLead()
    }
    
    //MARK: - Function for the loading leaderboard
    func loadLead() {
        NetworkEngine.getLeaderBoard { (response) in
            var number = 0
            // Initialise to empty
            self.leader.name = []
            self.leader.rank = []
            self.leader.level = []
            self.leader.points = []

            while (number < (response["leaderBoard"]?.count) ?? 0) {
                self.leader.name.append(response["leaderBoard"]![number]["name"].stringValue)
                self.leader.rank.append(response["leaderBoard"]![number]["rank"].stringValue)
                self.leader.points.append(response["leaderBoard"]![number]["points"].stringValue)
                self.leader.level.append(response["leaderBoard"]![number]["level"].stringValue)
//                print(response["leaderBoard"]![number]["level"].stringValue)
                number += 1
            }
            self.leaderTable.reloadData()
        }
    }
    
    // Refresh selector control
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
        loadLead()
        refreshControl.endRefreshing()
        checkNewtork(ifError: "Cannot fetch leaderboard!")
    }
    
}


//MARK: - Extensions

extension leaderBoardViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leader.name.count + 1
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
            cell.name.text = leader.name[indexPath.row-1]
            cell.rank.text = leader.rank[indexPath.row-1]
            cell.ques.text = leader.level[indexPath.row-1]
            cell.score.text = leader.points[indexPath.row-1]
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


