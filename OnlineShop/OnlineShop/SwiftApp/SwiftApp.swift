//
//  SwiftApp.swift
//  OnlineShop
//
//  Created by  on 11/3/24.
//

import SwiftUI
import Firebase

@main
struct SwiftUIDemoApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
