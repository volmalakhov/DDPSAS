//
//  SearchPresenter.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol SearchPresenterProtocol {
    
    func start()
}

final class SearchPresenter: SelectionPresenterProtocol {
    
    var interactor: SearchInteractorProtocol?
    var viewLayer: SearchViewLayer?
    var wireframe: AppWireframeProtocol?
    
    func start() {
        
        print("START")
    }
}

private extension SelectionPresenter {
    
}
