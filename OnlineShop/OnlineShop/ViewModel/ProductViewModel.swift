//
//  ProductViewModel.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

func getProduct(url:String){
        Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
            do{
                let product = try await NetworkManager.shared.getProduct(url: url)
                // self.products = product
            }catch{
                
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




