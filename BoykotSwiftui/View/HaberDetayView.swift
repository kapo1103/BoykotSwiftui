//
//  HaberDetayView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import SwiftUI

struct HaberDetayView: View {
    
    @StateObject private var viewModel = BoykotViewModel()
    let haberler : Haberler
    @State private var imageURL: URL?

    var body: some View {
        ZStack {
            Color.arkaPlan
                .ignoresSafeArea()
            VStack { //width: UIScreen.main.bounds.width * 1/*, height: UIScreen.main.bounds.height * 0.2*/
                ZStack {

                        Rectangle()
                            .foregroundColor(.clear)
                            .background(
                                AsyncImage(url: imageURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                            )
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(viewModel.formattedDate(haberler.date ?? Date()))
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding() // Add padding for better readability
                            .background(Color.black.opacity(0.5))
                        Text(haberler.baslik ?? "")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding() // Add padding for better readability
                            .background(Color.black.opacity(0.5))
                    }
                }
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(Color.acikYesil)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 40,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 40
                            )
                        )
                    VStack {
                        ScrollView {
                            Text(haberler.icerik ?? "")
                                .font(.callout)
                                .padding()
                        }
                    }.padding()
                }/*.padding(.horizontal)*/
            }
            .task {
                do {
                    let downloadURL = try await StorageManager.shared.resim(path: haberler.baslikImage ?? "")
                    imageURL = downloadURL
                } catch {
                    print("Resim yüklenirken hata oluştu: haberdetay \(error)")
                }
            }
        } 
//            .navigationBarTitle("Ana Sayfa", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    HaberDetayView(haberler: Haberler(id: "a", date: Date(), baslik: "aa", baslikImage: "a", icerik: "aaa", icerikImage: ["aa"]))
    

}
