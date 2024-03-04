//
//  ProductViewModel.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject{
    
    @Published var productos: [Product] = []
   
    init() {
            Task {
                await getProducts()
            }
        }
    
    func getProducts(){
            Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
                do {
                            let products = try await NetworkManager.shared.getProducts()
                            self.productos.append(contentsOf: products)
                } catch {
                    
                    if let callError = error as? WEError {
                        switch callError{
                        case .invalidURL:
                            print("Invalid URL")
                        case .invalidResponse:
                            print("Invalid response")
                        case .invalidData:
                            print("Invalid data")
                        case .unableToComplete:
                            print("Unable to complete")
                        }
                        
                    }else{
                        //Generic error
                        print("Invalid response")
                    }
                }
            }
        }
}




