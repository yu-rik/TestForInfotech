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
    let managerJsonData = ManagerJsonData()
    
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
        
        managerJsonData.downloadJsonData(latitude: lat, longitude: lon)

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
