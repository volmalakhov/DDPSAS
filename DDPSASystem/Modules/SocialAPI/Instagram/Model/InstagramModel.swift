//
//  InstagramAPIEndpoints.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias APIIdentifier = String
typealias ObjectsCount  = Int

final class InstagramModel {
    
    var commentsCount: ObjectsCount?
    var likesCount: ObjectsCount?
    
    var caption: InstCaptionModel?
    
    var link: URL?
    
    var user: InstUser?
    
    var images: [InstImage]?
    var video: [InstVideo]?
    
    var createdTime = 0
}






