//
//  Card.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import Foundation
struct CartItem: Identifiable {
   var id: String
   var product: Product
   var count: Int
init(product: Product, count: Int) {
   self.id = UUID().uuidString
   self.product = product
   self.count = count
}}
