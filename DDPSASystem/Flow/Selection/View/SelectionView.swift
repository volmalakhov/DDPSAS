//
//  SelectionView.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit
import SnapKit

private struct Size {
    
    static let topOffset   = 50.0
    static let leftOffset  = 15.0
    static let rightOffset = -15.0
}

typealias SocialButtonSelectedCallback = ((SocialButtonType) -> ())

final class SelectionView: UIView {
    
    var onButtonTapped: SocialButtonSelectedCallback?
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        lbl.text = "Select one of the social network"
        return lbl
    }()
    
    private let instagramButton: SocialButton = {
        let button = SocialButton(with: .instagram)
        button.addTarget(self, action: #selector(instagramButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let facebookButton: SocialButton = {
        let button = SocialButton(with: .facebook)
        button.addTarget(self, action: #selector(facebookButtonAction), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    private let vkButton: SocialButton = {
        let button = SocialButton(with: .vk)
        button.addTarget(self, action: #selector(vkButtonAction), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    
    init() {
        super.init(frame: .zero)
        applyStyle()
        construct()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SelectionView {
    
    func applyStyle() {
        backgroundColor = .white
    }
    
    func construct() {
        
        let subviews = [titleLabel, instagramButton, facebookButton, vkButton]
        addMutipleSubviews(subviews)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Size.topOffset)
            make.left.equalToSuperview().offset(Size.leftOffset)
            make.right.equalToSuperview().offset(Size.rightOffset)
        }
        
        constrainHelper(fromView: instagramButton, toView: titleLabel)
        constrainHelper(fromView: facebookButton, toView: instagramButton)
        constrainHelper(fromView: vkButton, toView: facebookButton)
    }
    
    func constrainHelper(fromView: UIView, toView: UIView) {
        fromView.snp.makeConstraints { (make) in
            make.top.equalTo(toView.snp.bottom).offset(Size.leftOffset)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(Size.leftOffset)
            make.right.equalToSuperview().offset(Size.rightOffset)
        }
    }
}

private extension SelectionView {
    
    @objc func instagramButtonAction() { onButtonTapped?(.instagram) }
    @objc func facebookButtonAction() { onButtonTapped?(.facebook) }
    @objc func vkButtonAction() { onButtonTapped?(.vk) }
}
