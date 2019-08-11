//
//  WeatherTableViewCell.swift
//  RandomJoke
//
//  Created by Hansathon Chuay-on on 9/8/2562 BE.
//  Copyright © 2562 armhansa. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weatherDtLabel: UILabel!
    
    func setupUI(weather: Weather) {
        weatherDtLabel.text = String(weather.dtTxt)
    }
    
}
