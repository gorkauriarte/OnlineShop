//
//  NetworkManager.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
        
    private let baseUrl = "https://fakestoreapi.com/products"
    
    func getProducts() async throws -> [Product] {
            guard let completeUrl = URL(string: baseUrl) else {
                throw WEError.invalidURL
            }
            
            let (data, _) = try await URLSession.shared.data(from: completeUrl)
           
            do {
                let decoder = JSONDecoder()
                return try decoder.decode([Product].self, from: data)
            } catch {
                throw WEError.invalidData
            }
        }
}

