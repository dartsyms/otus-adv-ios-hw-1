//
//  CheckoutView.swift
//  hwappfirst
//
//  Created by sanchez on 02.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "Gift Card"]
    static let periods = [7, 14, 21, 28, 1]
    static let pickupTimes = ["Now", "Tonight", "Tomorrow"]
    
    @State private var paymentType = 0
    @State private var addLoyalty = false
    @State private var giftCardNumber = ""
    @State private var period = 1
    @State private var showPaymentModal = false
    @State private var pickupTime = 0
    
    var totalCost: Double {
        let total = Double(order.total)
        let discount = total / 100 * Double(Self.periods[period])
        return total - discount
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Form {
                    Section {
                        Picker("How are you going to pay?", selection: self.$paymentType) {
                            ForEach(0..<Self.paymentTypes.count) {
                                Text("\(Self.paymentTypes[$0])")
                            }
                        }
                        Toggle(isOn: self.$addLoyalty.animation()) {
                            Text("Add you gift card")
                        }
                        if self.addLoyalty {
                            TextField("Enter your gift card number", text: self.$giftCardNumber)
                        }
                    }
                    
                    Section(header: Text("When are going to pick up the order")) {
                        Picker("Pickup Time", selection: self.$pickupTime) {
                            ForEach(0..<Self.pickupTimes.count) {
                                Text("\(Self.pickupTimes[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("TOTAL: $\(self.totalCost, specifier: "%.2f")").font(.largeTitle)) {
                        Button("Confirm Order") {
                            withAnimation(.easeOut(duration: 0.25)) {
                               self.showPaymentModal.toggle()
                            }
                        }
                    }
                }.navigationBarTitle(Text("Payment and Pickup"), displayMode: .inline)
                
                
                if self.$showPaymentModal.wrappedValue {
                    ZStack {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(spacing: 10) {
                            Text("Order confirmed!").font(.title).fontWeight(.bold)
                            Text("Your total: $\(self.totalCost, specifier: "%.2f")")
                            Text("pickup time: \(Self.pickupTimes[self.pickupTime].lowercased())")
                            Text("Thank you!").fontWeight(.black)
                            Button(action: {
                                withAnimation(.easeOut(duration: 0.25)) {
                                   self.showPaymentModal = false
                                }
                            }) {
                                Text("Close")
                            }
                            .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
                        }
                        .frame(width: geometry.size.width - geometry.size.width/4, height: geometry.size.height - geometry.size.height/4)
                        .background(Color.white)
                        .cornerRadius(20).shadow(radius: 20)
                    }.navigationBarHidden(true)
                }
            }
        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
