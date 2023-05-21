//
//  SubscriptionView.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI
import ConfettiSwiftUI

struct SubscriptionView: View {
    var information: Information
    @State private var counter = 0


    var body: some View {
        
        VStack {
            Button(action: {
                counter += 1
            }){
                Text("🥳").font(.system(size: 50))
            }
            .confettiCannon(counter: $counter, num: 300, colors: [.yellow, .green, .red], radius: 500.0)
            VStack {
                    Text("Delivery Details").font(.title2).fontWeight(.bold)
                        .padding()
                    Text("Delivery Date: \(formattedDate(information.deliveryDate))")
                        .font(.title3)
                    Text("Delivery Time: \(formattedTime(information.deliveryTime))")
                        .font(.title3)
                    Text("Address: \(information.address)")
                        .font(.title3)
                    Text("Name: \(information.name)")
                        .font(.title3)
                    Text("Phone Number: \(information.phoneNumber)")
                        .font(.title3)
                    Text("Email: \(information.email)")
                        .font(.title3)
                    
                    Text("Subscription Details").font(.title2).fontWeight(.bold)
                        .padding()
                    Text("Subscription Date: \(formattedDate(information.subscriptionDate))")
                        .font(.title3)
                    Text("Subscription Details: \(information.subscriptionDetails)")
                        .font(.title3)
                }
            .padding()
        }
        
    }
    private func formattedDate(_ date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            return dateFormatter.string(from: date)
        }
        
        private func formattedTime(_ time: Date) -> String {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: time)
        }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView(information: Information(deliveryDate: Date(), deliveryTime: Date(), address: "", name: "", phoneNumber: "", email: "", subscriptionDate: Date(), subscriptionDetails: ""))
    }
}
