//
//  Client.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 16.04.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import UIKit

protocol ClientProtocol {
    
    var avaible: AvaibleStatus { get }
    var connectionType: ConnectionType { get }
    
    mutating func workWithConnection(BLEType: BluetoothState?)
}

struct Client: ClientProtocol {
    
    var avaible: AvaibleStatus {
        get {
            guard isCharging else {
                return .green
            }
            
            guard chargeLevel == .height else {
                return .green
            }
            
            guard chargeLevel == .middle else {
                 return .yellow
            }
            
            guard chargeLevel == .low, chargeLevel == .unknown else {
                return .red
            }
            
            return .unknown
        }
    }
    
    var connectionType: ConnectionType = .none
}

extension Client {
    
    mutating func workWithConnection(BLEType: BluetoothState?) {
        
        guard BLEType == .avaible else {
            return connectionType = .ble
        }
        
        connectionType = .core
    }
}

private extension Client {
    
    var isCharging: Bool {
        get {
            let chargeStatus = UIDevice.current.batteryState
            guard chargeStatus == .charging || chargeStatus == .full else { return false }
            return true
        }
    }
    
    var chargeLevel: ChargeLevel {
        get {
            switch UIDevice.current.batteryLevel {
            case let level where level <= ChargeLevelValues.low:
                return .low
            case let level where level > ChargeLevelValues.low && level < ChargeLevelValues.height:
                return .middle
            case let level where level >= ChargeLevelValues.height:
                return .height
            default:
                return .unknown
            }
        }
    }
}
