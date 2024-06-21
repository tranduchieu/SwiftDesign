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
    public let videoUrl: URL?
    public let duration: Double?
    public var aspectRatio: CGFloat
    public let playlistId: String?
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
    
    public init(
        id: String,
        title: String,
        subtitle: String? = nil,
        author: String? = nil,
        thumbnail: AsyncThumbnail? = nil,
        youtubeUrl: URL? = nil,
        videoUrl: URL? = nil,
        duration: Double? = nil,
        aspectRatio: CGFloat? = nil,
        lastPlaybackPosition: Double? = nil,
        playlistId: String? = nil
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.author = author
        self.thumbnail = thumbnail
        self.youtubeUrl = youtubeUrl
        self.videoUrl = videoUrl
        self.duration = duration
        self.aspectRatio = aspectRatio ?? thumbnail?.aspectRatio ?? 16 / 9
        self.lastPlaybackPosition = lastPlaybackPosition
        self.playlistId = playlistId
    }
    
    public static func == (lhs: VideoItem, rhs: VideoItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
