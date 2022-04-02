//
//  SnapCarousel.swift
//  BeautifulAnimanion
//
//  Created by evilb on 02.04.2022.
//

import SwiftUI

// To for Accepting List....
struct SnapCarousel<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    // Properties...
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100) {
        
    }
    
}

struct SnapCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
