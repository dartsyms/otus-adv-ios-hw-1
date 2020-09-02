//
//  Favorites.swift
//  hwappfirst
//
//  Created by sanchez on 02.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var items = [Item]()
    @Published var transitionActive = false
    
    func add(item: Item) {
        items.append(item)
    }
    
    func remove(item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
