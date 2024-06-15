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
    let cardSize: CardSize
    
    public init(
        videoItem: VideoItem,
        cardSize: CardSize = .small
    ) {
        self.videoItem = videoItem
        self.cardSize = cardSize
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let thumbnail = videoItem.thumbnail {
                AsyncThumbnailView(asyncThumbnail: thumbnail)
                    .overlay {
                            HStack {
                                
                                Spacer()
                                if let durationFormatted = videoItem.durationFormatted {
                                    HStack(spacing: 4) {
                                        Image(systemName: "play.fill")
                                        Text(videoItem.durationLeftFormatted != nil ? "\(videoItem.durationLeftFormatted!) left" : durationFormatted)
                                    }
                                        .font(cardSize == .large ? .subheadline : .caption)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                        .lineLimit(1)
                                        .padding(4)
                                        .background(Color.black.opacity(0.6))
                                        .foregroundStyle(.white)
                                        .cornerRadius(cardSize == .large ? 6 : 4)
//                                        .offset(x: 4, y: 4)
//                                        .padding(4)
                                        .overlay {
                                            if let duration = videoItem.duration, let lastPlaybackPosition = videoItem.lastPlaybackPosition {
                                                VStack {
                                                    Spacer()
                                                    PlaybackProgressView(lastPlaybackPosition: lastPlaybackPosition, duration: duration)
                                                        .padding(1)
                                                }
                                            }
                                        }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            

                        
                        .padding(.horizontal, cardSize == .large ? 12 : cardSize == .medium ? 8 : 4)
                        .padding(.vertical, cardSize == .large ? 8 : 4)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: thumbnail.cornerRadius)
                            .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
                    }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(videoItem.title)
                    .font(cardSize == .large ? .body : .subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                if let subtitle = videoItem.subtitle{
                    Text(subtitle)
                        .font(.caption)
                        .lineLimit(1)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, cardSize == .large ? 12 : 8)
        }
    }
}

public struct PlaybackProgressView: View {
    let lastPlaybackPosition: TimeInterval
    let duration: TimeInterval

    var progress: Double {
        guard duration > 0 else { return 0 }
        return lastPlaybackPosition / duration
    }
    
    public init(
        lastPlaybackPosition: TimeInterval,
        duration: TimeInterval
    ) {
        self.lastPlaybackPosition = lastPlaybackPosition
        self.duration = duration
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 3)
                Capsule()
                    .fill(Color.accentColor)
                    .frame(width: geometry.size.width * CGFloat(progress), height: 3)
            }
        }
        .frame(height: 3)
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
            youtubeUrl: URL(string: "https://youtube.com/watch?v=uSuIl1Fsz3g"),
            duration: 3600,
            lastPlaybackPosition: 1800
        ),
        cardSize: .large
    )
    .preferredColorScheme(.dark)
}
