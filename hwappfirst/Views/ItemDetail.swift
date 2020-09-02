//
//  ItemDetail.swift
//  hwappfirst
//
//  Created by sanchez on 01.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    var item: Item
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.item.mainImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(alignment: .center)
                        .padding()
                    Text("Released: \(self.item.year)")
                        .padding(4)
                        .background(Color.white)
                        .font(.caption)
                        .opacity(0.8)
                        .foregroundColor(.black)
                        .offset(x: -5, y: -5)
                }
                
                ScrollView {
                    Text(self.item.plot)
                        .padding()
                }
                
                Button(action: {
                    if self.favorites.items.contains(self.item) {
                        self.favorites.remove(item: self.item)
                    } else {
                        self.favorites.add(item: self.item)
                    }
                }) {
                    HStack {
                        if self.favorites.items.contains(self.item) {
                            Image(systemName: "heart.fill")
                                .font(.subheadline)
                        } else {
                            Image(systemName: "heart")
                            .font(.subheadline)
                        }
                        
                        Text("Add to Favorites")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .frame(width: geometry.size.width - geometry.size.width/4, height: 20)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    
                }
                
                Button(action: {
                    self.order.add(item: self.item)
                }) {
                    HStack {
                        Image(systemName: "cart")
                            .font(.subheadline)
                        Text("Order This for $\(self.item.price).99")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .frame(width: geometry.size.width - geometry.size.width/4, height: 20)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.secondary]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    
                }
                .disabled(self.order.orderedItems.contains(self.item))
                .opacity(self.order.orderedItems.contains(self.item) ? 0.6 : 1.0)
                Spacer()
            }
        }
        .navigationBarTitle(Text(self.item.title), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static let favorites = Favorites()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: Item.example)
                .environmentObject(order)
                .environmentObject(favorites)
        }
        
    }
}
