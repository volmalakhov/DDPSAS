//
//  DDPSQueue.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol DDPSQueueProtocol {
    
    var packs: DDPSPack <Any>? { get set }
}

final class DDPSQueue: DDPSQueueProtocol {
    
    var packs: DDPSPack <Any>?
}
