//
//  Web.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import WebKit

private struct AccessTokenGetHandler {
    
    var onGetInstagramAccessToken: AccessTokenHandle?
    var onGetFaceboolAccessToken: AccessTokenHandle?
    var onGetVKAccessToken: AccessTokenHandle?
}

final class WebView: WKWebView {
    
    private var tokenHandler = AccessTokenGetHandler()
    
    init(with url: String) {
        super.init(frame: .zero, configuration: WKWebViewConfiguration())
        load(url: url)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func observeAccessToken(accessToken: @escaping AccessTokenHandle) {
        
        tokenHandler.onGetInstagramAccessToken = { token, social in
            accessToken(token, social)
        }
        
        tokenHandler.onGetFaceboolAccessToken = { token, social in
            accessToken(token, social)
        }
        
        tokenHandler.onGetVKAccessToken = { token, social in
            accessToken(token, social)
        }
    }
}

extension WebView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let url = navigationAction.request.url else {
            return
        }
    
        let urlStr = url.absoluteString
        let codeRegularExpression = "?code="
        
        if urlStr.contains(codeRegularExpression) {
            if let range = urlStr.range(of: codeRegularExpression) {
                let accessToken = urlStr[range.upperBound...]
                tokenHandler.onGetInstagramAccessToken?(String(accessToken), .instagram)
            }
        }
        
        print("URL - \(urlStr)")
        
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        
    }
}

private extension WebView {
    
    func setup() {
        navigationDelegate = self
    }
    
    func load(url: String) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        let request = URLRequest(url: url)
        load(request)
    }
}
