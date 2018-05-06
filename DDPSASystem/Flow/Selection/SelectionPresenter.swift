//
//  SelectionPresenter.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SelectionPresenterProtocol {
    
    func start()
}

final class SelectionPresenter: SelectionPresenterProtocol {
    
    var viewLayer: SelectionViewLayerProtocol?
    var interactor: SelectionInteractorProtocol?
    var wireframe: AppWireframeProtocol?
    
    func start() {
        
        subscriptForEvents()
    }
    
    func subscriptForEvents() {
        
        viewLayer?.onSocialButtonTapped = select
    }
}

private extension SelectionPresenter {
    
    func select(_ type: SocialButtonType) {
        switch type {
        case .instagram: instagramAuth()
        case .facebook: facebookAuth()
        case .vk: vkAuth()
        }
    }
    
    func instagramAuth() {
        interactor?.needInstagramAuthentication(authURL: { [weak self] (url) in
            self?.viewLayer?.loadWeb(with: url)
        })
    }
    
    func facebookAuth() {
        
    }
    
    func vkAuth() {
        interactor?.needVKAuthentication(successHandler: { [weak self] (state, token) in
            
            guard state == .auth, let token = token else {
                return
            }
            
            self?.saveToken(with: .vk, token: token.accessToken)
            self?.routeTo()
            
        }, errorHandler: {
            print("Error: Unable to auth user. Try again")
        })
    }
}

private extension SelectionPresenter {
    
    func saveToken(with netowork: SocialNetwork, token: String) {
        
        let commonStorage = CommonDataStorage()
        commonStorage.saveAccessToken(with: netowork, token: token)
    }
    
    func routeTo() {
        wireframe?.buildFlow(with: .search)
    }
}
