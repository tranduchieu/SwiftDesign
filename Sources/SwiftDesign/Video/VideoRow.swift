//
//  SwiftUIView.swift
//
//
//  Created by Hieu Tran on 09/06/2024.
//

import SwiftUI

public struct VideoRow: View {
    let videoItem: VideoItem
    var durationFormatted: String? {
        guard let duration = videoItem.duration else { return nil }
        let formatter = DateComponentsFormatter()
        
        if duration < 3600 {
            // If duration is less than 1 hour, format as mm:ss
            formatter.allowedUnits = [.minute, .second]
        } else {
            // If duration is 1 hour or more, format as hh:mm:ss
            formatter.allowedUnits = [.hour, .minute, .second]
        }
        
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: duration)
    }
    
    public init(videoItem: VideoItem) {
        self.videoItem = videoItem
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            if let thumbnail = videoItem.thumbnail {
                AsyncThumbnailView(asyncThumbnail: thumbnail)
                .containerRelativeFrame(.horizontal) { length, axis in
                    return length / 3.3
                }
                .overlay {
                    HStack {
                        Spacer()
                        if let duration = durationFormatted {
                            Text(duration)
                                .font(.caption)
                                .padding(4)
                                .background(Color.black.opacity(0.6))
                                .foregroundStyle(.white)
                                .cornerRadius(4)
                                .offset(x: 4, y: 4)
                                .padding(4)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
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
