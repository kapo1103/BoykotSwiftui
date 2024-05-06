//
//  StorageManager.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 14.12.2023.
//

import Foundation
import FirebaseStorage
import UIKit

final class StorageManager {
    
    static let shared = StorageManager()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    func getData(path: String) async throws -> Data {
        try await storage.child(path).data(maxSize: 3 * 1024 * 1024)
    }
    
    func getImage(path: String) async throws -> UIImage {
        let data = try await getData(path: path)
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        return image
    }
    
    
    func resim(path: String) async throws -> URL {
        return try await withCheckedThrowingContinuation { continuation in
            let storageRef = Storage.storage().reference(withPath: path)
            storageRef.downloadURL { (url, error) in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    if let downloadURL = url {
                        continuation.resume(returning: downloadURL)
                    }
                }
            }
        }
    }


}
