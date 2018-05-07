//
//  APICoordinator.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias AccessToken = String
typealias SocialID = String

enum SocialNetwork: String {
    
    case instagram
    case facebook
    case vk
}

final class SocialAPIKit {
    
    func constractRequest<T>(with networks: [SocialNetwork]) -> T? {
        for network in networks {
            switch network {
            case .instagram: return makeInstagramAPI() as? T
            case .facebook: break
            case .vk: return makeVKAPI() as? T
            }
        }
        return nil
    }
}

private extension SocialAPIKit {
    
    func makeInstagramAPI() -> InstagramAPIInterface {
        return InstagramAPIInterface()
    }
    
    func makeVKAPI() -> VKAPIInterface {
        return VKAPIInterface()
    }
}


