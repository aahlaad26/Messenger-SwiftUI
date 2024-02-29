//
//  Constant.swift
//  Messenger-SwiftUI
//


import Foundation
import Firebase

struct FirestoreContants{
    static let userCollection = Firestore.firestore().collection("users")
    static let messageCollection = Firestore.firestore().collection("messages")
}
