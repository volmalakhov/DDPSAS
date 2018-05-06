//
//  SelectionViewLayer.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

typealias DefaultHandle = (() -> ())

protocol SelectionViewLayerProtocol {
    
    func loadWeb(with url: String)
    var onSocialButtonTapped: SocialButtonSelectedCallback? { get set }
}

final class SelectionViewLayer: UIViewController {
    
    var onSocialButtonTapped: SocialButtonSelectedCallback?
    
    private var customView: SelectionView?
    private var webView: WebView?
    
    override func loadView() {
        customView = SelectionView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscriptForAction()
    }
}

extension SelectionViewLayer: SelectionViewLayerProtocol {
    
    func loadWeb(with url: String) {
        webView = WebView(with: url)
        guard let customView = customView, let webView = webView else {
            return
        }
        webView.frame = customView.frame
        customView.addSubview(webView)
    }
}

private extension SelectionViewLayer {
    
    func subscriptForAction() {
        customView?.onButtonTapped = { [weak self] type in
            self?.onSocialButtonTapped?(type)
        }
    }
}
