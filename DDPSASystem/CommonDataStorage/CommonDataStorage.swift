//
//  CommonDataStorage.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

private struct Keys {
    
    static let accessTokenKey = "accessTokenKey"
}

final class CommonDataStorage {
    
    private let storage = UserDefaults.standard
    
    func saveAccessToken(with network: SocialNetwork, token: AccessToken) {
        storage.set(token, forKey: network.rawValue + Keys.accessTokenKey)
    }
    
    func getAccessToken(with network: SocialNetwork) -> String? {
        return storage.string(forKey: network.rawValue + Keys.accessTokenKey)
    }
}

private extension CommonDataStorage {
    
}
