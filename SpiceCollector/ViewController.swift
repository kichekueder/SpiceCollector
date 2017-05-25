//
//  ViewController.swift
//  SpiceCollector
//
//  Created by Tom Munhoven on 25/05/2017.
//  Copyright © 2017 Tom Munhoven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var spices : [Spice] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // create link to Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // fetch contents from Core Data
        do {
            
            spices = try context.fetch(Spice.fetchRequest())
            
        } catch {
            
            print("Error fetching Spice table")
            
        }
        
        // refresh the table view
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // return the number of spices in the array
        return spices.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a table view cell container
        let cell = UITableViewCell()
        
        // collect the spice data for this row
        let spice = spices[indexPath.row]
        cell.textLabel?.text = spice.title
        cell.imageView?.image = UIImage(data: spice.image! as Data)
        
        // return the cell
        return cell
        
    }
    
}

