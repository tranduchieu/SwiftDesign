//
//  PlaylistCard2.swift
//
//
//  Created by Hieu Tran on 12/06/2024.
//

import SwiftUI

public struct PlaylistCard2: View {
    let playlistItem: PlaylistItem
    
    public init(
        playlistItem: PlaylistItem
    ) {
        self.playlistItem = playlistItem
    }
    
    public var body: some View {
        AsyncThumbnailView(asyncThumbnail: AsyncThumbnail(imageUrl: playlistItem.thumbnail?.imageUrl, aspectRatio: 16 / 9, cornerRadius: 8))
            .overlay {
                LinearGradient(gradient: Gradient(colors: [Color(playlistItem.bgColor ?? .clear).opacity(1), Color(playlistItem.bgColor ?? .clear).opacity(0.2)]), startPoint: .bottom, endPoint: .init(x: 0.5, y: 0.1))
                    .clipShape(RoundedCornersShape(corners: .allCorners, radius: 8))
            }
            .overlay {
                VStack {
                    Spacer()
                    HStack {
                        Text(playlistItem.title)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.thinMaterial, lineWidth: 1) // Add the inner border
            )
    }
}

#Preview {
    PlaylistCard2(playlistItem: PlaylistItem.examples[0])
        .frame(width: 180)
        .preferredColorScheme(.dark)
}
