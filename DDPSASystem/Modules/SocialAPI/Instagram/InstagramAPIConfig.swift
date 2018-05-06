//
//  InstagramAPIConfig.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

enum InstagramAPIConfig {
    
    private var cliendID: String {
        get {
            return "12488095d36a4848a6282faeafe4778e"
        }
    }
    
    private var redirect: String {
        get {
            return "https://www.instagram.com/returnisnil/"
        }
    }
    
    
    case auth
    
    var url: String {
        switch self {
        case .auth:
            return "https://api.instagram.com/oauth/authorize/?client_id=" + cliendID + "&redirect_uri=" + redirect + "&response_type=code"
        }
    }
}
