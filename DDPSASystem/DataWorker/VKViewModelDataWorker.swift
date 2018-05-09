//
//  VKViewModelDataWorker.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 09.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

final class VKViewModelDataWorker {
    
    func work(with data: Any?, viewModelContainerHandler: @escaping (([VKViewModel]) -> ())) {
        
        var container = [VKViewModel]()
        guard let rawJSON = data as? [[String: Any]] else {
            return
        }
        
        rawJSON.forEach { (jsonObject) in
            
            guard let profileInfo = jsonObject["profile"] as? [String: Any],
             let id = profileInfo["id"] as? Int else {
                return
            }
            
            var viewModel = VKViewModel(id: id)
            if let firstName = profileInfo["first_name"] as? String, let lastName = profileInfo["last_name"] as? String {
                viewModel.name = firstName + " " + lastName
            }
            
            if let description = jsonObject["description"] as? String {
                viewModel.description = description
            }
            
            container.append(viewModel)
        }
        
        viewModelContainerHandler(container)
    }
}
