//
//  CustomBackButton.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 21.12.2023.
//

import SwiftUI

struct CustomBackButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left.circle.fill")
                .imageScale(.large)
                .background(Color.black.opacity(0.5))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    CustomBackButton()
}
