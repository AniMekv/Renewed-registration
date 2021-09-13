//
//  ProfileViewController.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fillProfile()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fillProfile() {
        let user = getCurrentUser()
        profilePicture.image = UIImage(named: user.profilePicture)
        nameLabel.text = user.name
        surnameLabel.text = user.surname
    }
    

    func getCurrentUser() -> User {
        let decoded  = UserDefaults.standard.data(forKey: "currentUser") ?? Data()
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
        return decodedUser
    }
    
    func getUsers()-> [User] {
        let decoded  = UserDefaults.standard.data(forKey: "users") ?? Data()
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [User]
        return decodedUser ?? [User]()
    }

    
    @IBAction func UserLogOut(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "currentUser")
        self.navigationController?.popToRootViewController(animated: true)

    }
    

}
