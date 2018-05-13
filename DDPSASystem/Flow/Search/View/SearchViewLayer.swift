//
//  SearchViewLayer.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

typealias OnPageSelectedHandler = ((SocialID) -> ())

protocol SearchViewLayerProtocol {
    
    var onSearchedTextChanged: SearchTextChangedHandler? { get set }
    var onPageSelected: OnPageSelectedHandler? { get set }
    
    func update(with newViewModels: [VKViewModel])
}

final class SearchViewLayer: UIViewController {
    
    var onSearchedTextChanged: SearchTextChangedHandler?
    var onPageSelected: OnPageSelectedHandler?
    
    private var searchView: SearchView?
    
    override func loadView() {
        super.loadView()
        
        searchView = SearchView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscriptForEvents()
    }
}

extension SearchViewLayer: SearchViewLayerProtocol {
    
    func update(with newViewModels: [VKViewModel]) {
        searchView?.table.update(with: newViewModels)
    }
}

private extension SearchViewLayer {

    func subscriptForEvents() {
        
        searchView?.searchBar.onSearchTextChanged = { [weak self] searchedText in
            self?.onSearchedTextChanged?(searchedText)
        }
        
        searchView?.table.onSelectEntry = { [weak self] entry in
            self?.onPageSelected?(entry)
        }
    }
}
