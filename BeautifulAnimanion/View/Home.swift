//
//  Home.swift
//  BeautifulAnimanion
//
//  Created by evilb on 02.04.2022.
//

import SwiftUI

struct Home: View {
    // MARK: Animated View Properties
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Films"
    
    // Enviroment Values
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
            // BG
            BGView()
            
            // MARK: Main View Content
            VStack {
                // Custom Nav Bar
                NavBar()
                
                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: movies) { movie in
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        Image(movie.artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(15)
                    }
                }
                // Since Carousel is Moved the current Card a little bit up
                // Using Padding to Avoid the Undercovering the top element
                .padding(.top, 70)
            }
        }
    }
    
    // MARK: Custom Nav Bar
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing: 0) {
            ForEach(["Films", "Localities"], id: \.self) { tab in
                Button {
                    withAnimation {
                        currentTab = tab
                    }
                } label: {
                    
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background{
                            if currentTab == tab {
                                Capsule()
                                    .fill(.ultraThinMaterial)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                }

                
            }
        }
        .padding()
    }
    
    // MARK: Blurred BG
    @ViewBuilder
    func BGView() -> some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self) { index in
                    Image(movies[0].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                    
                }
            }
            
            let color: Color = (scheme == .dark ? .black : .white)
            // Custom Gradient
            LinearGradient(colors: [
                    .black,
                    .clear,
                    color.opacity(0.15),
                    color.opacity(0.5),
                    color.opacity(0.8),
                    color,
                    color
            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
