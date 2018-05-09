//
//  SearchTable.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 07.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

typealias SocialIDHandle = ((SocialID) -> ())

final class SearchTable: UITableView {
    
    var onSelectEntry: SocialIDHandle?
    
    private var data: [VKViewModel]?
    
    init() {
        super.init(frame: .zero, style: .grouped)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with data: [VKViewModel]) {
        self.data = data
        reloadData()
    }
}

private extension SearchTable {
    
    func setup() {
        
        delegate = self
        dataSource = self
        
        registerCell()
        applyStyle()
    }
    
    func registerCell() {
        register(SearchTableCell.self,
                 forCellReuseIdentifier: SearchTableCell().reuseIdentifier)
    }
    
    func applyStyle() {
        backgroundColor = .white
    }
}

extension SearchTable: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let data = data else {
            return
        }
        
        let currentID = data[indexPath.row].id
        onSelectEntry?(currentID)
    }
}

extension SearchTable: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = dequeueReusableCell(withIdentifier: SearchTableCell().reuseIdentifier, for: indexPath) as? SearchTableCell else {
            return UITableViewCell()
        }
    
        return constract(cell: cell, row: indexPath.row)
    }
}

private extension SearchTable {
    
    func constract(cell: SearchTableCell, row: Int) -> SearchTableCell {
        
        guard let data = data else {
            return cell
        }
        
        let currentViewModel = data[row]
        cell.nameLabel.text = currentViewModel.name
        
        return cell
    }
}



