//
//  Singleton.swift
//  Singleton
//
//  Created by Luca LG. Gramaglia on 03/02/2020.
//  Copyright © 2020 e-Gate. All rights reserved.
//

import UIKit

/// Singleton (by the book implementation, not using Swift tools)

final class APIClient {

    private static let instance = APIClient()

    static func getInstance() -> APIClient {
        return instance
    }

    // Prevent people to create an APIClient

    private init() {}
}

let client = APIClient.getInstance()

struct LoggedInUser {}
