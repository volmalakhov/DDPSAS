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
    
    func start() {
        
        subscriptForEvents()
    }
    
    func subscriptForEvents() {
        
        viewLayer?.onSocialButtonTapped = selectNetwork
        viewLayer?.onGetSocialAccessToken = saveNetworkAccessToken
        viewLayer?.onReadyToRouteNext = routeToSearch
    }
}

private extension SelectionPresenter {
    
    func selectNetwork(_ type: SocialButtonType) {
        switch type {
        case .instagram: interactor?.needAuthentication(authURL: { [weak self] (url) in
            self?.viewLayer?.loadWeb(with: url)
        })
        case .facebook: break
        case .vk: break
        }
    }
    
    func saveNetworkAccessToken(_ token: AccessToken, _ social: SocialNetwork) {
        let commonStorage = CommonDataStorage()
        commonStorage.saveAccessToken(with: social, data: token)
    }
    
    func routeToSearch() {
        
        //
        
        
    }
}
