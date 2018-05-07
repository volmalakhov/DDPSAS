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
    
    private let table: SearchTable = {
        let table = SearchTable()
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        applyStyle()
        applyLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchView {
    
    func applyStyle() {
        backgroundColor = .white
    }
    
    func applyLayout() {
        
        addSubview(table)
        
        table.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
