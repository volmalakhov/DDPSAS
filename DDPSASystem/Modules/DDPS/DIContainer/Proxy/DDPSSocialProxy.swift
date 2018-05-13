//
//  DDPSSocialProxy.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol DDPSSocialProxyProtocol {
    
    var counter: Int? { get }
    var id: SocialID? { get }
}

struct DDPSSocialProxy: DDPSSocialProxyProtocol {
    
    var counter: Int?
    var id: SocialID?
}
