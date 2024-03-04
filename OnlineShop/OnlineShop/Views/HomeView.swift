//
//  HomeView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var productViewModel = ProductViewModel()
    @State private var selectedProduct: Product? = nil

    var body: some View {
        NavigationView {
            ZStack {
                List(productViewModel.productos) { product in
                    ProductRow(product: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
                .padding(10)
                .navigationBarTitle("Lista de Productos")

                NavigationLink(
                    destination: ProductDetailView(product: selectedProduct),
                    isActive: Binding(
                        get: { selectedProduct != nil },
                        set: { newValue in
                            if !newValue {
                                selectedProduct = nil
                            }
                        }
                    )
                ) {
                    EmptyView()
                }
                .hidden()
            }
        }
    }
}

struct ProductDetailView: View {
    var product: Product

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    // Cerrar la vista de detalle
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                }
            }

            Spacer()

                    AsyncImage(url: URL(string: product.image)){Image in
                        Image
                            .image?.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }

            Text(product.title)
                .font(.title)
                .foregroundColor(.black)
                .padding()

            Text(product.description)
                .font(.body)
                .foregroundColor(.gray)
                .padding()

            Spacer()

            Button(action: {
                // Aquí puedes agregar la lógica para agregar el producto al carrito
                // Por ahora, simplemente imprime un mensaje
                print("Añadir al carrito: \(product.title)")
            }) {
                HStack {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                    Spacer()
                    Text("$\(String(format: "%.2f", product.price))")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.purple)
                .cornerRadius(8)
                .padding()
            }
        }
                .background(Color.white)
        .cornerRadius(16)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            
    }
}

struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AsyncImage(url: URL(string: product.image)){Image in
                Image
                    .image?.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("Precio: $\(String(format: "%.2f", product.price))")
                    .font(.subheadline)
                    .foregroundColor(.gray)

            }
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}


#Preview {
    HomeView()
}


