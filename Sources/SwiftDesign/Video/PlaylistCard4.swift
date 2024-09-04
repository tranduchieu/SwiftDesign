//
//  PlaylistCard.swift
//
//
//  Created by Hieu Tran on 05/06/2024.
//

import SwiftUI

public struct PlaylistCard4: View {
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
        VStack(alignment: .leading, spacing: 8) {
            AsyncThumbnailView(asyncThumbnail: playlistItem.thumbnail ?? AsyncThumbnail(imageUrl: nil, aspectRatio: 16 / 9))
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(playlistItem.videoCount) videos")
                                .font(cardSize == .large ? .subheadline : .caption)
                                .fontWeight(.semibold)
                                .padding(4)
                                .background(Color.black.opacity(0.6))
                                .foregroundStyle(.white)
                                .cornerRadius(cardSize == .large ? 6 : 4)
                        }
                        .padding(.horizontal, cardSize == .large ? 12 : 8)
                        .padding(.vertical, cardSize == .large ? 8 : 4)
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.thinMaterial, lineWidth: 1)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(playlistItem.title)
                    .font(cardSize == .large ? .body : .subheadline)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text("PLAYLIST")
                    .font(cardSize == .large ? .caption : .caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, cardSize == .large ? 12 : 8)
        }
    }
}

#Preview {
    PlaylistCard4(playlistItem: PlaylistItem.examples[0])
        .frame(width: 180)
        .preferredColorScheme(.dark)
}
