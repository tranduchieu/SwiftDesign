// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct RoundedCornersShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    public init(corners: UIRectCorner, radius: CGFloat) {
        self.corners = corners
        self.radius = radius
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
