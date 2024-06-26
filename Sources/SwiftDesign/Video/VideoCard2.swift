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
            return thumbnail
        } else {
            return AsyncThumbnail(imageUrl: nil, aspectRatio: 16 / 9)
        }
    }

    
    public init(
        videoItem: VideoItem,
        cardSize: CardSize = .small
    ) {
        self.videoItem = videoItem
        self.cardSize = cardSize
    }
    
    
    public var body: some View {

        
        RoundedRectangle(cornerRadius: 18)
            .fill(.clear)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                VStack {
                    Spacer()
                    
                    RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 18).fill(.thinMaterial)
                        .background(
                            AsyncThumbnailView(asyncThumbnail: thumbnail)
                                .clipShape(RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 18))
                            
                            
                        )
                        
                }
            }
            .overlay {
                VStack{
                    AsyncThumbnailView(asyncThumbnail:  thumbnail)
                        .clipShape(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 18))
                    
                    
                    Spacer()
                }
            }

            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
            )
    }
}

#Preview {
    VideoCard2(
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
