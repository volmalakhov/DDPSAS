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
    case search
}

final class AppCoordinator {
    
    var appRouter: AppRouterProtocol?
    
    func start(with state: AppState) {
        constractUserFlow(with: state)
    }
}

private extension AppCoordinator {
    
    func constractUserFlow(with state: AppState) {
        
        let appWireframe = AppWireframe()
        appWireframe.appRouter = appRouter
        appWireframe.buildFlow(with: state)
    }
}
