//
//  DestekView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 15.12.2023.
//

import SwiftUI

struct DestekView: View {
    
    var body: some View {
        List {
            Section(header: Text("Filistine Destek Olmak İsterseniz")
                .font(.callout)
                .foregroundColor(.primary)
                .bold()
            ) {
                HStack {
                    Text("Kızılay:")
                        .bold()
                        .foregroundColor(.primary)
                    
                    Text(" Tüm GSM operatörleri üzerinden “FİLİSTİN” yazıp 2868'e SMS yollayarak 20₺ bağışta bulunabilirsiniz")
                        .foregroundColor(.primary)
                    
                    Text("Kızılay Sitesine gitmek için")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            if let url = URL(string: "https://www.kizilay.org.tr/Bagis/BagisYap/32/filistin-genel-bagisi") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                }
                HStack {
                    Text("İHH:")
                        .bold()
                        .foregroundColor(.primary)
                    
                    Text("İHH Sitesine gitmek için")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            if let url = URL(string: "https://ihh.org.tr/bagis/filistin-gazze?gad_source=1&gclid=Cj0KCQiAj_CrBhD-ARIsAIiMxT-phzX6l5KS1Ra6rIHF9Vo5eCQ-RwM3cTT_H2xKxn9Ek4JZwNeZC08aAhZOEALw_wcB") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                }
                
                
                
                HStack {
                    Text("Türkiye Diyanet Vakfı:")
                        .bold()
                        .foregroundColor(.primary)
                    
                    Text("FİLİSTİN yazıp 5601’e SMS göndererek 25 TL destekte bulunabilirsiniz.")
                        .foregroundColor(.primary)
                    
                    Text("Diyanet'in Sitesine gitmek için")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            if let url = URL(string: "https://bagis.tdv.org/kriz-bolgeleri/filistin-6") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                }
                
                HStack {
                    Text("AFAD:")
                        .bold()
                        .foregroundColor(.primary)
                    
                    Text("Filistin yaz, 1866 ya gönder SMS bedeli: 50 TL'dir")
                        .foregroundColor(.primary)
                    
                    Text("AFAD'ın Sitesine gitmek için")
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            if let url = URL(string: "https://www.afad.gov.tr/filistin-yardim-kampanyasi") {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                }
            }
            
            Section(header: Text("Bana Destek Olmak İsterseniz ")
                .font(.callout)
                .foregroundColor(.primary)
                .bold()
            ) {
                //                    HStack {
                //                        Text("Papara İban:")
                //                            .bold()
                //                            .foregroundColor(.black)
                //
                //                        Text(" 939339393")
                //                            .foregroundColor(.black)
                //
                //                    }
                //                    HStack {
                //                        Text("Ziraat Bankası İban:")
                //                            .foregroundColor(.black)
                //
                //                            .bold()
                //                        Text("8947483")
                //                            .foregroundColor(.black)
                //
                //                    }
                
                Button {
                    
                } label: {
                    Text("Reklam izleyerek destek olabilirsiniz")
                        .foregroundColor(.blue)
                    
                        .bold()
                }
            }
            Section(header: Text("Bana ulaşmak için ")
                .font(.callout)
                .foregroundColor(.primary)
                .bold()
                    
            ) {
                Text("efh.codes@gmail.com")
                    .foregroundColor(.blue)
                    .underline()
                    .onTapGesture {
                        if let url = URL(string: "mailto:efh.codes@gmail.com") {
                            UIApplication.shared.open(url)
                        }
                    }
            }
            
            Text("Developed by Ethem Fatih Hocaoğlu")
                .foregroundColor(.primary)
            
        }        
    }
}



#Preview {
    DestekView()
}
