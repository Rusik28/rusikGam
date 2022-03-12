//
//  GambitModel.swift
//  Gambit
//
//  Created by Руслан Алиев on 11.03.2022.
//

import Foundation

struct Gambit: Decodable {
    var id: Int
    var name: String
    var image: String
    var price: Int
    var oldPrice: Int
    var description: String
//    var isFavourite: Bool
//    var modificator: Bool
}
