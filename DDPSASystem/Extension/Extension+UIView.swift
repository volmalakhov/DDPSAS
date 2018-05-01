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
    
}

