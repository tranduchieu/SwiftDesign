//
//  VideoItem.swift
//
//
//  Created by Hieu Tran on 05/06/2024.
//

import Foundation

public struct VideoItem: Identifiable, Hashable {
    public let id: String
    public let title: String
    public let subtitle: String?
    public let thumbnail: AsyncThumbnail?
    public let youtubeUrl: URL?
    
    public init(id: String, title: String, subtitle: String? = nil, thumbnail: AsyncThumbnail? = nil, youtubeUrl: URL? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.thumbnail = thumbnail
        self.youtubeUrl = youtubeUrl
    }
    
    public static func == (lhs: VideoItem, rhs: VideoItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
