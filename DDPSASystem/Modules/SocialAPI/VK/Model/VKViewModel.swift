//
//  VKViewModel.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 07.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

struct VKViewModel {
    
    var urlImage: URL?
    var name: String?
    var description: String?
    
    var id: SocialID
    
    init(id: SocialID) {
        self.id = id
    }
}
