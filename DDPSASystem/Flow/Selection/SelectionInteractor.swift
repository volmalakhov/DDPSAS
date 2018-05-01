//
//  SelectionInteractor.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SelectionInteractorProtocol {
    
    func needAuthentication(authURL: @escaping (String) -> ())
}

final class SelectionInteractor: SelectionInteractorProtocol {
    
    private let api: InstagramAPIInterface? = SocialAPIKit().constractRequest(with: [.instagram])
    
    func needAuthentication(authURL: @escaping (String) -> ()) {
        api?.authentication(urlToRequest: { (url) in
            authURL(url)
        })
    }
}
