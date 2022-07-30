//
//  MenuItem.swift
//  MenuExample
//
//  Created by celyes on 30/7/2022.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    var name: String
    var items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case items = "items"
    }
}

struct Item: Codable, Equatable, Identifiable {
    var id = UUID()
    var name: String
    var price: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case price = "price"
    }
}
