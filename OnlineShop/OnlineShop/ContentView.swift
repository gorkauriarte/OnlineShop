//
//  ContentView.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Order")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
