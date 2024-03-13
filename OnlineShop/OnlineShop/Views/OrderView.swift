//
//  OrderView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var vm: ProductosDBViewModel
    
    var body: some View {
        VStack {
            List(vm.productoDataBase) { producto in
                ProductoFila(producto: producto)
            }
            
            Button(action: {
                self.vm.addProduct()
            }) {
                Text("\(String(format: "%.2f", calculateTotal())) € - Checkout")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }

    private func calculateTotal() -> Double {
        return vm.productoDataBase.reduce(0.0) { $0 + $1.price }
    }
}

struct ProductoFila: View {
    var producto: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: producto.image)) { imagen in
                if let image = imagen.image {
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
            
            VStack(alignment: .leading) {
                Text(producto.title)
                Text("$ \(String(format: "%.2f", producto.price))")
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .padding()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

