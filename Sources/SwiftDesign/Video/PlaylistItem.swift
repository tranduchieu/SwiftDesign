//
//  PlaylistItem.swift
//
//
//  Created by Hieu Tran on 05/06/2024.
//

import Foundation
import SwiftUI

public struct PlaylistItem: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let thumbnail: AsyncThumbnail?
    public let bgColor: Color?
    public let videoCount: Int
    
    public init(id: String, title: String, thumbnail: AsyncThumbnail?, bgColor: Color?, videoCount: Int) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
        self.bgColor = bgColor
        self.videoCount = videoCount
    }
    
    public static func == (lhs: PlaylistItem, rhs: PlaylistItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PlaylistItem {
    public static let examples: [PlaylistItem] = [
        PlaylistItem(
            id: "1",
            title: "Playlist 1",
            thumbnail: AsyncThumbnail(imageUrl: URL(string: "https://i.ytimg.com/vi/9T1nGrgAhbI/maxresdefault.jpg"), aspectRatio: 16 / 9, cornerRadius: 0),
            bgColor: Color.blue,
            videoCount: 10
        )
    ]
}
