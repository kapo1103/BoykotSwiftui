//
//  Urunler.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import Foundation

struct Urunler : Identifiable, Codable {
    let id : String
    let mesaj : String?
    let image: String?
    let boykot: Bool?
    let urunAdi: String?
    let bilgi: String?
    let kategori: String?
}
