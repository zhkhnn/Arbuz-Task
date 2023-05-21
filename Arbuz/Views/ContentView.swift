//
//  ContentView.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI

struct ContentView: View {
    var products: Product
    @State var search: String
    @StateObject var cartManager = CartManager()
    @State var updatedPrice: Int = 0
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 255/255, green: 230/255, blue: 109/255)
                VStack(alignment: .trailing, spacing: 16) {
                    Text("Arbuz delivery app")
                        .fontWeight(.bold)
                        .font(.title)
                    Text("What would you order?")
                        .fontWeight(.medium)
                        .font(.caption)
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search for product", text: $search)
                        }
                        .padding()
                        .background(Color(.white))
                        .cornerRadius(10.0)
                        
                        Spacer()
                    }
                    .padding()
                    
                    List(categories) { category in
                        Section(header: Text(category.name).foregroundColor(.black)) {
                            ForEach(category.products) { product in
                                NavigationLink(destination: ProductView(product: product).environmentObject(cartManager)) {
                                    HStack {
                                        product.image
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        VStack(alignment: .leading) {
                                            Text(product.name)
                                            Text("$\(product.price)")
                                            Image(systemName: cartManager.products.contains(where: { $0.id == product.id }) ? "checkmark.circle.fill" : "circle")
                                                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                                                                .foregroundColor(product.isSelected ? .blue : .gray)
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                    .id(product.id)
                                }
                            }
                        }
//                        .background(Color(red: 254/255, green: 234/255, blue: 250/255))
                        .cornerRadius(20)
//                        .listStyle(PlainListStyle())
//                        .listRowBackground(Color(red: 254/255, green: 234/255, blue: 250/255))
                    }
                    .background(Color(red: 254/255, green: 234/255, blue: 250/255))
                }
                
                .toolbar{
                    NavigationLink {
                                        CartView()
                                            .environmentObject(cartManager)
                                    } label: {
                                        CartButton(numberOfProducts: cartManager.products.count)
                                    }
                                    
                }
            .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}
