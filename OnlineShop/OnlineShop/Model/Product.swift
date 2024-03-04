//
//  Product.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

struct Product: Hashable, Codable, Identifiable{
    var id : Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
}

struct Rating: Hashable, Codable {
    var rate: Double
    var count: Double
}
