//
//  VKAPIInterface.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation
import VK_ios_sdk

enum VKAPIAuthorizationState {
    
    case auth
    case none
}

typealias VKAPIAuthorizationStateHandle = ((VKAPIAuthorizationState, VKAccessToken?) -> ())

protocol VKAPIInterfaceProtocol {
    
    func auth()
}

final class VKAPIInterface: NSObject {
    
    var onAuthStateChanged: VKAPIAuthorizationStateHandle?
    
    override init() {
        super.init()
        
        let vkInstanse = VKSdk.initialize(withAppId: VKAPIConfig.appID)
        vkInstanse?.uiDelegate = self
        vkInstanse?.register(self)
    }
}

extension VKAPIInterface: VKAPIInterfaceProtocol {

    func auth() {
        
        let scopePermison = [VK_API_USER_ID, ""]
        VKSdk.authorize(scopePermison)
    }
    
    func searchPages(with predict: String) {
        
    }
    
    func fetchPageFollowers(pageID: String) {
        
    }
    
    func fetchPage() {
        
    }
}

extension VKAPIInterface: VKSdkDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        
        guard result.error == nil else {
            onAuthStateChanged?(.none, nil)
            return
        }
        
        onAuthStateChanged?(.auth, result.token)
    }
    
    func vkSdkUserAuthorizationFailed() {
        onAuthStateChanged?(.none, nil)
    }
}

extension VKAPIInterface: VKSdkUIDelegate {
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        
    }
}
