//
//  InstCaption.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

struct InstCaptionModel {
    
    var createdTime = 0
    var text = String()
    var from: InstFrom?
    var id = APIIdentifier()
}

struct InstFrom {
    
    enum TypeFrom {
        
        case user
        case unknown
    }
    
    var username = String()
    var fullName = String()
    var type: TypeFrom = .user
    var id = 0
}
