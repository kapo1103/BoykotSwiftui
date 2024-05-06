//
//  Haberler.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import Foundation

struct Haberler : Identifiable, Codable {
    let id : String
    let date: Date?
    let baslik: String?
    let baslikImage : String?
    let icerik : String?
    let icerikImage : [String]?
}

