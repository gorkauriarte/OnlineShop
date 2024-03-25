//
//  HomeView.swift
//  OnlineShop
//
//  Created by  on 23/2/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var productViewModel = ProductViewModel()

    @State private var selectedProduct: Product?
    static let carrito: [Product] = []
    @State private var isDetailViewPresented = false
    
    var body: some View {
        NavigationView {
            List(productViewModel.productos) { product in
                NavigationLink(
                    destination: ProductDetailView(product: product, isPresented: $isDetailViewPresented),
                    tag: product,
                    selection: $selectedProduct
                ) {
                    ProductRow(product: product)
                }
            }
               
            .padding(10)
            .navigationBarTitle("Lista de Productos")
        }
    }
}


struct ProductDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var product: Product
    @Binding var isPresented: Bool
    @EnvironmentObject private var ProductosDBViewModel : ProductosDBViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
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
            
            
            HStack {
                ForEach(1..<6) { index in
                    if Double(index) - 0.5 <= product.rating.rate && product.rating.rate < Double(index) {
                        Image(systemName: "star.leadinghalf.fill")
                            .foregroundColor(.yellow)
                    } else if Double(index) <= product.rating.rate {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }
            }


            Spacer()

            Button(action: {
                self.ProductosDBViewModel.productoDataBase.append(product)
                isPresented = false
                presentationMode.wrappedValue.dismiss()
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


