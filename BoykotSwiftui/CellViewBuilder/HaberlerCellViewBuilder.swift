//
//  HaberlerCellViewBuilder.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import SwiftUI

struct HaberlerCellViewBuilder: View {
    
    @State private var haberler: Haberler? = nil
    
    var body: some View {
        ZStack {
            if let haberler {
                HaberlerCellView(haberler: haberler)
            }
        }
    }
}

#Preview {
    HaberlerCellViewBuilder()
}
