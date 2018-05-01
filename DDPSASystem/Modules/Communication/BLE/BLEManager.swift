//
//  BluetoothService.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 16.04.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import CoreBluetooth

typealias BLEStateCallback = ((BluetoothState) -> ())

enum BluetoothState {
    
    case avaible
    case unavaible
}

protocol BLEProtocol {
    
    var onUpdateState: BLEStateCallback? { get set }
}

final class BLEManager: NSObject, BLEProtocol {
    
    var onUpdateState: BLEStateCallback?

    private var manager: CBCentralManager?
    
    
    override init() {
        super.init()
        
        manager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension BLEManager: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        guard central.state == .poweredOn else {
            onUpdateState?(.avaible)
            return
        }
        onUpdateState?(.unavaible)
    }
}

extension BLEManager: CBPeripheralDelegate {
    
}
