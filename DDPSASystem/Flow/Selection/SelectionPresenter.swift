//
//  SelectionPresenter.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SelectionPresenterProtocol {
    
}

final class SelectionPresenter {
    
    var viewLayer: SelectionViewLayerProtocol?
    var interactor: SelectionInteractorProtocol?
    
    func start() {
        
        subscriptForEvents()
    }
    
    func subscriptForEvents() {
        
        viewLayer?.onSocialButtonTapped = select
    }
}

extension SelectionPresenter: SelectionPresenterProtocol {
    
    
}

private extension SelectionPresenter {
    
    func select(_ type: SocialButtonType) {
        switch type {
        case .instagram: interactor?.needAuthentication(authURL: { [weak self] (url) in
            self?.viewLayer?.loadWeb(with: url)
        })
        case .facebook: break
        case .vk: break
        }
    }
}
