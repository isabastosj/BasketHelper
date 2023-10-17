//
//  Item.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var timestamp: Date
    var isDone: Bool
    var quantity: Int
    var price: Double
    
    init(name: String = "", timestamp: Date = .now, isDone: Bool = false, quantity: Int = 1,  price: Double = 0.0) {
        self.name = name
        self.timestamp = timestamp
        self.isDone = isDone
        self.quantity = quantity
        self.price = price
    }
}
