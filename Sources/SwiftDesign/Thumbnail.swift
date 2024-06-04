//
//  Thumbnail.swift
//
//
//  Created by Hieu Tran on 25/05/2024.
//

import SwiftUI

struct Thumbnail {
    let imageUrl: URL?
    let aspectRatio: CGFloat = 16 / 10
    let cornerRadius: CGFloat = 8
}

public struct AsyncThumbnail: View {
    let imageUrl: URL?
    let aspectRatio: CGFloat
    let cornerRadius: CGFloat
    
    public init(
        imageUrl: URL?,
        aspectRatio: CGFloat = 16 / 10,
        cornerRadius: CGFloat = 8
    ) {
        self.imageUrl = imageUrl
        self.aspectRatio = aspectRatio
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        if let imageUrl = imageUrl {
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity
                    )
                    .aspectRatio(aspectRatio, contentMode: .fit)
                    .clipped()
                    .cornerRadius(cornerRadius)
                
            } placeholder: {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .aspectRatio(aspectRatio, contentMode: .fit)
                
            }
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(
                    Color(UIColor.secondarySystemBackground)
                )
                .aspectRatio(aspectRatio, contentMode: .fit)
        }
    }
}

#Preview {
    AsyncThumbnail(
        imageUrl: URL(string: "https://picsum.photos/200/300"),
        aspectRatio: 16 / 9,
        cornerRadius: 8
    )
}
