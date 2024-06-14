//
//  SwiftUIView.swift
//  
//
//  Created by Hieu Tran on 14/06/2024.
//

import SwiftUI

public struct ReplaceAnimationIcon: View {
    @State var currentIconIndex = 0
    let icons: [String]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public init(icons: [String] = ["sportscourt.fill", "flame.fill", "star.fill"]) {
        self.icons = icons
    }
    
    public var body: some View {
        Image(systemName: icons[currentIconIndex])
            .contentTransition(.symbolEffect(.replace))
            .onReceive(timer) { _ in
                withAnimation {
                    currentIconIndex = (currentIconIndex + 1) % icons.count
                }
            }
    }
}

#Preview {
    ReplaceAnimationIcon()
}
