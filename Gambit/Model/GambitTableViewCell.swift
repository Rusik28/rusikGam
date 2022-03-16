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
    @IBOutlet weak var numberLabel: UILabel!
    
     public var number = 0
//     var button1: UIButton = {
//            let button = UIButton()
//            button.frame = CGRect(x: 300, y: 99, width: 32, height: 32)
//            button.backgroundColor = .blue
//            return button
//       }()
//
//     var button2: UIButton = {
//            let button = UIButton()
//            button.frame = CGRect(x: 360, y: 99, width: 32, height: 32)
//            button.backgroundColor = .blue
//            button.isHidden = true
//            return button
//        }()
    
//
//     var button3: UIButton = {
//           let button = UIButton()
//           button.frame = CGRect(x: 296, y: 99, width: 98, height: 32)
//           button.backgroundColor = .blue
//           button.isHidden = true
//           return button
//       }()
   
    
//
//    override func accessibilityDecrement() {
//        super.accessibilityDecrement()
//        button1.addTarget(self, action: #selector(minusLabel(_:)), for: .touchUpInside)
//        button2.addTarget(self, action: #selector(plusButton(_:)), for: .touchUpInside)
//        button3.addTarget(self, action: #selector(clear(_:)), for: .touchUpInside)
//    }
    
    
    @IBAction func minusLabel(_ sender: UIButton) {
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
        
    
    @IBAction func clear(_ sender: UIButton) {
     //   if sender.tag == 1 && ( == 1) {
   //             makeButtonSpawn2().isHidden = false

    }
    
//    @objc func buttonClear(_ sender: UIButton) {
//        if monkeyPosition == 1 {
//            button1.isHidden = false
//            button2.isHidden = false
//        }
//    }
    
    
    
    
    
    

    static let identifier = "gambitCellOne"

    func set(object gambit: Gambit) {
         self.nameLabel.text = gambit.name
         self.priceLabel.text = "\(gambit.price) ₽"
         self.imageViewOne.downloaded(from: gambit.image)

   }

}


