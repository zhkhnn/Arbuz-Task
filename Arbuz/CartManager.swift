//
//  CartManager.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import Foundation
class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    @Published private(set) var count: Int = 0

    
    @Published var paymentSuccess = false
    
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.calculateUpdatedPrice()
        count += product.count
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.calculateUpdatedPrice()
    }
    
}
