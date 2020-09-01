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
    @IBOutlet weak var cityNameLB: UILabel!
    
    //outlets for API
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var currentTemperatureLB: UILabel!
    @IBOutlet weak var minTemperatureLB: UILabel!
    @IBOutlet weak var maxTemperatureLB: UILabel!
    @IBOutlet weak var humidityLB: UILabel!
    @IBOutlet weak var windSpeedLB: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentCity?.name
        cityNameLB.text = currentCity?.name
        
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
