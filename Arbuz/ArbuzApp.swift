//
//  ArbuzApp.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI

@main
struct ArbuzApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(products: Product(name: "", image: Image(""), price: 0, instock: false, isSelected: false), search: "", updatedPrice: 0)
        }
    }
}
