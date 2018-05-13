//
//  VKAPIConfig.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation
import VK_ios_sdk

struct VKAPIConfig {
    
    static let appID = "6470766"
    static let scopePermissions = [VKAPIPermission.friends.rawValue,
                                   VKAPIPermission.groups.rawValue]
    
    struct Limits {
        
        static let maxRequestPerSecond = 3
        static let maxItemsPerRequest  = 1000
    }
}
