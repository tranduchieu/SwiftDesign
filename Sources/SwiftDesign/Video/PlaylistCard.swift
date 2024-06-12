//
//  PlaylistCard.swift
//  
//
//  Created by Hieu Tran on 05/06/2024.
//

import SwiftUI

public struct PlaylistCard: View {
    let playlistItem: PlaylistItem
    
    public init(
        playlistItem: PlaylistItem
    ) {
        self.playlistItem = playlistItem
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
                    VStack(spacing: 8) {
                        HStack {
                            Text("PLAYLIST")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                        }
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(playlistItem.title)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .lineLimit(2)
                                Text("\(playlistItem.videoCount) videos")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "play.square.stack.fill")
                                .font(.title2)
                            //                            .foregroundStyle(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 12)
                    .padding(.top, 12)
                    .containerRelativeFrame(.vertical) { length, axis in
                        return length / 1.8
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
