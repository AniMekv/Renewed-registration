//
//  ProfileViewController.swift
//  mariamjoglidze15
//
//  Created by AltaSoftware MacMINI on 5/19/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileLabel: UILabel!
    
    var userInfo : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileLabel.text = userInfo
        // Do any additional setup after loading the view.
    }
    

 

}
