//
//  Extension+UIViewController.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

extension UIView {
    
    func addMutipleSubviews(_ subviews: [UIView]) {
        
        subviews.forEach { (subview) in
            self.addSubview(subview)
        }
    }
    
    func addBar(with title: String) {
        
        let height = 44
        let width  = Int(UIScreen.main.bounds.width)
        
        let bar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let item = UINavigationItem(title: title)
        bar.setItems([item], animated: false)
        self.addSubview(bar)
    }
}

