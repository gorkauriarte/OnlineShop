//
//  ContentView.swift
//  OnlineShop
//
//  Created by  on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    @StateObject private var productViewModel = ProductosDBViewModel()

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
                        ZStack {
                            Image(systemName: "cart")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding(6)
                                .background(Color.red)
                                .clipShape(Circle())

                            if productViewModel.productoDataBase.count > 0 {
                                Text("\(productViewModel.productoDataBase.count)")
                                    .foregroundColor(.white)
                                    .font(.caption)
                                    .offset(x: 10, y: -10)
                            }
                            else {
                                Text("Order")
                            }
                        }
                        .padding(10)
                    }
                    .tag(3)
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
            .environmentObject(productViewModel)
        }
    }
}




#Preview {
    ContentView()
}
