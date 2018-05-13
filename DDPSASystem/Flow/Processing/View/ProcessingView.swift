//
//  Proccessing.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import SnapKit

final class ProcessingView: UIView {
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.startAnimating()
        return spinner
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProcessingView {
    
    func setup() {
        
        applyStyle()
        applyLayout()
    }
    
    
    func applyStyle() {
        backgroundColor = .white
    }
    
    func applyLayout() {
        
        addSubview(spinner)
        
        spinner.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerY.centerX.equalToSuperview()
        }
    }
}
