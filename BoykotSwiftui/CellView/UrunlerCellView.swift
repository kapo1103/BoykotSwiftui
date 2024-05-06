//
//  UrunlerCellView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import SwiftUI
import FirebaseStorage

struct UrunlerCellView: View {
    
    let urunler : Urunler
    @State private var imageURL: URL?
//    @State private var imageURL: UIImage?
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(urunler.boykot ?? false ? .kirmizi : .yesil)
                .padding()
            
            HStack {
                AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                        //.scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                            .frame(width: 75, height: 75)
                    }
                
//                Image(urunler.image ?? "")
//                    .resizable()
//                    .frame(width: 50, height: 50)
//                    .padding()
                VStack(alignment: .center) {
                    Text(urunler.urunAdi ?? "")
                        .font(.title3)
                        .foregroundColor(.white)
                    Text(urunler.bilgi ?? "")
                        .font(.subheadline)
                        .foregroundColor(.white)

                }
                .padding()
                Spacer()

            }
            
        }
        .onAppear {
            Task {
                do {
                    let downloadURL = try await StorageManager.shared.resim(path: urunler.image ?? "")
                    imageURL = downloadURL
                } catch {
                    print("Resim yüklenirken hata oluştu: \(error)")
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.2)

    }
}

#Preview {
    UrunlerCellView(urunler: Urunler(id: "AA", mesaj: "Mc Donalds", image: "AAA", boykot: true, urunAdi: "Mc Donalds", bilgi: "Kuruluş tarihi: 15 Nisan 1955, Genel merkezi: Şikago, Illinois, ABD", kategori: "Gıda"))
}
