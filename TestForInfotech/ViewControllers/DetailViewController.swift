//
//  DetailViewController.swift
//  TestForInfotech
//
//  Created by yurik on 9/1/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var currentCity: CityModelData?
    var managerJsonData = ManagerJsonData()
    
    //outlets for API
    @IBOutlet weak var descriptionLB: UILabel!
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var currentTemperatureLB: UILabel!
    @IBOutlet weak var minTemperatureLB: UILabel!
    @IBOutlet weak var maxTemperatureLB: UILabel!
    @IBOutlet weak var humidityLB: UILabel!
    @IBOutlet weak var windSpeedLB: UILabel!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentCity?.name
        guard let lat = currentCity?.coord.lat else {return}
        guard let lon = currentCity?.coord.lon else {return}
        
        managerJsonData.onCompletion = {[weak self] weatherForDisplay in
            guard let self = self else {return}
            self.updateDisplay(weatherForDisplay: weatherForDisplay)
            
        }
        managerJsonData.downloadJsonData(latitude: lat, longitude: lon)

    }
    
    func updateDisplay(weatherForDisplay: WeatherDataForDisplay) {
        DispatchQueue.main.async {
            self.descriptionLB.text = weatherForDisplay.descript
            self.descriptionImage.image = UIImage(systemName: weatherForDisplay.systemWeatherIcon)
            self.currentTemperatureLB.text = weatherForDisplay.tempString
            self.minTemperatureLB.text = weatherForDisplay.minTempString
            self.maxTemperatureLB.text = weatherForDisplay.maxTempString
            self.humidityLB.text = weatherForDisplay.humidString
            self.windSpeedLB.text = weatherForDisplay.windString
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
