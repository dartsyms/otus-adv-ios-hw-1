//
//  AppView.swift
//  hwappfirst
//
//  Created by sanchez on 01.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

enum AppTab: Int {
    case favorites, content, order
}

struct AppView: View {
    @State private var selectedTab = AppTab.favorites
    @State private var selectedItem = Item.example
    
    var body: some View {
        TabView(selection: self.$selectedTab) {
            FavoritesView(selectedTab: self.$selectedTab, selectedItem: self.$selectedItem)
                .tabItem {
                   Image(systemName: "heart")
                   Text("Favorites")
                }.tag(AppTab.favorites)
            
            ContentView(selectedItem: self.$selectedItem)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Catalog")
                }.tag(AppTab.content)
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }.tag(AppTab.order)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static let favorites = Favorites()
    static var previews: some View {
        AppView()
            .environmentObject(order)
            .environmentObject(favorites)
    }
}
