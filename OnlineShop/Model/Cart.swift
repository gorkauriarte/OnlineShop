//
//  Cart.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

struct Cart: Hashable, Codable{
    var id : Int
    var userId: Int
    var date: Date
    var products: [Products]
    var __v: Int
}

struct Products: Hashable, Codable {
    var productId: Int
    var quantity: Int
}
