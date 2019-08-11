//
//  JokeJson.swift
//  RandomJoke
//
//  Created by Hansathon Chuay-on on 9/8/2562 BE.
//  Copyright © 2562 armhansa. All rights reserved.
//

import Foundation

/*
 {
 "categories": [],
 "created_at": "2016-05-01 10:51:41.584544",
 "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
 "id": "CvPS21VFSUyhVFnSRFEnbQ",
 "updated_at": "2016-05-01 10:51:41.584544",
 "url": "https://api.chucknorris.io/jokes/CvPS21VFSUyhVFnSRFEnbQ",
 "value": "M. Night Shyamalan will not see the twist ending to his life, which will be Chuck Norris twisting his head off."
 }
 */

struct JokeData: Codable { // Codable = Encodable + Decodable
    let id: String
    let value: String
    let iconURL: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case value
        case url
        case iconURL = "icon_url"
    }
    
}
