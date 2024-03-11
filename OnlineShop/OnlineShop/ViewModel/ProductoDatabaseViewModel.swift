//
//  ProductoDatabaseViewModel.swift
//  OnlineShop
//
//  Created by  on 11/3/24.
//

import SwiftUI
import FirebaseFirestore
import Foundation

@MainActor
class ProductosDBViewModel: ObservableObject {
    
    @Published var productoDataBase: [Product] = []
    private var db = Firestore.firestore()
    
    func getAllProducts() {
        db.collection("producto").addSnapshotListener { [weak self] (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("ERROR: No hay documentos")
                return
            }
            
            self?.productoDataBase = documents.compactMap { (queryDocumentSnapshot) -> Product? in
                let data = queryDocumentSnapshot.data()
                guard
                    let identificador = data["id"] as? Int,
                    let nombre = data["nombre"] as? String,
                    let precio = data["precio"] as? Double,
                    let descrip = data["descripcion"] as? String,
                    let categoria = data["categoria"] as? String,
                    let imagen = data["imagen"] as? String,
                    let ratio = data["ratio"] as? Double
                else {
                    return nil
                }
                
                return Product(id: identificador, title: nombre, price: precio, description: descrip, category: categoria, image: imagen, rating: Rating(rate: ratio))
            }
        }
    }
    
    func addProduct() {
        do {
            var order = Order(productos: self.productoDataBase)
            
            try db.collection("product").addDocument(from: order)
            
            self.productoDataBase = []
        } catch {
            print("Error al agregar un nuevo producto")
        }
    }
}

struct Order:Encodable{
    @DocumentID var id :String?
    var productos : [Product]
}
