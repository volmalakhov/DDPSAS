//
//  SearchView.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import SnapKit

private struct SizeConstans {
    
    static let topOffset = 22.0
    static let barHeight = 40.0
}

private typealias S = SizeConstans

final class SearchView: UIView {
    
    let searchBar: SearchBar = {
        let bar = SearchBar()
        return bar
    }()
    
    let table: SearchTable = {
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
        
        let allSubviews = [searchBar, table]
        addMutipleSubviews(allSubviews)
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(S.topOffset)
            make.left.right.equalToSuperview()
            make.height.equalTo(S.barHeight)
        }
        
        table.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}
