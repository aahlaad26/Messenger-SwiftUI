//
//  ContentViewModel.swift
//  Messenger-SwiftUI
//


import Firebase
import Combine
import SwiftUI

@Observable
class ContentViewModel{
    
    var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubcribers()
    }
    
    private func setupSubcribers(){
        AuthService.shared.$userSession
            .sink{ [weak self] userSessionFromAuthService in
                self?.userSession = userSessionFromAuthService
            }
            .store(in: &cancellables)
    }
    
}

