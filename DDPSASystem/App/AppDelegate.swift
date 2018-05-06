//
//  AppDelegate.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 16.04.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import VK_ios_sdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        guard let window = window else {
            print("Error: Unable to launch system window")
            return false
        }
        
        let appCoordinator = AppCoordinator()
        appCoordinator.appRouter = AppRouter(window: window)
        appCoordinator.start(with: .selection)

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String ?? "")
        return true
    }
}

