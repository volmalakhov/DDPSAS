//
//  DDPSDIContainer.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 13.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

protocol DDPSDIContainerProtocol {
    
    var socialProxy: DDPSSocialProxyProtocol? { get set }
}

final class DDPSDIContainer: DDPSDIContainerProtocol {
    
    var socialProxy: DDPSSocialProxyProtocol?
}
