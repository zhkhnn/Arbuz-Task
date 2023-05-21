//
//  ProductRow.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    @State var product: Product
    @State var count: Int
    @State private var showAlert = false
    @State var updatedPrice: Int = 0
    



        
        var body: some View {
            HStack(spacing: 20) {
                product.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.name)
                        .bold()

                    Text("$\(product.calculateUpdatedPrice())")
                    Text("Count: \(product.count)")
                }
                
                Spacer()

                Image(systemName: "trash")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .onTapGesture {
                        cartManager.removeFromCart(product: product)
                    }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
}

