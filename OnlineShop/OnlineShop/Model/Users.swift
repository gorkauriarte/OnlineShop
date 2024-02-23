//
//  User.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

struct User: Hashable, Codable{
    var adress : Adress
    var id: Int
    var email: String
    var username: String
    var password: String
    var name: Name
    var phone: String
    var __v: Int
}

struct Adress: Hashable, Codable {
    var geolocation: Geolocation
    var city: String
    var street: String
    var number: Int
    var zipcode: String
}

struct Geolocation: Hashable, Codable {
    var lat: Double
    var long: Double
}

struct Name: Hashable, Codable {
    var firstname: String
    var lastname: String
}
