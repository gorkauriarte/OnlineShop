//
//  OrderView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct OrderView: View {

    var body: some View {
        VStack {
            HStack {
                Text("Lista de Compra")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            List {
                HStack {
                   
                    VStack(alignment: .leading) {
                        Text("asdas")
                            .font(.headline)
                        Text("precio")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            .padding()

            Spacer()

            Button(action: {
            }) {
                Text("Comprar")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 50)
        }
    }
}
#Preview {
    OrderView()
}
