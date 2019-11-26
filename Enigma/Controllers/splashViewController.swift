//
//  splashViewController.swift
//  Enigma
//
//  Created by Devang Patel on 27/11/19.
//  Copyright © 2019 IEEE-VIT. All rights reserved.
//

import UIKit

class splashViewController: UIViewController {

     
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.loadGif(name: "Enigma")
    }


}
