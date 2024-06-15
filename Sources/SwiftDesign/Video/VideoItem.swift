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
    public let author: String?
    public let thumbnail: AsyncThumbnail?
    public let youtubeUrl: URL?
    public let duration: Double?
    var durationFormatted: String? {
        guard let duration = duration else { return nil }
        let formatter = DateComponentsFormatter()
        
        if duration < 3600 {
            // If duration is less than 1 hour, format as mm:ss
            formatter.allowedUnits = [.minute, .second]
        } else {
            // If duration is 1 hour or more, format as hh:mm:ss
            formatter.allowedUnits = [.hour, .minute, .second]
        }
        
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: duration)
    }
    
    var durationLeftFormatted: String? {
        guard let duration = duration, let lastPlaybackPosition = lastPlaybackPosition else { return nil }
        let formatter = DateComponentsFormatter()
        
        let leftDuration = duration - lastPlaybackPosition
        
        if leftDuration < 3600 {
            // If duration is less than 1 hour, format as mm:ss
            formatter.allowedUnits = [.minute, .second]
        } else {
            // If duration is 1 hour or more, format as hh:mm:ss
            formatter.allowedUnits = [.hour, .minute, .second]
        }
        
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: leftDuration)
    }
    public var lastPlaybackPosition: Double?
    
    public init(id: String, title: String, subtitle: String? = nil, author: String? = nil, thumbnail: AsyncThumbnail? = nil, youtubeUrl: URL? = nil, duration: Double? = nil, lastPlaybackPosition: Double? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.author = author
        self.thumbnail = thumbnail
        self.youtubeUrl = youtubeUrl
        self.duration = duration
        self.lastPlaybackPosition = lastPlaybackPosition
    }
    
    public static func == (lhs: VideoItem, rhs: VideoItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
