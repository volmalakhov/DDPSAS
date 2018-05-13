//
//  VKPageCountDataWorker.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias PageCounterHandler = ((VKPageCountModel) -> ())

final class VKPageCountDataWorker {
    
    func work(with data: Any?, counterHandler: @escaping PageCounterHandler) {
        
        guard let rawJSON = data as? [[String: Any]] else {
            return
        }
        
        if let count = rawJSON[0]["followers_count"] as? Int {
            
            var counterModel = VKPageCountModel()
            counterModel.count = count
            
            counterHandler(counterModel)
        }
    }
}
