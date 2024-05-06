//
//  HaberView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import SwiftUI

struct HaberView: View {
    @StateObject private var viewModel = BoykotViewModel()
    
    var body: some View {
        ZStack {

            NavigationView {
                
                TabView {/*viewModel.urunler*/
                    ForEach(viewModel.haberler.sorted(by: { $0.date ?? Date() > $1.date ?? Date() }), id: \.id) { haberler in
                        //                    if urunler.kategori ?? "" == selectedCategory || selectedCategory == "Hepsi" {
                        NavigationLink(destination: HaberDetayView(haberler: haberler)) {
                            HaberlerCellView(haberler: haberler)
                        }
                        //                    }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .background(Color(.arkaPlan))
                .task {
                    do {
                        try await viewModel.getAllHaber()
                    } catch {
                        print("haberlerview: \(error)")
                    }
                }
            }
        }
    }
}

#Preview {
    HaberView()
}
