//
//  NetworkManager.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    
    private let API_KEY = "e2328341c6e747fa849202946242901"
    
    private let baseUrl = "https://fakestoreapi.com/products"
    
    func getProduct(url: String) async throws -> Product{
        guard let completeUrl =  URL(string: baseUrl + API_KEY + url) else {
            throw WEError.invalidURL
        }
        
        let(data, response) = try await URLSession.shared.data(from: completeUrl)
       
        do{
            let decoder = JSONDecoder()
            return try decoder.decode(Product.self, from: data)
        }catch{
            throw WEError.invalidData
        }
    }
}

