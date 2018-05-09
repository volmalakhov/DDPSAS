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
typealias VKAPISuccessHanlder = ((Any?) -> ())
typealias VKAPIErrorHandler = ((Error) -> ())

protocol VKAPIInterfaceProtocol {
    
    func auth()
    
    func searchPages(with predict: String, success: @escaping VKAPISuccessHanlder, error: @escaping VKAPIErrorHandler)
}

final class VKAPIInterface: NSObject {
    
    var onAuthStateChanged: VKAPIAuthorizationStateHandle?
    
    override init() {
        super.init()
        
        initSDK()
        //wakeUpSession()
    }
    
    private func initSDK() {
        
        let vkInstanse = VKSdk.initialize(withAppId: VKAPIConfig.appID)
        vkInstanse?.uiDelegate = self
        vkInstanse?.register(self)
    }
    
    private func wakeUpSession() {

        VKSdk.wakeUpSession(VKAPIConfig.scopePermissions) { (state, error) in
            
            guard error != nil else {
                print("Error: Unable to check session")
                return
            }
            
            if state == .authorized {
                self.onAuthStateChanged?(.auth, nil)
            }
        }
    }
}

extension VKAPIInterface: VKAPIInterfaceProtocol {

    func auth() {
        VKSdk.authorize(VKAPIConfig.scopePermissions)
    }
    
    func searchPages(with predict: String, success: @escaping VKAPISuccessHanlder, error: @escaping VKAPIErrorHandler) {
        
        let request = VKRequest(method: VKAPIRequest.search.method, parameters: VKAPIRequest.search.params)
        request?.addExtraParameters(["q" : predict])
        request?.access()
        request?.execute(resultBlock: { (response) in
            success(response?.json)
        }, errorBlock: { (er) in
            guard let er = er else {
                return
            }
            error(er)
        })
    }
    
    func fetchPageFollowersCount(pageID: SocialID) {
        
    }
    
    func fetchPageFollowersPages(pageID: SocialID) {
        
        let request = VKRequest(method: VKAPIRequest.followers.method, parameters: VKAPIRequest.followers.params)
        request?.addExtraParameters(["user_id" : pageID])
        request?.access()
        request?.execute(resultBlock: { (response) in
            
        }, errorBlock: { (error) in
            
        })
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
