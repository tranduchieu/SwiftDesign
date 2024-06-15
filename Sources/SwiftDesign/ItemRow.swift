//
//  SwiftUIView.swift
//
//
//  Created by Hieu Tran on 04/06/2024.
//

import SwiftUI

public struct ItemRow: View {
    let thumbnail: AsyncThumbnail?
    let title: String
    let subtitle: String?
    let thumbnailOverlay: AnyView?
    
    public init(
        thumbnail: AsyncThumbnail?,
        title: String,
        subtitle: String?,
        thumbnailOverlay: AnyView? = nil
    ) {
        self.thumbnail = thumbnail
        self.title = title
        self.subtitle = subtitle
        self.thumbnailOverlay = thumbnailOverlay
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            if let thumbnail = thumbnail {
                AsyncThumbnailView(asyncThumbnail: thumbnail)
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length / 4
                }
                .overlay(
                    thumbnailOverlay
                )
                .overlay {
                    RoundedRectangle(cornerRadius: thumbnail.cornerRadius)
                        .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                .lineLimit(2)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ItemRow(
        thumbnail: AsyncThumbnail (
            imageUrl: URL(string: "https://via.placeholder.com/150"),
            aspectRatio: 16 / 9,
            cornerRadius: 8
        ),
        title: "Title",
        subtitle: "Subtitle"
    )
}
