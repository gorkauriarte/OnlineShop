//
//  OnlineShopApp.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI
import Firebase


@main
struct OnlineShopApp: App {
    var productvm :ProductosDBViewModel
    init() {
        FirebaseApp.configure()
        productvm =  ProductosDBViewModel()

    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(productvm)
        }
    }
}
