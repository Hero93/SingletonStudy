//
//  Singleton.swift
//  Singleton
//
//  Created by Luca LG. Gramaglia on 03/02/2020.
//  Copyright © 2020 e-Gate. All rights reserved.
//

import UIKit

struct LoggedInUser {}

// Main Module

protocol LoginProtocol {
    func login(completion: (LoggedInUser)->Void)
}

struct FeedItem {}

// How do I test a Singleton ??

class LoginVC: UIViewController {
    
    // "Protocol" example

    var loginClient: LoginProtocol?
        
    func didTapLoginButton() {
                        
        // The client it's still shared between the module.
        // If I want to add a new Module that UPLOADS data, I need to make a new method in the APIClient and so you break the other clients.
        // How to make it more flexible?
        
        // SOULTION (STAGE 2): Dependency Inversion -> What if instead of the module depending of the concrete APIClient,
        //                                             we make a concreate APIClient depend on the modules.
        
        // APIClient it's just a detail, it's not important to the business. So if preferable to have contained logic in modules and details depend on the features,
        // in this case the features depending on the APIClient.
        
        // To do so, we introduce "Protocol" or "Closures" or any type of Interface for the module.
        // The "Feed" module just need a function to load the feed data, it doesn't need to know where the data is coming from.
        
        // When we do "APIClient.shared.api.login", we depend on APIClient, we need to know that we have to call the "login" function.
        
        // Working with Protocols and dependency injection it's a great way to improve.
        // This code it's also very testable because we don't need a web service to load the data, we can mock data.
        
        loginClient?.login { user in
            
        }
    }
}

class FeedVC: UIViewController {
    
    // "Closure" example
    var loadFeed: (([FeedItem])->Void)?

    override func viewDidLoad() {
        
        // By creating the extensions I didn't break the loadFeed call
            
    }
}
