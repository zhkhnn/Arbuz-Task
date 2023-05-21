//
//  CartView.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State var updatedPrice: Int = 0
    @State private var isPresented = false
        
    var body: some View {
        ScrollView {
                    
                        if cartManager.products.count > 0 {
                            ForEach(cartManager.products, id: \.id) { product in
                                ProductRow(product: product, count: product.count)
                            }
                            
                            HStack {
                                Text("Your cart total is")
                                Spacer()
                                Text("$\(cartManager.total).00")
                                    .bold()
                            }
                            .padding()
                            
                            
                        } else {
                            Text("Your cart is empty.")
                        }
            Text("Keep in mind that the weight of large vegetables and fruits may be different❤️").font(.headline).padding()
                }
                .navigationTitle(Text("My Cart"))
                .padding(.top)
        Button(action: {
            isPresented.toggle()
        }){
            Text("Subscribe!")
                .foregroundColor(.black)
                .padding()
        }
        .background(Color(red: 255/255, green: 230/255, blue: 109/255))
        .cornerRadius(30)
        .padding()
        .sheet(isPresented: $isPresented){
            OrderView(isPresented: $isPresented)
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
                    .environmentObject(CartManager())    }
}
