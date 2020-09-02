//
//  ContentView.swift
//  hwappfirst
//
//  Created by sanchez on 28.08.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var favorites: Favorites
    let catalog = Bundle.main.decode([Catalog].self, from: "mockdata.json")
    
    @Binding var selectedItem: Item
    @State private var isLinkActive = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(catalog) { section in
                    Section(header: Text(section.folder.capitalized)) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                            if self.favorites.transitionActive && self.selectedItem == item && self.selectedItem != Item.example {
                                NavigationLink(destination: ItemDetail(item: item), isActive: self.$favorites.transitionActive) {
                                    Spacer().fixedSize()
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Catalog")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let favorites = Favorites()
    static var previews: some View {
        ContentView(selectedItem: .constant(Item.example)).environmentObject(favorites)
    }
}
