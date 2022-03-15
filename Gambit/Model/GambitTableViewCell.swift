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

    static let identifier = "gambitCellOne"
    
    func set(object: Gambit) {
         self.nameLabel.text = object.name
         self.priceLabel.text = "\(object.price) ₽"
//         self.imageViewOne.downloaded(from: object.image)

   }

}

