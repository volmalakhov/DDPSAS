//
//  SelectionInteractor.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SelectionInteractorProtocol {
    
    func needInstagramAuthentication(authURL: @escaping (String) -> ())
    func needVKAuthentication(successHandler: @escaping VKAPIAuthorizationStateHandle, errorHandler: @escaping DefaultHandle)
}

final class SelectionInteractor: SelectionInteractorProtocol {
    
    private let instagramApi: InstagramAPIInterface? = SocialAPIKit().constractRequest(with: [.instagram])
    private let vkApi: VKAPIInterface? = SocialAPIKit().constractRequest(with: [.vk])
    
    func needInstagramAuthentication(authURL: @escaping (String) -> ()) {
        instagramApi?.authentication(urlToRequest: { (url) in
            authURL(url)
        })
    }
    
    func needVKAuthentication(successHandler: @escaping VKAPIAuthorizationStateHandle, errorHandler: @escaping DefaultHandle) {
        vkApi?.auth()
        vkApi?.onAuthStateChanged = { state, token in
            switch state {
            case .auth:
                successHandler(state, token)
            case .none:
                errorHandler()
            }
        }
    }
}
