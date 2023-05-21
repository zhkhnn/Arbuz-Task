//
//  OrderView.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import SwiftUI

extension String{
    var isNumeric: Bool{
        Double(self) != nil
    }
}

struct OrderView: View {
    @State private var information = Information(
            deliveryDate: Date(),
            deliveryTime: Date(),
            address: "",
            name: "",
            phoneNumber: "",
            email: "",
            subscriptionDate: Date(),
            subscriptionDetails: ""
        )
    @Binding var isPresented: Bool

    
    private var isDeliveryFormValid: Bool {
        !information.address.isEmpty && !information.name.isEmpty && !information.phoneNumber.isEmpty && isValidEmail(information.email) && information.phoneNumber.isNumeric
        }
        
        private var isSubscriptionFormValid: Bool {
            !information.name.isEmpty && !information.phoneNumber.isEmpty && isValidEmail(information.email)
        }
    
        
        private func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 230/255, blue: 109/255)
            NavigationView{
                VStack {
                    Section(header: Text("Delivery Details").font(.title2).fontWeight(.bold)) {
                        
                        VStack{
                            Spacer()
                            DatePicker("Delivery Date", selection: $information.deliveryDate, displayedComponents: .date)
                                .frame(width: 200, height: 100)
                                .datePickerStyle(.compact)
                                .accentColor(.blue)
                                .labelsHidden()
                            
                            DatePicker("Delivery Time", selection: $information.deliveryTime, displayedComponents: .hourAndMinute)
                                .datePickerStyle(.wheel)
                                .frame(width: 200, height: 100)
                                .clipped()
                            
                            TextField("Address", text: $information.address)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .padding(5)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                            
                            TextField("Name", text: $information.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(5)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                            
                            TextField("Phone Number", text: $information.phoneNumber)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.phonePad)
                                                    .padding(5)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                            
                            TextField("Email", text: $information.email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.emailAddress)
                                                    .padding(5)
                                                    .background(Color.white)
                                                    .cornerRadius(10)
                            
                        }
                    }
                    Section(header: Text("Subscription Details").font(.title2).fontWeight(.bold)) {
                        Text("Please choose subscription expiration date").padding(.top, 20)
                        DatePicker("Date", selection: $information.subscriptionDate, displayedComponents: .date)
                            .frame(width: 200, height: 100)
                            .datePickerStyle(.compact)
                            .accentColor(.blue)
                            .labelsHidden()
                                            .background(Color.white)
                                            .cornerRadius(10)
                        
                        TextField("Additional subscription fields...", text: $information.subscriptionDetails)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                            .background(Color.white)
                                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        print("check")
                    }) {
                        NavigationLink(destination: SubscriptionView(information: information)){
                            Text("Check Info")
                                .padding()
                           
                        }
                        
                    }
                    .cornerRadius(50)
                    .background(Color(red: 255/255, green: 230/255, blue: 109/255))
                    .disabled(!isDeliveryFormValid && !isSubscriptionFormValid)
                    .padding()
                    
                }
                .toolbar{
                    Button(action: {
                        isPresented = false
                    }){
                        Image(systemName: "xmark")
                    }
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}
