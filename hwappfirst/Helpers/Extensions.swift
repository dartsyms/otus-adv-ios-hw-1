//
//  Extensions.swift
//  hwappfirst
//
//  Created by sanchez on 01.09.2020.
//  Copyright © 2020 KOT. All rights reserved.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        var loaded: T
        do {
            loaded = try decoder.decode(T.self, from: data)
        } catch (let error){
            print(error)
            fatalError("Failed to decode \(file) from bundle.")
        }
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }

        return loaded
    }
}

