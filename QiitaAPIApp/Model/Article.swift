//
//  Article.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/12/03.
//  Copyright © 2019 remuty. All rights reserved.
//

import Foundation

struct Article: Codable {
    var title: String
    var url: String
    var likes_count: Int
    var user: User
    struct User: Codable {
        var id: String
    }
    var tags: [Tag]
    struct Tag: Codable {
        var name: String
    }
}
