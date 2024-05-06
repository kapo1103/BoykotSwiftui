//
//  ContentView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 11.12.2023.
//

import SwiftUI
//import Firebase
//
//import Combine
//import StoreKit
//import FirebaseFirestore
//import GameController

struct ContentView: View {
    
    @State private var tabSelection: TabBarItem = .markalar
    
    
    var body: some View {
        
        CustomTabBarContainerView(selection: $tabSelection) {
            
                UrunlerView()
                .background(Color.arkaPlan)

                    .tabBarItem(tab: .markalar, selection: $tabSelection)

                HaberView()
                .background(Color.arkaPlan)

                    .tabBarItem(tab: .haberler, selection: $tabSelection)

                DestekView()
                .background(Color.arkaPlan)

                    .tabBarItem(tab: .destek, selection: $tabSelection)
            

        
        }.background(Color.arkaPlan)
//                    TabView {
//                        NavigationStack {
//                            UrunlerView()
//                                .background(Color.arkaPlan)
//        
//                        }
//                        .tabItem {
//                            Image(systemName: "tree.fill")
//                            Text("Markalar")
//                        }
//        
//                        NavigationStack {
//                            HaberView()
//                                .background(Color.arkaPlan)
//        
//                        }
//                        .tabItem {
//                            Image(systemName: "newspaper.fill")
//                            Text("Haberler")
//                        }
//        
//                        NavigationStack {
//                            DestekView()
//                                .background(Color.arkaPlan)
//        
//                        }
//                        .tabItem {
//                            Image(systemName: "person.line.dotted.person.fill")
//                            Text("Destek")
//        
//                    }
//                }
    }
}

#Preview {
    ContentView()
}
