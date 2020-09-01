//
//  DetailViewController.swift
//  TestForInfotech
//
//  Created by yurik on 9/1/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    var currentCity: CityModelData!
    var managerJsonData = ManagerJsonData()
    
    
    @IBOutlet weak var mapViewOutlet: MKMapView!
    
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
        
        setupCityMark(latit: lat, longit: lon)
        
        managerJsonData.downloadJsonData(latitude: lat, longitude: lon)
        managerJsonData.onCompletion = {[weak self] weatherForDisplay in
            guard let self = self else {return}
            self.updateDisplay(weatherForDisplay: weatherForDisplay)
        }
    }
    
    //отображение города на карте
    private func setupCityMark(latit: Double, longit: Double) {
        
        let location = CLLocation(latitude: latit, longitude: longit)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (citymarks, error) in
            if let error = error{
                print(error)
                return
            }
            guard let citymarks = citymarks else {return}
            let citymark = citymarks.first
            let anotation = MKPointAnnotation()
            anotation.title = self.currentCity.name
            
            guard let placemarkLocation = citymark?.location else {return}
            anotation.coordinate = placemarkLocation.coordinate
            
            self.mapViewOutlet.showAnnotations([anotation], animated: true)
            self.mapViewOutlet.selectAnnotation(anotation, animated: true)
            self.mapViewOutlet.isZoomEnabled = true
            
            
            
        }
    }
    
    //заполнение полей на экране
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

   
}
