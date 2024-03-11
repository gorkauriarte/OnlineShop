//
//  ContentView.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false

    var body: some View {
        NavigationView {
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
            .navigationBarItems(trailing:
                Button(action: {
                    isDarkMode.toggle()
                }) {
                    Image(systemName: "paintbrush")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            )
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

#Preview {
    ContentView()
}
