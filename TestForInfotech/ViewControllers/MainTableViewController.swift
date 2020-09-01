//
//  MainTableViewController.swift
//  TestForInfotech
//
//  Created by yurik on 8/28/20.
//  Copyright © 2020 yurik. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

     let temp3 = "https://infotech.gov.ua/storage/img/Temp3.png"
     let temp1 = "https://infotech.gov.ua/storage/img/Temp1.png"
    
    var downLoadCashe1 = DownLoadCashe()
    var downLoadCashe3 = DownLoadCashe()
    
    var image1:  UIImage?
    var image3:  UIImage?
    
    let searchController = UISearchController(searchResultsController: nil)
    var filterCitiesList: [CityModelData] = []
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    func filterContentForSearchText(searchText text: String) {
        filterCitiesList = citiesList.filter { (city) -> Bool in
            return (city.name.lowercased().contains(text.lowercased()))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        guard let urlString1 = URL(string: temp1), let urlString3 = URL(string: temp3) else {return}
        
        downLoadCashe1.loadImage(url: urlString1) { image in
            self.image1 = image!
        }
        downLoadCashe3.loadImage(url: urlString3) { (image) in
            self.image3 = image
        }
        
        //Настройка SearchBar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Пошук"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterCitiesList.count
        }else{
            return citiesList.count
        }
    }

    func cityToDisplay(indexPath: IndexPath) -> CityModelData {
        let correctCity: CityModelData
        if searchController.isActive && searchController.searchBar.text != ""{
            correctCity = filterCitiesList[indexPath.row]
        } else {
            correctCity = citiesList [indexPath.row]
        }
        return correctCity
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
       
        let correctCity = cityToDisplay(indexPath: indexPath)
        cell.textOutletLB.text = "\(indexPath.row+1). місто:  " + correctCity.name

                 
        if indexPath.row % 2 == 0 {
            cell.imageOutlet.image = image1
            //cell.imageOutlet.image = UIImage(named: "arnold")
           // cell.imageView?.loadImage(urlString: temp3)
          
        } else{
            cell.imageOutlet.image = image3
          // cell.imageOutlet.image = UIImage(named: "loyrens")
        }

        return cell
  
    }
    
    
     // MARK: - Table view delegate
    
    
  /*  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
*/
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
                let detailVC = segue.destination as! DetailViewController
            detailVC.currentCity = cityToDisplay(indexPath: indexPath)
          
        }
    }
    

}
extension MainTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController){
        filterContentForSearchText(searchText: searchController.searchBar.text!)
        tableView.reloadData()
    }
    
}
