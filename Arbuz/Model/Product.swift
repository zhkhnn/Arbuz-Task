//
//  Product.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import Foundation
import SwiftUI
struct Product: Identifiable {

var id = UUID()
var name: String
var image: Image
var price: Int
var count: Int = 1
    var instock: Bool
    var isSelected: Bool
    func calculateUpdatedPrice() -> Int {
        return self.count * self.price
    }
}
var categories = [
  Category(name: "Vegetables", products: [
    Product(name: "onions", image: Image("onion"), price: 10, instock: true, isSelected: false),
    Product(name: "tomatoes", image: Image("tomato"), price: 20, instock: false, isSelected: false),
    Product(name: "potatoes", image: Image("potato"), price: 30, instock: true, isSelected: false),
  ]),
  Category(name: "Milk", products: [
    Product(name: "Cheese", image: Image("cheese"), price: 40, instock: false, isSelected: false),
    Product(name: "Youghurt", image: Image("youghurt"), price: 50, instock: true, isSelected: false),
    Product(name: "Butter", image: Image("butter"), price: 30, instock: true, isSelected: false),
  ]),
  Category(name: "Fruits", products: [
    Product(name: "apple", image: Image("apple"), price: 10, instock: true, isSelected: false),
    Product(name: "oranges", image: Image("oranges"), price: 20, instock: true, isSelected: false),
    Product(name: "grapes", image: Image("grapes"), price: 30, instock: false, isSelected: false),
  ]),
]
