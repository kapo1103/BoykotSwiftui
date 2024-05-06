//
//  BoykotManager.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift
import Combine

final class BoykotManager {
    
    static let shared = BoykotManager()
    private init() { }
    
    private let urunlerCollection = Firestore.firestore().collection("urunler")
    
    private let haberlerCollection = Firestore.firestore().collection("haberler")

    func getAllUrun() async throws -> [Urunler] {
        let querySnapshot = try await urunlerCollection.getDocuments()
        return try querySnapshot.documents.compactMap { document in
            try document.data(as: Urunler.self)
            
        }
    }
    
    func getAllHaber() async throws -> [Haberler] {
        let querySnapshot = try await haberlerCollection.getDocuments()
        return try querySnapshot.documents.compactMap { document in
            try document.data(as: Haberler.self)
            
        }
    }
}
