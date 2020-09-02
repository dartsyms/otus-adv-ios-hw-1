//
//  FavoritesView.swift
//  hwappfirst
//
//  Created by sanchez on 01.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    @Binding var selectedTab: AppTab
    @Binding var selectedItem: Item
    
    var body: some View {
        NavigationView {
            if self.favorites.items.isEmpty {
                Button(action: {
                    withAnimation {
                        self.selectedTab = AppTab.content
                    }
                }) {
                    Text("Select a video")
                }
            } else {
                List {
                    Section {
                        ForEach(favorites.items) { item in
                            HStack {
                                Image(item.mainImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 80)
                                    .clipShape(Rectangle())
                                    .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item.title)
                                        .fixedSize()
                                        .multilineTextAlignment(.leading)
                                        .font(.subheadline)
                                        
                                    Text(item.released)
                                        .font(.footnote)
                                }
                                Spacer()
                                Image(systemName: "heart.fill").foregroundColor(.red)
                            .layoutPriority(1)
                            }
                            .onTapGesture {
                                self.selectedTab = AppTab.content
                                self.selectedItem = item
                                self.favorites.transitionActive = true
                            }
                            
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                .navigationBarTitle("Favorites")
                .listStyle(GroupedListStyle())
                .navigationBarItems(trailing: EditButton())
            }
            
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favorites = Favorites()
    static var previews: some View {
        FavoritesView(selectedTab: .constant(.favorites), selectedItem: .constant(Item.example))
            .environmentObject(favorites)
    }
}
