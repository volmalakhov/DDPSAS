//
//  SearchBar.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 08.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

typealias SearchTextChangedHandler = ((String) -> ())

final class SearchBar: UISearchBar {
    
    var onSearchTextChanged: SearchTextChangedHandler?
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchBar {
    
    func setup() {
        
        delegate = self
        
        applySyle()
    }
    
    func applySyle() {
        
        backgroundColor = .white
    }
}

extension SearchBar: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        onSearchTextChanged?(searchText)
    }
}


