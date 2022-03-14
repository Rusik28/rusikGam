//
//  GambitTableViewController.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import UIKit
import SwiftUI

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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favourite = favouriteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favourite])
    }
    
    func favouriteAction(at indexPath: IndexPath) -> UIContextualAction {
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            object.isFavourite = !(object.isFavourite ?? true)
            self.objects[indexPath.row] = object
            completion(true)
        }
        action.backgroundColor = object.isFavourite ?? true ? .systemGray: .systemRed
        action.image = UIImage(systemName:  "heart")
        return action
        
}

}
