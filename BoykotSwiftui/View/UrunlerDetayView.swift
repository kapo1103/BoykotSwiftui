//
//  UrunlerDetayView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import SwiftUI

struct UrunlerDetayView: View {
    
    let urunler : Urunler
    
    var body: some View {
        ZStack {
            Color.arkaPlan
                .ignoresSafeArea()
            VStack {
                //hand.thumbsup.fill boykotsuz
                HStack {
                    if urunler.boykot ?? false {
                        Image(systemName: "hand.raised.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 50 ,height: 50)
                        Text("\(urunler.urunAdi ?? "") Boykotlu Marka")
                            .font(.title)
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "hand.thumbsup.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 50 ,height: 50)
                        Text("Boykota dahil değil")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }.padding()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Bu markaya Neden Boykot Uygulanıyor?")
                        .font(.title)
                    Text(urunler.mesaj ?? "")
                        .font(.title3)
                    
                }.padding()
                Spacer()
            }.padding()
        }    .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
    }
}

#Preview {
    UrunlerDetayView(urunler: Urunler(id: "aaa", mesaj: "mc donald israil ordusuna 1 milyon dolar bağış yaptığını açıkladı ve israil ordusunun yemek ihtiyacını ücretsiz bir şekilde karşılamaktadır.", image: "aaa", boykot: true, urunAdi: "Mc donalds", bilgi: "aaaa", kategori: "Gıda"))
}
