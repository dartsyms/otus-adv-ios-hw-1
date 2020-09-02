//
//  Catalog.swift
//  hwappfirst
//
//  Created by sanchez on 01.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

struct Catalog: Codable, Identifiable {
    var id: Int
    var folder: String
    var items: [Item]
}

struct Item: Codable, Identifiable, Equatable {
    var id: Int
    var title: String
    var year: String
    var price: Int
    var plot: String
    var genre: [String]
    var rated: String
    var released: String
    var runtime: String
    var director: String
    var writer: String
    var actors: String

    var mainImage: String {
        title.replacingOccurrences(of: "[^A-Za-z0-9]+", with: "", options: [.regularExpression]).lowercased()
    }
    
    #if DEBUG
    static let example = Item(id: 45, title: "Supernatural", year: "2005–2020", price: 18, plot: "This television drama is about the two Winchester brothers, Sam and Dean, who were raised by their father, John, to hunt and kill all things that go \"bump in the night\" after his wife, Mary, was murdered by an evil supernatural being when the boys were young. 22 years later the brothers set out on a journey, fighting evil along the way, to find their recently missing father who, when they finally meet up with, reveals he knows what killed their mother, a demon, and has found a way to track and kill it. Meanwhile, Sam starts to develop frightening abilities that include death visions, visions of people dying before it actually happens. These visions are somehow connected to the demon who murdered his mother and its mysterious plans that seem to be all about Sam. When their father dies striking a deal with the very same devil that had killed his wife, the brothers, now alone and without their mentor, are determined to finish the crusade their father started. But disturbing revelations about Sam's part in the demon\'s apocalyptic plans are presented when John's dying last words to Dean are revealed.", genre: ["Drama", "Fantasy", "Horror", "Mystery", "Thriller"], rated: "TV-14", released: "", runtime: "", director: "", writer: "", actors: "")
    #endif
}


