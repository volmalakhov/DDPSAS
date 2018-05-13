//
//  SearchInteractor.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias DefaultHandler = (() -> ())

protocol SearchInteractorProtocol {
    
    func search(with predict: String, viewModelsHandler: @escaping (([VKViewModel]) -> ()), error: @escaping DefaultHandler)
    func fetchCount(with id: SocialID, counterHandler: @escaping ((VKPageCountModel) -> ()), error: @escaping DefaultHandler)
}

final class SearchInteractor: SearchInteractorProtocol {
    
    private let vkApi: VKAPIInterfaceProtocol? = SocialAPIKit().constractRequest(with: [.vk])
    
    func search(with predict: String, viewModelsHandler: @escaping (([VKViewModel]) -> ()), error: @escaping DefaultHandler) {
        vkApi?.searchPages(with: predict, success: { (response) in
            let dataWorker = VKViewModelDataWorker()
            dataWorker.work(with: response, viewModelContainerHandler: { (viewModels) in
                viewModelsHandler(viewModels)
            })
        }, error: { (er) in
            error()
        })
    }
    
    func fetchCount(with id: SocialID, counterHandler: @escaping ((VKPageCountModel) -> ()), error: @escaping DefaultHandler) {
        vkApi?.fetchPageFollowersCount(pageID: id, success: { (response) in
            let dataWorker = VKPageCountDataWorker()
            dataWorker.work(with: response, counterHandler: { (counterModel) in
                counterHandler(counterModel)
            })
        }, error: { (er) in
            error()
        })
    }
}


