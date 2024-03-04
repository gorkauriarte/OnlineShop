//
//  ProductViewModel.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import Foundation

@MainActor
class ProductViewModel: ObservableObject{
    
    @Published var tiempo: [Product] = []
    
    init(){
        getProduct(url: "&q=Gasteiz&days=5"); // CAMBIAR
    }
    
    func getProduct(url:String){
            Task{ //hace que sea asíncrona la tarea, consiguiendo concurrencia
                do{
                    let weather = try await NetworkManager.shared.getProduct(url: url)
                    self.tiempo.append(weather)
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
}




