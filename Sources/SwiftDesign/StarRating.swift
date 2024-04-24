//
//  StarRating.swift
//
//
//  Created by Hieu Tran on 24/04/2024.
//

import SwiftUI

public struct StarRating: View {
    @Binding public var rating: CGFloat
    public var maxRating: Int
    public var color: Color
    public var bgColor: Color
    
    public init(rating: Binding<CGFloat>, maxRating: Int, color: Color = .yellow, bgColor: Color = .gray) {
        self._rating = rating
        self.maxRating = maxRating
        self.color = color
        self.bgColor = bgColor
    }

    public var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundStyle(color)
                }
            }
            .mask(stars)
        )
        .foregroundStyle(bgColor)
    }
}
#Preview {
    StarRating(
        rating: .constant(3.5),
        maxRating: 5,
        color: .red,
        bgColor: .blue
    )
}
