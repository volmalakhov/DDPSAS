//
//  DDPSMain.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol DDPSMainProtocol {
    
    func process<T>(data: Array<T>)
    var config: DDPSConfig? { get set }
}

final class DDPSMain: DDPSMainProtocol {
    
    var config: DDPSConfig?
    
    var queue: DDPSQueueProtocol?
    
    func process<T>(data: Array<T>) {
        createPacks(data: data)
    }
}

private extension DDPSMain {
    
    func createPacks<T>(data: Array<T>) {
        let fabric = DDPSPackFabric()
        fabric.config = config
        fabric.create(from: data) { (pack) in
            
        }
    }
}
