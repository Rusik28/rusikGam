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
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    
    public var number = 0
    let defaults = UserDefaults.standard
    var id = 0
    static let identifier = "gambitCellOne"

    func set(object gambit: Gambit) {
         self.nameLabel.text = gambit.name
         self.priceLabel.text = "\(gambit.price) ₽"
         self.imageViewOne.downloaded(from: gambit.image)
         self.id = gambit.id
}
     
    
    func plus(_ plus: Bool) {
        if plus { number += 1 }
        else { number -= 1 }
    }
    
    func buttonA(_ action: Bool){
      menuButton.isHidden = action
  }
    
    func saveCount( _ countFood: Int) {
        numberLabel.text = String(countFood)
        defaults.set(countFood, forKey: String(id))
    }
    
    @IBAction func plusMenu(_ sender: UIButton) {
        plus(true)
        saveCount(number)
        buttonA(true)
    }
   
    @IBAction func plusOne(_ sender: UIButton) {
        number += 1
        numberLabel.text = "\(number)"
 //       plus(true)
 //       saveCount(number)
}
    override func didMoveToWindow() {
    super.didMoveToWindow()
    numberLabel.text = "\(number)"
        
}
   
    @IBAction func minusOne(_ sender: UIButton) {
        guard number > 0 else { return }
            number -= 1
            numberLabel.text = "\(number)"
 //       plus(false)
 //       saveCount(number)
            if number == 0 {
            buttonA(false)
    }
    }
    
    override func awakeFromNib() {
           super.awakeFromNib()
           numberLabel.text = "\(number)"
       }
    
}
    
    
    
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
    
    
//    @IBAction func minusLabel(_ sender: UIButton) {
//        guard number > 0 else { return }
//        number -= 1
//        numberLabel.text = "\(number)"
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        numberLabel.text = "\(number)"
//
//    }
//
//    @IBAction func plusButton(_ sender: UIButton) {
//        number += 1
//        numberLabel.text = "\(number)"
//    }
//
//     override func didMoveToWindow() {
//        super.didMoveToWindow()
//         numberLabel.text = "\(number)"
//    }
//
    

    



