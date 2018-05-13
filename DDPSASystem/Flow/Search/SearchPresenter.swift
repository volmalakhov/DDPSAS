//
//  SearchPresenter.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SearchPresenterProtocol {
    
    func start()
}

final class SearchPresenter: SelectionPresenterProtocol {
    
    var interactor: SearchInteractorProtocol?
    var viewLayer: SearchViewLayer?
    var wireframe: AppWireframeProtocol?
    
    private var searchRequestWorkItem: DispatchWorkItem?
    
    func start() {
        
        subscriptForViewEvents()
    }
    
    func subscriptForViewEvents() {
        
        viewLayer?.onSearchedTextChanged = search
        viewLayer?.onPageSelected = getPageFollowers
    }
}

private extension SearchPresenter {
    
    func search(_ searchedText: String) {
        
        searchRequestWorkItem?.cancel()
        let localRequestWorkItem = DispatchWorkItem { [weak self] in
            self?.interactor?.search(with: searchedText, viewModelsHandler: { (viewModelds) in
                self?.viewLayer?.update(with: viewModelds)
            }, error: {
                // error
            })
        }
        searchRequestWorkItem = localRequestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() +
            .milliseconds(250), execute: localRequestWorkItem)
    }
    
    func getPageFollowers(_ id: SocialID) {
        
        interactor?.fetchCount(with: id, counterHandler: { [weak self] (pageCounterModel) in
            var modelCopy = pageCounterModel
            modelCopy.id = id
            self?.toProcessingData(with: modelCopy)
        }, error: {
            // error
        })
    }
}

private extension SearchPresenter {
    
    func toProcessingData(with model: VKPageCountModel) {
        
        let socialProxy = DDPSSocialProxy(counter: model.count, id: model.id)
        wireframe?.container?.socialProxy = socialProxy
        wireframe?.buildFlow(with: .proccesing)
    }
}
