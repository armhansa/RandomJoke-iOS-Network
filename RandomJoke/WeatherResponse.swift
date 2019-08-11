//
//  WeatherResponse.swift
//  RandomJoke
//
//  Created by Hansathon Chuay-on on 9/8/2562 BE.
//  Copyright © 2562 armhansa. All rights reserved.
//

import Foundation

struct WeatherResponse : Codable {
    var cod: String
    var message: Float
    var cnt: Int
    var list: [Weather]
    var city: City
}

struct Weather : Codable {
    var dt: Int
    var dtTxt: String
    // Continue
    
    private enum CodingKeys: String, CodingKey {
        case dt
        case dtTxt = "dt_txt"
    }
}

struct City : Codable {
    var id: Int
    var name: String
    var country: String
}


//"city": {
//    "id": 6957690,
//    "name": "Lat Krabang",
//    "coord": {
//        "lat": 13.7234,
//        "lon": 100.7844
//    },
//    "country": "TH",
//    "population": 1000,
//    "timezone": 25200
//}
