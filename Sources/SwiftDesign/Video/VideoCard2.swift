//
//  VideoCard.swift
//
//
//  Created by Hieu Tran on 05/06/2024.
//

import SwiftUI

public struct VideoCard2: View {
    let videoItem: VideoItem
    let cardSize: CardSize
    
    var thumbnail: AsyncThumbnail {
        if var thumbnail = videoItem.thumbnail {
            thumbnail.cornerRadius = 0
            thumbnail.aspectRatio = 16 / 9
            return thumbnail
        } else {
            return AsyncThumbnail(imageUrl: nil, aspectRatio: 16 / 9, cornerRadius: 0)
        }
    }

    
    public init(
        videoItem: VideoItem,
        cardSize: CardSize = .small
    ) {
        self.videoItem = videoItem
        self.cardSize = cardSize
    }
    
    let cornerRadius: CGFloat = 12
    
    
    public var body: some View {

        
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(.clear)
            .aspectRatio( 16 / 15, contentMode: .fit)
            .overlay {
                VStack {
                    Spacer()
                    
                    RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: cornerRadius).fill(.ultraThinMaterial)
                        .background {
                            VStack {
                                Spacer()
                                Thumbnail()
                                    .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 18))
                                
                            }
                        }
                        .overlay {
                            VStack(alignment: .leading, spacing: 4) {
                                Rectangle()
                                    .fill(.clear)
                                    .aspectRatio(thumbnail.aspectRatio, contentMode: .fit)
                                
                                Text(videoItem.title)
                                    .font(cardSize == .large ? .body : cardSize == .medium ? .subheadline : .caption)
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
                            .padding(.vertical, 8)
                        }
                }
            }
            .overlay {
                VStack{
                    Thumbnail()
                        .clipShape(RoundedCornersShape(corners: [.topLeft, .topRight], radius: cornerRadius))
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
                    
                    Spacer()
                }
            }

            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
            )
    }
    
    @ViewBuilder
    func Thumbnail() -> some View {
        AsyncThumbnailView(asyncThumbnail:  thumbnail)
    }
}

#Preview {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum: 200))]) {
        VideoCard2(
            videoItem: VideoItem(
                id: "uSuIl1Fsz3g",
                title: "WWDC23: Explore enhancements to App Intents",
                subtitle: "Subtitle",
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
            cardSize: .small
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}
