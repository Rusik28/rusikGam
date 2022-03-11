//
//  GambitTableViewCell.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import UIKit

class GambitTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageVIewOne: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    private var number = 0
    
    @IBAction func minusButton(_ sender: UIButton) {
        
        guard number > 0 else { return }
        number -= 1
        numberLabel.text = "\(number)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        numberLabel.text = "\(number)"
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        number += 1
        numberLabel.text = "\(number)"
    }
     override func didMoveToWindow() {
        super.didMoveToWindow()
         numberLabel.text = "\(number)"
    }
    
    
    override func accessibilityDecrement() {
        super.accessibilityDecrement()
    }
        
        
        
        
    

    
    
    
    
    func set(object: Gambit) {
        self.nameLabel.text = object.name

        self.priceLabel.text = "\(object.price) ₽"
//        self.imageViewOne.image = UIImage(named: )
    }
    
}

