//
//  ViewController.swift
//  RandomJoke
//
//  Created by Hansathon Chuay-on on 8/8/2562 BE.
//  Copyright © 2562 armhansa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weathers: [Weather] = [Weather(dt: 1, dtTxt: "Test 1"),
                               Weather(dt: 2, dtTxt: "Test 2"),
                               Weather(dt: 3, dtTxt: "Test 3"),
                               Weather(dt: 4, dtTxt: "Test 4"),
                               Weather(dt: 5, dtTxt: "Test 5")
                                ]
    
    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.reloadData()
    }

    @IBAction func getApiRandomJoke(_ sender: Any) {
//        APIManager().getRandomJoke() { (jokeJson) in
//            DispatchQueue.main.async {
//                guard let jokeJson = jokeJson else {
//                    return
//                }
//                self.jokeLabel.text = jokeJson.value
//            }
//        }
        APIManager().getWeather() { (weatherJson) in
            DispatchQueue.main.async {
                guard let weatherJson = weatherJson else {
                    return
                }
                self.CityLabel.text = String(weatherJson.city.name)
                self.weathers.removeAll()
                self.weathers.append(contentsOf: weatherJson.list)
                print(self.weathers)
                self.tableView.reloadData()
            }
            
        }
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard weathers.indices.contains(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherTableViewCell else {
                return UITableViewCell()
        }
        
        let weatherItem = weathers[indexPath.row]
        cell.setupUI(weather: weatherItem)
        
        return cell
    }
    
    
}
