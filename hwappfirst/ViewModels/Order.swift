//
//  Order.swift
//  hwappfirst
//
//  Created by sanchez on 02.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var orderedItems = [Item]()
    
    var total: Int {
        return orderedItems.count > 0 ? orderedItems.reduce(0) { $0 + $1.price } : 0
    }
    
    func add(item: Item) {
        orderedItems.append(item)
    }
    
    func remove(item: Item) {
        if let index = orderedItems.firstIndex(of: item) {
            orderedItems.remove(at: index)
        }
    }
}
