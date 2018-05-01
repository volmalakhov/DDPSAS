//
//  AppRouter.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

protocol AppRouterProtocol {
    
    func setRoot(controller: UIViewController)
}

final class AppRouter {
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension AppRouter: AppRouterProtocol {
    
    func setRoot(controller: UIViewController) {
        window?.rootViewController = controller
    }
}


