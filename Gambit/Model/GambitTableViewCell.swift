//
//  GambitTableViewCell.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import UIKit

class GambitTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageViewOne: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBAction func clear(_ sender: UIButton) {
    
        
    }

//    let documentsUrl = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
//    lazy var imgUrl =  documentsUrl.appendingPathComponent("https://api.gambit-app.ru/category/39?page=1")

   func set(object: Gambit) {
        self.nameLabel.text = object.name
        self.priceLabel.text = "\(object.price) ₽"
//
//        if (FileManager.default.fileExists(atPath:imgUrl.path))
//    {
//
//        do
//        {
//            let data = try? Data(contentsOf: imgUrl)
//            self.imageViewOne.image = UIImage(data: data!)
//        }
//
//        catch {
//               print(error)
//            }
//        }
//
//        else
//        {
//            self.imageViewOne.image = UIImage(named:"https://api.gambit-app.ru/category/39?page=1")
//        }
//    }
//
//}

//  let url = URL(string: "https://api.gambit-app.ru/category/39?page=1")
//   let task = URLSession.shared.dataTask(with: "https://api.gambit-app.ru/category/39?page=1")
//   let foods = try JSONDecoder().decode([Gambit].self, from: data)
//
   }
}
