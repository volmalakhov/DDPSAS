//
//  SocialButton.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

enum SocialButtonType {
    
    case instagram
    case facebook
    case vk
    
    var title: String {
        switch self {
        case .instagram:
            return "Instagram"
        case .facebook:
            return "Facebook"
        case .vk:
            return "VK"
        }
    }
}

final class SocialButton: UIButton {
    
    init(with type: SocialButtonType) {
        super.init(frame: .zero)
        config(type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SocialButton {
    
    func config(_ type: SocialButtonType) {
        setTitle(type.title, for: .normal)
        backgroundColor = .blue
        layer.cornerRadius = 12
    }
}
