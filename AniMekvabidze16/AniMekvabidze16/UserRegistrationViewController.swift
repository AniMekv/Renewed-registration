//
//  RegisterViewController.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import UIKit

class UserRegistrationViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var surnameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatPasswordField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    func alert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))

           self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func register(_ sender: UIButton) {

        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        let firstName = nameField.text ?? ""
        let lastName = surnameField.text ?? ""
        let confirmPassword = repeatPasswordField.text ?? ""
        let profileImage = ""

        
        if username == "" || password == "" || firstName == "" ||
            lastName == "" || confirmPassword == "" {
            alert(message: "Please feel all the tabs!")
        } else if password != confirmPassword {
            alert(message: "Passwords do not match")
        } else {
            saveUSer(username: username, password: password, firstName: firstName, lastName: lastName, profileImage: profileImage)
            if let user = setUpUser(username: username) {
                gotooProfile(user: user)
            }
        }
    }
    
    func gotooProfile(user: User){

        let data  = NSKeyedArchiver.archivedData(withRootObject: user)
        let defaults = UserDefaults.standard
        defaults.set(data, forKey:"currentUser")
        defaults.synchronize()

        let sb = UIStoryboard(name: "UserProfile", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProfileTabBarController") as! UserTabBarController

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setUpUser(username: String) -> User? {
        let users = setUser()
        for user in users {
            if username == user.username {
                return user
            }
        }
        return nil
    }
    
    
    func userLogout(username: String, password: String) -> Bool{
        
     let users = setUser()
        
        for user in users {
            if username == user.username && password == user.password{
                return true
            }
        }
        return false
    
    }

  
    
    func setUser()-> [User] {
        let decoded  = UserDefaults.standard.data(forKey: "users") ?? Data()
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [User]
        return decodedUser ?? [User]()
    }
    
 
    func isUserRegistered(username: String) -> Bool{
        
     let users = setUser()
        
        for user in users {
            if username == user.username{
                return true
            }
        }
        return false
    
    }
    
    func saveUSer(username: String, password: String, firstName: String, lastName: String, profileImage: String){
        var users = setUser()
        let newUser = User(username: username, password: password, firstName: firstName, lastName: lastName, profileImage: profileImage)
        users.append(newUser)
        let data  = NSKeyedArchiver.archivedData(withRootObject: users)
        let defaults = UserDefaults.standard
        defaults.set(data, forKey:"users" )
        defaults.synchronize()
    }
    
    
}
