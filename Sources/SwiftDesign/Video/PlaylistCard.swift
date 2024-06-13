//
//  PlaylistCard.swift
//  
//
//  Created by Hieu Tran on 05/06/2024.
//

import SwiftUI

public struct PlaylistCard: View {
    let playlistItem: PlaylistItem
    let cardSize: CardSize
    
    public init(
        playlistItem: PlaylistItem,
        cardSize: CardSize = .small
    ) {
        self.playlistItem = playlistItem
        self.cardSize = cardSize
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(Color(playlistItem.bgColor ?? .clear))
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                VStack {
                    AsyncThumbnailView(asyncThumbnail:  playlistItem.thumbnail ?? AsyncThumbnail(imageUrl: nil, aspectRatio: 16 / 9))
                    
                        .clipShape(RoundedCornersShape(corners: [.topLeft, .topRight], radius: 18))
                        .overlay {
                            // gradient
                            LinearGradient(gradient: Gradient(colors: [Color(playlistItem.bgColor ?? .clear).opacity(1), Color.clear]), startPoint: .bottom, endPoint: .init(x: 0.5, y: 0.6))
                        }
                    
                    
                    Spacer()
                }
                
            )
            .overlay(
                VStack {
                    Spacer()
                    VStack(spacing: cardSize == .large ? 12 : 8) {
                        HStack {
                            Text("PLAYLIST")
                                .font(cardSize == .large ? .caption : .caption2)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: cardSize == .large ? 4 : 2) {
                                Text(playlistItem.title)
                                    .font(cardSize == .large ? .title2 : .subheadline)
                                    .fontWeight(.bold)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.8)
                                    .multilineTextAlignment(.leading)
//                                    .frame(maxHeight: 48, alignment: .top)
                                Text("\(playlistItem.videoCount) videos")
                                    .font(cardSize == .large ? .subheadline : .caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "play.square.stack.fill")
                                .font(cardSize == .large ? .title : .title2)
                            //                            .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, cardSize == .large ? 18 : 12)
                    .padding(.top, 12)
                    .containerRelativeFrame(.vertical) { length, axis in
                        return cardSize == .large ? length / 2.4 : length / 1.8
                    }
                }
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
            )
    }
}

#Preview {
    PlaylistCard(playlistItem: PlaylistItem.examples[0])
        .frame(width: 180)
        .preferredColorScheme(.dark)
}
