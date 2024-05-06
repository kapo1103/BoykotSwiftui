//
//  UrunlerView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import SwiftUI
import Combine

struct UrunlerView: View {
    
    @StateObject private var viewModel = BoykotViewModel()
    @State private var searchText = ""
    @State private var selectedCategory = "Hepsi"
    
    let categories: [(String, String)] = [
        ("Hepsi", "wallet.pass.fill"),
        ("Gıda ve İçecek", "basket.fill"),
        ("Teknoloji", "laptopcomputer.and.ipad"),
        ("Giyim ve Moda", "figure.dress.line.vertical.figure"),
        ("Güzellik ve Kişisel Bakım", "personalhotspot.circle.fill"),
        ("Dizi, Film ve Hobi", "sparkles.tv.fill"),
        ("Banka", "dollarsign.arrow.circlepath")
    ]
    
    var filteredUrunler: [Urunler] {
        if searchText.isEmpty {
            return viewModel.urunler
        } else {
            return viewModel.urunler.filter { urunler in
                return urunler.urunAdi?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
    }
    
    var body: some View {

        ZStack {
        NavigationView {
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                        .padding()
                    TextField("Burada Arama Yapabilirsiniz", text: $searchText)
                        .foregroundColor(.primary)
                        .padding()
                }
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        ForEach(categories, id: \.0) { categoryName, logoName in
                            Button(action: {
                                selectedCategory = categoryName
                            }) {
                                ZStack {
                                    Rectangle()
                                        .fill(selectedCategory == categoryName ? Color(.yesil) : Color.gray)
                                        .frame(width: 125, height: 150)
                                        .cornerRadius(15)
                                    VStack {
                                        Image(systemName: logoName)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                        
                                        Text(categoryName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                            }
                        }
                    }
                }.padding()
//                NavigationView {
                    
                    List {/*viewModel.urunler*/
                        ForEach(filteredUrunler.sorted(by: { $0.urunAdi ?? "" < $1.urunAdi ?? "" }), id: \.id) { urunler in
                            if urunler.kategori ?? "" == selectedCategory || selectedCategory == "Hepsi" {
                                NavigationLink(destination: UrunlerDetayView(urunler: urunler)) {
                                    UrunlerCellView(urunler: urunler)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .listRowInsets(EdgeInsets())
                                .padding(.horizontal)
                            }
                        }
                        .background(Color(.acikYesil))
                    }
                    .listStyle(.plain)
                    .background(Color(.arkaPlan))
                    //                    .cornerRadius(15)
                    
                }
            .background(Color(.arkaPlan))

                .task {
                    try? await viewModel.getAllUrun()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        UrunlerView()
    }
}
