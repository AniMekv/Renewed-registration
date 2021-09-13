//
//  User.swift
//  AniMekvabidze16
//
//  Created by Mac User on 5/20/21.
//

import Foundation


class User: NSObject, NSCoding {
    
    var username: String
    var password: String
    var name: String
    var surname: String
    var profilePicture: String
    
    init(username: String, password: String, firstName: String, lastName: String, profileImage: String) {
        
        self.username = username
        self.password = password
        self.name = firstName
        self.surname = lastName
        self.profilePicture = profileImage
    }
    
    
    required convenience init(coder UserDecoder: NSCoder) {
        let username = UserDecoder.decodeObject(forKey: "username") as! String
        let password = UserDecoder.decodeObject(forKey: "password") as! String
        let firstName = UserDecoder.decodeObject(forKey: "firstName") as! String
        let lastName = UserDecoder.decodeObject(forKey: "lastName") as! String
        let profileImage = UserDecoder.decodeObject(forKey: "profileImage") as! String

        self.init(username: username, password: password, firstName: firstName, lastName: lastName, profileImage: profileImage)
        
    }
    
    func encode(with UserCoder: NSCoder) {
        UserCoder.encode(username, forKey: "username")
        UserCoder.encode(password, forKey: "password")
        UserCoder.encode(name, forKey: "firstName")
        UserCoder.encode(surname, forKey: "lastName")
        UserCoder.encode(profilePicture, forKey: "profileImage")
    }
}
