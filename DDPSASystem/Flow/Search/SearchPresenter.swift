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
        
        
    }
}
