//
//  AppWireframe.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 06.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol AppWireframeProtocol {
    
    func buildFlow(with appState: AppState)
    var container: DDPSDIContainer? { get set }
}

final class AppWireframe: AppWireframeProtocol {
    
    var container: DDPSDIContainer?
    var appRouter: AppRouterProtocol?
    
    func buildFlow(with appState: AppState) {
        switch appState {
        case .onboarding:
            buildOnboarding()
        case .selection:
            buildSelection()
        case .search:
            buildSearch()
        case .proccesing:
            buildProccesing()
        }
    }
}

private extension AppWireframe {
    
    func buildOnboarding() {
        
    }
    
    func buildSelection() {
        
        let viewLayer = SelectionViewLayer()
        let presenter = SelectionPresenter()
        let interactor = SelectionInteractor()
        presenter.viewLayer = viewLayer
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.start()
        appRouter?.setRoot(controller: viewLayer)
    }
    
    func buildSearch() {
        
        let viewLayer = SearchViewLayer()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        presenter.viewLayer = viewLayer
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.start()
        appRouter?.setRoot(controller: viewLayer)
    }
    
    func buildProccesing() {
        
        let viewLayer = ProccesingViewLayer()
        guard let container = container else { return }
        let presenter = ProcessingPresenter(container: container)
        let interactor = ProcessingInteractor()
        presenter.viewLayer = viewLayer
        presenter.interactor = interactor
        
        presenter.start()
        appRouter?.setRoot(controller: viewLayer)
    }
}
