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
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
