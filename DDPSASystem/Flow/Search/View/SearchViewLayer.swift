//
//  SearchViewLayer.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

protocol SearchViewLayerProtocol {
    
    
}

final class SearchViewLayer: UIViewController {
    
    private var customView: SearchView?
    
    override func loadView() {
        super.loadView()
        
        customView = SearchView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewLayer: SearchViewLayerProtocol {
    
}

private extension SearchViewLayer {
    
}
