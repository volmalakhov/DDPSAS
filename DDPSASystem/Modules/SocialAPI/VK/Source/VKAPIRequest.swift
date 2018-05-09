//
//  VKAPIRequest.swift
//  DDPSASystem
//
//  Created by Vladimir Malakhov on 09.05.2018.
//  Copyright © 2018 Vladimir Malakhov. All rights reserved.
//

import Foundation

enum VKAPIRequest {
    
    case search
    case followers
    
    var method: String {
        switch self {
        case .search:
            return "search.getHints"
        case .followers:
            return "users.getFollowers"
        }
    }
    
    var params: [String: Any] {
        switch self {
        case .search:
            return ["search_global" : 1,
                    "limit"  : 20,
                    "fields" : ["groups", "publics"]
            ]
        case .followers:
            return ["count"  : 1000,
                    "fields" : ["followers_count", "photo_id, verified, sex, bdate, city, country, home_town, has_photo, photo_50, online, lists, domain, has_mobile, contacts, site, education, universities, schools, status, last_seen, followers_count, common_count, occupation, nickname, relatives, relation, personal, connections, exports, wall_comments, activities, interests, music, movies, tv, books, games, about, quotes, can_post, can_see_all_posts, can_see_audio, can_write_private_message, can_send_friend_request, is_favorite, is_hidden_from_feed, timezone, screen_name, maiden_name, crop_photo, is_friend, friend_status, career, military, blacklisted"]
            ]
        }
    }
}
