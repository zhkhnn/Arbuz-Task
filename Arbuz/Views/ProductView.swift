//
//  ProductView.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI

    struct ProductView: View {
      @State var product: Product
      @State private var count = 1
      @State private var showAlert = false
      @Environment(\.presentationMode) var presentationMode
      @EnvironmentObject var cartManager: CartManager
      private var canIncrementCount: Bool {
        return product.instock
      }
      
      private var canDecrementCount: Bool {
        return count > 1 && product.instock
      }
      
      var body: some View {
          
          if(!product.instock){
              Text("Sorry, product is out of stock")
                  .foregroundColor(Color.red)
                  .padding()
          }
          ZStack {
              Color(red: 239/255, green: 211/255, blue: 215/255)
              HStack {
                
              product.image
                .resizable()
                .frame(width: 100, height: 100)
                
              VStack(alignment: .leading) {
                Text(product.name)
                  Text("$\(product.calculateUpdatedPrice())")
                HStack {
                  Button(action: {
                    if canDecrementCount {
                        product.count -= 1
                        count -= 1
                    } else {
                      showAlert = true
                    }
                  }) {
                    Image(systemName: "minus.circle")
                      .foregroundColor(canDecrementCount ? .red : .gray)
                  }
                  Text("\(count)")
                  Button(action: {
                    if canIncrementCount {
                        product.count += 1
                        count += 1
                    } else {
                      showAlert = true
                    }
                  }) {
                    Image(systemName: "plus.circle")
                      .foregroundColor(canIncrementCount ? .red : .gray)
                  }
                }
                .alert(isPresented: $showAlert) {
                  Alert(
                    title: Text("Out of Stock"),
                    message: Text("This product is currently out of stock. Please try again later."),
                    dismissButton: .default(Text("OK"))
                  )
                }
              }
              Spacer()
              Button(action: {
                  cartManager.addToCart(product: product)
                  product.isSelected = true
                      presentationMode.wrappedValue.dismiss()
              }) {

                  Text("Add to the basket")
                      .foregroundColor(.black)
                      .padding()
              }
              .background(Color(red: 254/255, green: 234/255, blue: 250/255))
              .cornerRadius(30)
              .padding()
              .disabled(!product.instock || count < 1)
            }
              .background(Color(red: 239/255, green: 211/255, blue: 215/255))
          }

          .edgesIgnoringSafeArea(.all)

      }
    }



