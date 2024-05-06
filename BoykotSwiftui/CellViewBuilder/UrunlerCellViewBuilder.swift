//
//  UrunlerCellViewBuilder.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import SwiftUI

struct UrunlerCellViewBuilder: View {
    
    @State private var urunler: Urunler? = nil
    
    var body: some View {
        ZStack {
            if let urunler {
                UrunlerCellView(urunler: urunler)
            }
        }
    }
}

#Preview {
    UrunlerCellViewBuilder()
}
