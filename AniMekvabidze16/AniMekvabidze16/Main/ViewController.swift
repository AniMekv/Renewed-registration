//
//  ViewController.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func logIn(_ sender: UIButton) {
        
        let username = userNameField.text ?? ""
        let password = passwordField.text ?? ""
        
        
        if username == "" || password == "" {
            showalert(message: "Please feel all the tabs!")
        } else if let user = getUser(username: username),
                    userExists(username: username, password: password) {
            moveToProfile(user: user)
        } else {
            showalert(message: "Register")
        }
        
    }
    
    
    func getUser(username: String) -> User? {
        let users = getUsers()
        for user in users {
            if username == user.username {
                return user
            }
        }
        return nil
    }
    
    
    func moveToProfile(user: User){
        
        let data  = NSKeyedArchiver.archivedData(withRootObject: user)
        let defaults = UserDefaults.standard
        defaults.set(data, forKey:"currentUser")
        defaults.synchronize()

        let sb = UIStoryboard(name: "UserProfile", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "ProfileTabBarController") as! UserTabBarController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    @IBAction func register() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RegisterViewController") as! UserRegistrationViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
    func getUsers()-> [User] {
        let decoded  = UserDefaults.standard.data(forKey: "users") ?? Data()
        let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [User]
        return decodedUser ?? [User]()
    }
    
    
    func showalert(message: String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
        
    }
    
    func userExists(username: String, password: String) -> Bool{
        
     let users = getUsers()
        
        for user in users {
            if username == user.username && password == user.password{
                return true
            }
        }
        return false
    
    }
    
    
    
    
}

