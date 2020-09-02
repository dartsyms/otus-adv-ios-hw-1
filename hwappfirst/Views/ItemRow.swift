//
//  ItemRow.swift
//  hwappfirst
//
//  Created by sanchez on 01.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    
    static let colors: [String: Color] = ["TV-14": .green, "TV-MA": .red, "TV-PG": .orange, "PG": .black, "R": .purple, "PG-13": .blue, "TV-Y7": .yellow, "Unrated": .gray]
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
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
                    
                    Text(item.rated)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[item.rated, default: .gray])
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }
            .layoutPriority(1)
            }
            Spacer()
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item.example)
    }
}
