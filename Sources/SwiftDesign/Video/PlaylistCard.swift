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
        VStack(alignment: .leading, spacing: 8) {
            if let thumbnail = playlistItem.thumbnail {
                AsyncThumbnailView(asyncThumbnail: thumbnail)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(playlistItem.title)
                    .font(.subheadline)
                    .lineLimit(2)
                    .padding(.horizontal, 8)

            }
        }
    }
}
