//
//  PlaylistCard3.swift
//
//
//  Created by Hieu Tran on 05/06/2024.
//

import SwiftUI

public struct PlaylistCard3: View {
    let playlistItem: PlaylistItem
    let cardSize: CardSize
    
    var thumbnail: AsyncThumbnail {
        if var thumbnail = playlistItem.thumbnail {
            thumbnail.cornerRadius = 0
            thumbnail.aspectRatio = 16 / 9
            return thumbnail
        } else {
            return AsyncThumbnail(imageUrl: nil, aspectRatio: 16 / 9, cornerRadius: 0)
        }
    }

    
    public init(
        playlistItem: PlaylistItem,
        cardSize: CardSize = .small
    ) {
        self.playlistItem = playlistItem
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
                                
                                Text(playlistItem.title)
                                    .font(cardSize == .large ? .body : cardSize == .medium ? .subheadline : .caption)
                                    .lineLimit(2)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    Text("\(playlistItem.videoCount) videos")
                                        .font(.caption)
                                        .lineLimit(1)
                                        .foregroundStyle(.secondary)
                                
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
                
                                        HStack(spacing: 4) {
                                            Image(systemName: "play.square.stack.fill")
                                            Text("PLAYLIST")
                                        }
                                            .font(cardSize == .large ? .subheadline : .caption)
                                            .fontWeight(.semibold)
                                            .fontDesign(.rounded)
                                            .lineLimit(1)
                                            .padding(4)
                                            .background(Color.black.opacity(0.6))
                                            .foregroundStyle(.white)
                                            .cornerRadius(cardSize == .large ? 6 : 4)

                                    
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
        AsyncThumbnailView(asyncThumbnail: thumbnail)
    }
}

#Preview {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160, maximum: 200))]) {
        PlaylistCard3(
            playlistItem: PlaylistItem.examples[0],
            cardSize: .small
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}
