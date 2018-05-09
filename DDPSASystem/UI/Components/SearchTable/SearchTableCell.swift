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
    
    override var reuseIdentifier: String {
        get {
             return "SearchTableCellReuseIdentifier"
        }
    }
    
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchTableCell {
    
    func addSubview() {
        
        let subviews = [icon, nameLabel]
        contentView.addMutipleSubviews(subviews)
        
        applyLayout()
    }
    
    func applyLayout() {
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().offset(10)
        }
    }
}
