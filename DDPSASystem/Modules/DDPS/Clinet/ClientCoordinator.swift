//
//  ClientCoordinator.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 16.04.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

final class ClientCoordinator {
    
    func update(with BLE: BLEProtocol, client: ClientProtocol) {
        
        var clientMutableCopy = client
        var BLEMutableCopy = BLE
        
        BLEMutableCopy.onUpdateState = { (state) in
            
            clientMutableCopy.workWithConnection(BLEType: state)
            
            switch clientMutableCopy.avaible {
            case .green:  self.greenCase(with: clientMutableCopy.connectionType)
            case .yellow: self.yellowCase(with: clientMutableCopy.connectionType)
            case .red:    self.redCase(with: clientMutableCopy.connectionType)
            case .unknown:
                self.unknownCase()
            }
        }
    }
}

private extension ClientCoordinator {
    
    func greenCase(with connectionType: ConnectionType) {
        
    }
    
    func yellowCase(with connectionType: ConnectionType) {
        
    }
    
    func redCase(with connectionType: ConnectionType) {
        
    }
    
    func unknownCase() {
        
    }
}
