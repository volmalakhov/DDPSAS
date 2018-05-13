//
//  ProcessingViewLayer.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

protocol ProccesingViewLayerProtocol {
    
}

final class ProccesingViewLayer: UIViewController {
    
    private var proccesingView: ProcessingView?
    
    override func loadView() {
        super.loadView()
        
        proccesingView = ProcessingView()
        view = proccesingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProccesingViewLayer: ProccesingViewLayerProtocol {
    
}
