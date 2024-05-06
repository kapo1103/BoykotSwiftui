//
//  CustomTabBarContainerView.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection //_binding oldugu için
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }            
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
       static let tabs: [TabBarItem] = [
        .markalar, .haberler, .destek
        ]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}

//#Preview {
//    let tabs: [TabBarItem] = [
//        .markalar, .haberler, .destek
//    ]
//    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
//        Color.red
//    }
//}
