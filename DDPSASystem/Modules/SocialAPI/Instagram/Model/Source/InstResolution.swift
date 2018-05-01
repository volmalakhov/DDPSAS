//
//  InstResolution.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

enum ResolutionType {
    
    case low
    case thumbnail
    case standart
}

struct InstResolution {
    
    var type: ResolutionType = .low
    var url: URL?
    var width = 0
    var height = 0
}
