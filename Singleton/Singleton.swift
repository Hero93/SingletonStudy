//
//  Singleton.swift
//  Singleton
//
//  Created by Luca LG. Gramaglia on 03/02/2020.
//  Copyright © 2020 e-Gate. All rights reserved.
//

import UIKit

struct LoggedInUser {}
struct FeedItem {}

/// Singleton in Swift

// Lazy initialization is a technique for delaying the creation of an object or some other expensive process until it’s needed.
// When programming for iOS, this is helpful to make sure you utilize only the memory you need when you need it.
// It's used when:
// - the initial value for a property is not known until after the object is initialized.
// - when the initial value for a property is computationally intensive.
//   For example, if you have an object that performs some really intense algorithm to determine the number of faces in a picture, make the numberOfFaces
//   property lazily initialized.

class APIClient {

    // this is constant and lazy loaded
    
    static let shared = APIClient()

    // Prevent people to create an APIClient

    private init() {}
    
    func login(completion: (LoggedInUser)->Void) {}
    func loadFeed(completion: ([FeedItem])->Void) {}
}

class MockApiClient: APIClient {
    
    override func login(completion: (LoggedInUser) -> Void) {
        // mock code
    }
}

/// singleton (convenience method in Swift system libraries)
//URLSession.shared
//URLSession()

// How do I test a Singleton ??

class LoginVC: UIViewController {
    
    var api = APIClient.shared
    
    func didTapLoginButton() {
        
        // If APIClient isn't final, I can create a subclass (MockAPIClient)
        // and override the login function in order to put my test code (mock)
        
        api.login { user in }
    }
}

class FeedVC: UIViewController {
    
    var api = APIClient.shared
    
    override func viewDidLoad() {
        
        // IMPORTANT: By introducing the "loadFeed" inside the APIClient we have a problem!!
        //            "LoginVC" doesn't care about "loadFeed()" and so "FeedVC" about "login()"
        //            We have a source code dependency: if I want to reuse the login in another application,
        //            How can I remove the "Login" module? Can can use EXTENSIONS !!!!!
        
        api.loadFeed { feed in }
    }
}
