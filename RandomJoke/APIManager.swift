//
//  APIManager.swift
//  RandomJoke
//
//  Created by Hansathon Chuay-on on 8/8/2562 BE.
//  Copyright © 2562 armhansa. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    func getRandomJoke(completion: @escaping (JokeData?) -> Void) {
        guard let url = URL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5", forHTTPHeaderField: "x-rapidapi-key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print("error")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let jokeJson = try JSONDecoder().decode(JokeData.self, from: data)
                        print(jokeJson)
                        completion(jokeJson)
                    } catch {
                        print("Parse JSON Failed")
                    }
                }
            }
            
        }
        task.resume()
    }
    
    func getRandomJokeAlamo(completion: @escaping (JokeData?) -> Void) {
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5",
            "Accept": "application/json"
        ]
        Alamofire.request("https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random",
                          headers: headers).responseJSON { jokeJson in
                            print(jokeJson.data!)
//                            let jokeJson = jokeJson as? DataResponse<String>
                            print(jokeJson)
//                            completion(JokeData(id: jokeJson["id"], value: jokeJson["value"], iconURL: jokeJson["icon_url"], url: jokeJson["url"]))
//                            completion(jokeJson as? JokeData)
        }
    }
    
    func getWeather(completion: @escaping (WeatherResponse?) -> Void) {
        guard let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/forecast?lat=13.738159&lon=100.7494925") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("ebe81485e1mshfcec6f27da03849p169a65jsn0e192880693f", forHTTPHeaderField: "x-rapidapi-key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print("error")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
//                        print(weather)
                        completion(weather)
                    } catch {
                        print("Parse JSON Failed")
                    }
                }
            }
            
        }
        task.resume()
    }
    
}
