//
//  TabBarItem.swift
//  BoykotSwiftui
//
//  Created by Ethem Fatih Hocaoğlu on 17.12.2023.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case markalar, haberler, destek
    
    var iconName: String {
        
        switch self {            
        case .markalar: return "tree.fill"
        case .haberler: return "newspaper.fill"
        case .destek: return "person.line.dotted.person.fill"
            
        }
    }
        var title: String {
            switch self {
            case .markalar: return "Markalar"
            case .haberler: return "Haberler"
            case .destek: return "Destek"
                
            }
        }
        var color: Color {
            switch self {
            case .markalar: return Color.red
            case .haberler: return Color.blue
            case .destek: return Color.cyan
            
        }
    }
}
