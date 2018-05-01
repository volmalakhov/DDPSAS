//
//  Web.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import WebKit

final class WebView: WKWebView {
    
    init(with url: String) {
        super.init(frame: .zero, configuration: WKWebViewConfiguration())
        load(url: url)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WebView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url {
            print("URL - \(urlStr)")
        }
        decisionHandler(.allow)
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
