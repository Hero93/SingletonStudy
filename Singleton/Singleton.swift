//
//  Singleton.swift
//  Singleton
//
//  Created by Luca LG. Gramaglia on 03/02/2020.
//  Copyright © 2020 e-Gate. All rights reserved.
//

import UIKit

struct LoggedInUser {}

/// Singleton in Swift

// Lazy initialization is a technique for delaying the creation of an object or some other expensive process until it’s needed.
// When programming for iOS, this is helpful to make sure you utilize only the memory you need when you need it.
// It's used when:
// - the initial value for a property is not known until after the object is initialized.
// - when the initial value for a property is computationally intensive.
//   For example, if you have an object that performs some really intense algorithm to determine the number of faces in a picture, make the numberOfFaces
//   property lazily initialized.

final class APIClient {

    // this is constant and lazy loaded
    
    static let instance = APIClient()

    // Prevent people to create an APIClient

    private init() {}
    
    func login(completion: (LoggedInUser)->Void) {}
}

/// singleton (convenience method in Swift system libraries)
//URLSession.shared
//URLSession()

let client = APIClient.instance

// How do I test a Singleton ??

class LoginVC: UIViewController {
    
    func didTapLoginButton() {
        
        // How can you override the login function inside the APIClient instance in order to provide a mock one?
        // If the class is final, I can't subclass it
        // instance is a let, so I can't changed it
        // APIClient -> impossible to test !!
        
        APIClient.instance.login { user in
            
        }
    }
}
