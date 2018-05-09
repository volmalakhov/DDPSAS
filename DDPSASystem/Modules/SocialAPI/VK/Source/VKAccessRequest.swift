//
//  VKAccessRequest.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 09.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation
import VK_ios_sdk

extension VKRequest {

    func access() {
        self.addExtraParameters(["access_token" : CommonDataStorage().getAccessToken(with: .vk) ?? ""])
    }
}
