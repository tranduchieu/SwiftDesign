//
//  VideoCard.swift
//  
//
//  Created by Hieu Tran on 05/06/2024.
//

import SwiftUI

public enum CardSize {
    case small
    case medium
    case large
}

public struct VideoCard: View {
    let videoItem: VideoItem
    
    public init(
        videoItem: VideoItem
    ) {
        self.videoItem = videoItem
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let thumbnail = videoItem.thumbnail {
                AsyncThumbnailView(asyncThumbnail: thumbnail)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(videoItem.title)
                    .font(.subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 8)
                if let subtitle = videoItem.subtitle{
                    Text(subtitle)
                        .font(.caption)
                        .lineLimit(1)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}

#Preview {
    VideoCard(
        videoItem: VideoItem(
            id: "uSuIl1Fsz3g",
            title: "WWDC23: Explore enhancements to App Intents",
            author: "Subtitle",
            thumbnail: AsyncThumbnail(
                imageUrl: URL(string: "https://i.ytimg.com/vi/uSuIl1Fsz3g/maxresdefault.jpg"),
                aspectRatio: 16 / 9,
                cornerRadius: 8
            ),
            youtubeUrl: URL(string: "https://youtube.com/watch?v=uSuIl1Fsz3g")
        )
    )
}
