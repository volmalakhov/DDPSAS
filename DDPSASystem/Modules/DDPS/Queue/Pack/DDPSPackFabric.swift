//
//  DDPSPackFabric.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias DDPSPackFabricCreatedHandler = ((DDPSPack <Any>) -> ())

final class DDPSPackFabric {
    
    var config: DDPSConfig?
    
    func create<T>(from data: Array<T>, createdHandler: @escaping DDPSPackFabricCreatedHandler) {
        
//        guard let config = config else {
//            print("DDPS error: Unable to read config")
//            return
//        }
//
//        let pack = DDPSPack<Any>()
        
        createPackItems(with: data) { (items) in
            //
        }
    }
}

private extension DDPSPackFabric {
    
    func createPackItems<T>(with data: Array<T>, handler: @escaping (Array<T>) -> ()) {

        guard let config = config, let packSize = config.maxPackItemSize else {
            print("DDPS error: Unable to read config")
            return
        }
    
        let loops = Double(data.count / packSize)
        print("LOOPS - \(loops)")
    }
}
