//
//  ProcessingPresenter.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol ProcessingPresenterProtocol {
    
    func start()
}

final class ProcessingPresenter: ProcessingPresenterProtocol {
    
    var viewLayer: ProccesingViewLayerProtocol?
    var interactor: ProcessingInteractorProtocol?
    var wireframe: AppWireframeProtocol?
    
    private var ddps: DDPSMainProtocol?
    private var container: DDPSDIContainerProtocol
    init(container: DDPSDIContainerProtocol) {
        self.container = container
    }
    
    func start() {
        
        setupDDPSModule()
        processData()
    }
}

private extension ProcessingPresenter {
    
    func setupDDPSModule() {
        
        ddps = DDPSMain()
        ddps?.config = setupConfig()
    }
    
    func processData() {
        
        
    }
}

private extension ProcessingPresenter {
    
    func setupConfig() -> DDPSConfig {
        
        let limits = VKAPIConfig.Limits.self

        let config = DDPSConfig()
        config.maxPackItemSize = limits.maxItemsPerRequest
        config.maxRequestPerSecond = limits.maxRequestPerSecond
        
        return config
    }
}

