//
//  AsyncThumbnail.swift
//
//
//  Created by Hieu Tran on 25/05/2024.
//

import SwiftUI

public struct AsyncThumbnail: Codable {
    public var imageUrl: URL?
    public var aspectRatio: CGFloat
    public var cornerRadius: CGFloat
    
    public init(
        imageUrl: URL?,
        aspectRatio: CGFloat = 16 / 10,
        cornerRadius: CGFloat = 8
    ) {
        self.imageUrl = imageUrl
        self.aspectRatio = aspectRatio
        self.cornerRadius = cornerRadius
    }
}

public struct AsyncThumbnailView: View {
    let asyncThumbnail: AsyncThumbnail
    
    public init(
        asyncThumbnail: AsyncThumbnail
    ) {
        self.asyncThumbnail = asyncThumbnail
    }
    
    public var body: some View {
        if let imageUrl = asyncThumbnail.imageUrl {
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
                    .aspectRatio(asyncThumbnail.aspectRatio, contentMode: .fit)
                    .clipped()
                    .cornerRadius(asyncThumbnail.cornerRadius)
                
            } placeholder: {
                RoundedRectangle(cornerRadius: asyncThumbnail.cornerRadius)
                    .fill(
                        Color(UIColor.secondarySystemBackground)
                    )
                    .aspectRatio(asyncThumbnail.aspectRatio, contentMode: .fit)
                
            }
        } else {
            RoundedRectangle(cornerRadius: asyncThumbnail.cornerRadius)
                .fill(
                    Color(UIColor.secondarySystemBackground)
                )
                .aspectRatio(asyncThumbnail.aspectRatio, contentMode: .fit)
        }
    }
}

#Preview {
    let asyncThumbnail = AsyncThumbnail(
        imageUrl: URL(string: "https://picsum.photos/200/300")!,
        aspectRatio: 16 / 9,
        cornerRadius: 8
    )
    
    return AsyncThumbnailView(asyncThumbnail: asyncThumbnail)
}
