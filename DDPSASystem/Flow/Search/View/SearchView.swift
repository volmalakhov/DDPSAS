//
//  SearchView.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import SnapKit

final class SearchView: UIView {
    
    
    
    init() {
        super.init(frame: .zero)
        applyStyle()
        construct()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchView {
    
    func applyStyle() {
        backgroundColor = .white
    }
    
    func construct() {
        
        
    }
}
