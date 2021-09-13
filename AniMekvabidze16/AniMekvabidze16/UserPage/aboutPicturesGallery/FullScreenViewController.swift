//
//  FullScreenImageViewController.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var fullImage: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImage.image = UIImage(named: imageName)
        
    }
    
    func showalert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))

           self.present(alert, animated: true, completion: nil)
   }
    
    
    @IBAction func setProfilePicture(_ sender: Any) {
       
        let curUser = getCurrentUser()
        curUser.profilePicture = imageName
        let data  = NSKeyedArchiver.archivedData(withRootObject: curUser)
        let defaults = UserDefaults.standard
        defaults.set(data, forKey:"currentUser" )
        defaults.synchronize()
        
        var users = getUsers()
        for user in users {
            
            if user.name == curUser.name {
                user.profilePicture = imageName
                let data  = NSKeyedArchiver.archivedData(withRootObject: users)
                let defaults = UserDefaults.standard
                defaults.set(data, forKey:"users" )
                defaults.synchronize()

            }
        }
        showalert(message: "Check profile picture")
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

   
}
