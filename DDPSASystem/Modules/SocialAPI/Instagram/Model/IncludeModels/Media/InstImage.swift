//
//  InstImage.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias FilterName = String

struct InstImage {
    
    var resolution: InstResolution?
    var type: InstMediaType = .image
    
    var usersInPhoto: [InstUser]?
    
    var filter: FilterName?
    var tags: [InstTag]?
    
    var id: APIIdentifier?
    
    var location: InstLocation?
}


