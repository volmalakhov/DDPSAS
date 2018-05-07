//
//  SearchInteractor.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SearchInteractorProtocol {
    
}

final class SearchInteractor: SearchInteractorProtocol {
    
    private let vkApi: VKAPIInterface? = SocialAPIKit().constractRequest(with: [.vk])
    
    func search(with predict: String) {
        
    }
}


