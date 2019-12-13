//
//  leaderBoardTableViewCell.swift
//  Enigma
//
//  Created by Devang Patel on 09/10/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class leaderBoardTableViewCell: UITableViewCell {

    
    
    //MARK: - Outlets
    
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ques: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
