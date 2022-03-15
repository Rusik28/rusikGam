//
//  GambitTableViewController.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import UIKit
import SwiftUI

class GambitTableViewController: UITableViewController {


//    var sentData:String
    var network = Network()
    var objects: [Gambit] = []
//    var imageURLs = [String]()

    override func viewDidLoad() {
         super.viewDidLoad()
         network.fetchEvents { products in
            self.objects = products
            self.tableView.reloadData()
        } ifFailure: {
            print("Ошибка")
        }
    }
//        imageURLs = ["https://api.gambit-app.ru/uploads/products/tsTqFAIa4r2GfQ7sBJgtRclzRlT9cUlW.png", "https://api.gambit-app.ru/uploads/products/QbBGFpiHk65ckoWT-SLT2-wzK25o3tNh.jpg", "https://api.gambit-app.ru/uploads/products/fzY_BNDilydwsTvz7it3bNtYnIfC77Uc.png"]
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//
//    }



    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }


//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "gambitCellOne", for: indexPath)
//        let cell2: GambitTableViewCell = tableView.dequeueReusableCell(withIdentifier: "gambitCellOne") as! GambitTableViewCell
//        let imagename = UIImage(named: imageURLs[indexPath.row])
//        cell2.imageViewOne.image = imagename
//


//        let imageView = cell.viewWithTag(1) as! UIImageView
//
//          imageView.sd_setImage(with: URL(string: imageURLs[indexPath.row]))
//
//        return cell

  
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

