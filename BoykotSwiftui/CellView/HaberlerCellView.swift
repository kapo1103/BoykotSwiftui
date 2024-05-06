//
//  HaberlerCellView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import SwiftUI

struct HaberlerCellView: View {
    
    let haberler : Haberler
    @State private var imageURL: URL?
    @StateObject private var viewModel = BoykotViewModel()
    var body: some View {
        
        //            ZStack(alignment: .bottom) {
        VStack(spacing: 0) {
            Text(viewModel.formattedDate(haberler.date ?? Date()))
                .font(.caption)
                .foregroundColor(.primary)
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.5)
                .background(
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        //                                    .frame(width: 75, height: 75)
                            .cornerRadius(30)
                    } placeholder: {
                        ProgressView()
                        //                                    .frame(width: 75, height: 75)
                    }
                )
                .cornerRadius(50)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 16, y: 16)
            
            Text(haberler.baslik ?? "")
                .foregroundColor(.cyan)
                .bold()
                .font(.title)            
            
        }
        .padding()
        .onAppear {
            Task {
                do {
                    let downloadURL = try await StorageManager.shared.resim(path: haberler.baslikImage ?? "")
                    imageURL = downloadURL
                } catch {
                    print("Resim yüklenirken hata oluştu: \(error)")
                }
            }
        }
    }
}
#Preview {
    HaberlerCellView(haberler: Haberler(id: "aa",date: Date(), baslik: "aaaa", baslikImage: "a", icerik: "aaa", icerikImage: ["aa"]))}

