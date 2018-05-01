//
//  AppCoordinator.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

enum AppState {
    
    case onboarding
    case selection
}

final class AppCoordinator {
    
    var appRouter: AppRouterProtocol?
    
    func start(with state: AppState) {
        switch state {
        case .onboarding:
            constractOnboarding()
        case .selection:
            constractSelection()
        }
    }
}

private extension AppCoordinator {
    
    func constractOnboarding() {
        // ready to extension
    }
    
    func constractSelection() {
        
        let viewLayer = SelectionViewLayer()
        let presenter = SelectionPresenter()
        let interactor = SelectionInteractor()
        presenter.viewLayer = viewLayer
        presenter.interactor = interactor
        presenter.start()
        appRouter?.setRoot(controller: viewLayer)
    }
}
