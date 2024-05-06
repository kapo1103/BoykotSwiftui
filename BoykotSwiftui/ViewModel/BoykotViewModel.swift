//
//  BoykotViewModel.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import Foundation
import Combine

@MainActor
final class BoykotViewModel: ObservableObject {
    
    @Published private(set) var urunler: [Urunler] = []
    @Published private(set) var haberler: [Haberler] = []

    func getAllUrun() async throws {
        self.urunler = try await BoykotManager.shared.getAllUrun()
        
    }
    
    func getAllHaber() async throws {
        self.haberler = try await BoykotManager.shared.getAllHaber()
        
    }
    
     func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "tr_TR")
        return dateFormatter.string(from: date)
    }
}


