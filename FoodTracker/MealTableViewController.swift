//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by sebastian vasquez on 10/23/18.
//  Copyright © 2018 sebastian vasquez. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {

    // MARK: Properties
    var meals = [Meal] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMeals()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("Dequeued cell no es una instancia de MealTableViewCell")
        }

        // Configure the cell...
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func loadSampleMeals(){
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Comida numer 1", photo: photo1, rating: 4) else {
            fatalError("No se puede iniciar meal1")
        }
        
        guard let meal2 = Meal(name: "Comuda numero 2", photo: photo2, rating: 5) else {
            fatalError("No se puede inciar meal2")
        }
        
        guard let meal3 = Meal(name: "Comida numero 3", photo: photo3, rating: 2) else {
            fatalError("No se puede iniciar meal3")
        }
        
        meals += [meal1, meal2, meal3]
    }
}
