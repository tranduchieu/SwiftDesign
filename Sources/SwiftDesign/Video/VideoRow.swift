//
//  SwiftUIView.swift
//
//
//  Created by Hieu Tran on 09/06/2024.
//

import SwiftUI

public struct VideoRow: View {
    let videoItem: VideoItem
    let isPlaying: Bool
    
    public init(videoItem: VideoItem, isPlaying: Bool = false) {
        self.videoItem = videoItem
        self.isPlaying = isPlaying
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

                            if let durationFormatted = videoItem.durationFormatted {
                                
                                HStack(spacing: 4) {
                                    Image(systemName: isPlaying ? "waveform" : "play.fill")
                                    Text(videoItem.durationLeftFormatted != nil ? "\(videoItem.durationLeftFormatted!) left" : durationFormatted)
                                }
                                
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .lineLimit(1)
                                    .padding(3)
                                    .background(isPlaying ? Color.white.opacity(0.6) : Color.black.opacity(0.6))
                                    .foregroundStyle( isPlaying ? .black : .white)
                                    .cornerRadius(4)
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
        
                    
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: thumbnail.cornerRadius)
                        .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
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
        youtubeUrl: URL(string: "https://youtube.com/watch?v=uSuIl1Fsz3g"),
        duration: 3600,
        lastPlaybackPosition: 1800
    ))
}
