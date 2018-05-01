//
//  InstVideo.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

struct InstVideo {
    
    var resolution: InstResolution?
    
    var commentsCount: ObjectsCount = 0
    var likesCount: ObjectsCount = 0
    
    var link: URL?
    var createdTime = 0
    
    var images: InstImage?
    var usersInPhoto: [InstUser]?
    var caption: InstLocation?
    
    var type: InstMediaType = .video
    
    var filter: FilterName?
    var tags: [InstTag]?
    
    var id: APIIdentifier?
    
    var user: InstUser?
    var location: InstLocation?
}
