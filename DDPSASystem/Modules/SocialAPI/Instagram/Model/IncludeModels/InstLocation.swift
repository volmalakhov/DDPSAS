//
//  InstLocation.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 01.05.18.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

typealias Latitude  = Double
typealias Longitude = Double

struct InstLocation {
    
    var lat: Latitude?
    var lng: Longitude?
    
    var id: APIIdentifier?
    
    var streetAdress = String()
    var name = String()
}
