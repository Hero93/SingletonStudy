//
//  Singleton.swift
//  Singleton
//
//  Created by Luca LG. Gramaglia on 03/02/2020.
//  Copyright © 2020 e-Gate. All rights reserved.
//

import UIKit

/// Singleton in Swift

// API Module: We have generic client

class APIClient {
    
    static let shared = APIClient()

    func execute(_ : URLRequest, completion: (Data)->Void) {}
}

// Login Module: Specialized client for the Login module

struct LoggedInUser {}

extension APIClient {
    func login(completion: (LoggedInUser)->Void) {}
}

// Feed Module: Specialized client for the Feed module

struct FeedItem {}

extension APIClient {
    func loadFeed(completion: ([FeedItem])->Void) {}
}

// How do I test a Singleton ??

class LoginVC: UIViewController {
    
    var api = APIClient.shared
    
    func didTapLoginButton() {
                
        // By creating the extensions I didn't break the login call.
        
        // The client it's still shared between the module.
        // If I want to add a new Module that UPLOADS data, I need to make a new method in the APIClient and so you break the other clients.
        // How to make it more flexible?
        
        api.login { user in }
    }
}

class FeedVC: UIViewController {
    
    var api = APIClient.shared
    
    override func viewDidLoad() {
        
        // By creating the extensions I didn't break the loadFeed call
            
        api.loadFeed { feed in }
    }
}
