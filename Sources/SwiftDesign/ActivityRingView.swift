//
//  ActivityRingView.swift
//  DanceFitme
//
//  Created by Hieu Tran on 07/04/2024.
//

import SwiftUI

struct ActivityRingView: View {
    @Binding var progress: CGFloat
    @State private var animate = false
    
    let size: CGFloat
    let lineWidth: CGFloat
    let colors: [Color]
    
    init(progress: Binding<CGFloat>, size: CGFloat = 100, lineWidth: CGFloat? = nil, colors: [Color] = [.green, .red]) {
        self._progress = progress
        self.size = size
        self.lineWidth = lineWidth ?? size / 4
        self.colors = colors
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(colors[0].opacity(0.3), lineWidth: lineWidth)
            Circle()
                .trim(from: 0, to: animate ? progress : 0)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1)) {
                        animate = true
                    }
                }
            Circle()
                .frame(width: lineWidth, height: lineWidth)
                .foregroundColor(colors[0])
                .offset(y: -(size / 2))
            
            Circle()
                .frame(width: lineWidth, height: lineWidth)
                .foregroundColor(progress > 0.95 ? colors[1]: colors[1].opacity(0))
                .offset(y: -150)
                .rotationEffect(Angle.degrees(360 * Double(progress)))
                .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
        }.frame(idealWidth: size, idealHeight: size, alignment: .center)
    }
}

#Preview {
    ZStack {
        Color.black
            .edgesIgnoringSafeArea(.all)
        ActivityRingView(
            progress: .constant(0.7),
            size: 200
        )
        .fixedSize()
    }
}
