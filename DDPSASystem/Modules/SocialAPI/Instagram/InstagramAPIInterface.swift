//
//  InsagramAPI.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

enum InstagramAPIEndpoints {
    
    case auth
}

final class InstagramAPIInterface {
    
    func authentication(urlToRequest: @escaping (String) -> ()) {
        let authURL = InstagramAPIConfig.auth.url
        urlToRequest(authURL)
    }
}
