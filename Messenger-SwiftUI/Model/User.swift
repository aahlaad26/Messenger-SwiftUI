//
//  User.swift
//  Messenger-SwiftUI
//


//import Foundation
//import FirebaseFirestoreSwift
//
//struct User: Codable, Identifiable, Hashable{
//    @DocumentID var uid: String?
//    let fullname: String
//    let email: String
//    let fcmToken: String?
//    let profileImageUrl: String?
//    
//    var id: String {
//        return uid ?? NSUUID().uuidString
//    }
//    
//    var firstName: String{
//        let formatter = PersonNameComponentsFormatter()
//        let components = formatter.personNameComponents(from: fullname)
//        return components?.givenName ?? fullname
//    }
//}
//
//extension User{
//    static var MOCK_USER = User(fullname: "Nga", email: "expensive@gmail.com", fcmToken: "", profileImageUrl: "ps-4")
//}

//
//  User.swift
//  Messenger-SwiftUI
//


import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable{
    @DocumentID var uid: String?
    let username: String
    let useremail: String
    let fcmToken: String?
    let userprofileURL: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var firstName: String{
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: username)
        return components?.givenName ?? username
    }
}

extension User{
    static var MOCK_USER = User(username: "Nga", useremail: "expensive@gmail.com", fcmToken: "", userprofileURL: "ps-4")
}
