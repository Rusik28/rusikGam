//
//  GambitTableViewController.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import UIKit

class GambitTableViewController: UITableViewController {


    var network = Network()
    
    var objects: [Gambit] = []
    
    override func viewDidLoad() {
         super.viewDidLoad()
         network.fetchEvents { products in
            self.objects = products
            self.tableView.reloadData()
        } ifFailure: {
            print("Ошибка")
        }

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "gambitCellOne", for: indexPath) as? GambitTableViewCell else { return
            UITableViewCell()
        }
        cell.set(object: objects[indexPath.row])
        return cell
        
    }
    
}




