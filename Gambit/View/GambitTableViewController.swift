//
//  GambitTableViewController.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import UIKit
import SwiftUI

class GambitTableViewController: UITableViewController, GambitPresenterDelegate {
        var network = Network()
        var objects: [Gambit] = []
        var qqq = [Gambit]()
    
    
    func menu(menu: [Gambit]) {
        self.qqq = menu
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        network.viewDelegate(delegate: self)
        network.fetchEvents { products in
            self.objects = products
            self.tableView.reloadData()
        } ifFailure: {
            print("Ошибка")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//}
