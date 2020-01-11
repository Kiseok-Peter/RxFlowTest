//
//  MovieModel.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/03.
//  Copyright © 2020 Peter. All rights reserved.
//

import ObjectMapper

struct MovieModel: Mappable {
    
    var items: [MovieItem]
    
    init?(map: Map) {
        items = []
    }
    
    mutating func mapping(map: Map) {
        items    <- map["items"]
    }
}

struct MovieItem: Mappable {
    
    var image: String
    var title: String
    var subtitle: String
    var director: String
    var actor: String
    var userRating: String
    
    init?(map: Map) {
        image = ""
        title = ""
        subtitle = ""
        director = ""
        actor = ""
        userRating = ""
    }
    
    mutating func mapping(map: Map) {
        image       <- map["image"]
        title       <- map["title"]
        subtitle    <- map["subtitle"]
        director    <- map["director"]
        actor       <- map["actor"]
        userRating  <- map["userRating"]
    }
}
