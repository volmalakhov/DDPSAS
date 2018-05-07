//
//  SearchTableCell.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 07.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import SnapKit

final class SearchTableCell: UITableViewCell {
    
    let icon: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = img.frame.width / 2
        return img
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        return lbl
    }()
    
    let ident = "SearchTableCellReuseIdentifier"
    
    init() {
        super.init(style: .default, reuseIdentifier: ident)
        addSubview()
        applyLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchTableCell {
    
    func addSubview() {
        
        let subviews = [icon, nameLabel]
        subviews.forEach { (subview) in
            addSubview(subview)
        }
    }
    
    func applyLayout() {
        
        icon.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(icon).offset(16)
            make.right.equalToSuperview()
        }
    }
}
