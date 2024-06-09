//
//  SwiftUIView.swift
//
//
//  Created by Hieu Tran on 09/06/2024.
//

import SwiftUI

public struct VideoRow: View {
    let videoItem: VideoItem
    
    public init(videoItem: VideoItem) {
        self.videoItem = videoItem
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            if let thumbnail = videoItem.thumbnail {
                AsyncThumbnailView(asyncThumbnail: thumbnail)
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length / 4
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(videoItem.title)
                    .font(.body)
                .lineLimit(2)
                if let subtitle = videoItem.subtitle {
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
    VideoRow(videoItem: VideoItem(
        id: "uSuIl1Fsz3g",
        title: "WWDC23: Explore enhancements to App Intents",
        author: "Subtitle",
        thumbnail: AsyncThumbnail(
            imageUrl: URL(string: "https://i.ytimg.com/vi/uSuIl1Fsz3g/maxresdefault.jpg"),
            aspectRatio: 16 / 9,
            cornerRadius: 8
        ),
        youtubeUrl: URL(string: "https://youtube.com/watch?v=uSuIl1Fsz3g")
    ))
}
