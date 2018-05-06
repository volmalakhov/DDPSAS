//
//  APICoordinator.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

enum SocialNetwork {
    
    case instagram
    case facebook
    case vk
}

typealias APIIdentifier = String
typealias ObjectsCount  = Int

typealias AccessToken = String
typealias AccessTokenHandle = ((AccessToken, SocialNetwork) -> ())

final class SocialAPIKit {
    
    func constractRequest<T>(with networks: [SocialNetwork]) -> T? {
        for network in networks {
            switch network {
            case .instagram: return makeInstagramAPI() as? T
            case .facebook: break
            case .vk: break
            }
        }
        return nil
    }
}

private extension SocialAPIKit {
    
    func makeInstagramAPI() -> InstagramAPIInterface {
        return InstagramAPIInterface()
    }
}


