//
//  CommonDataStorage.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

private enum StorageCell {
    
    case instagramAccessToken
    case facebookAccessToken
    case vkAccessToken
    
    var key: StorageKeyCell {
        switch self {
        case .instagramAccessToken:
            return "instagramAccessToken"
        case .facebookAccessToken:
            return "facebookAccessToken"
        case .vkAccessToken:
            return "vkAccessToken"
        }
    }
}

typealias StorageKeyCell = String

final class CommonDataStorage {
    
    private let storage = UserDefaults.standard
    
    func saveAccessToken(with key: SocialNetwork, data: String) {
        switch key {
        case .instagram: save(data: data, with: StorageCell.instagramAccessToken.key)
        case .facebook: save(data: data, with: StorageCell.facebookAccessToken.key)
        case .vk: save(data: data, with: StorageCell.vkAccessToken.key)
        }
    }
    
    func readAccessToken(with key: SocialNetwork) -> String? {
        switch key {
        case .instagram: return read(with: StorageCell.instagramAccessToken.key)
        case .facebook: return read(with: StorageCell.facebookAccessToken.key)
        case .vk: return read(with: StorageCell.vkAccessToken.key)
        }
    }
}

private extension CommonDataStorage {
    
    func save(data: String, with key: StorageKeyCell) {
        storage.set(data, forKey: key)
    }
    
    func read(with key: StorageKeyCell) -> String? {
        return storage.string(forKey: key)
    }
}

