//
//  Review.swift
//
//
//  Created by Hieu Tran on 24/06/2024.
//

import Foundation

public struct Review: Identifiable, Hashable {
    public let id: String
    public let title: String?
    public let content: String
    public let rating: Double?
    public let authorTitle: String
    public let authorSubtitle: String?
    public let avatarUrl: URL?
    
    public init(
        id: String,
        title: String?,
        content: String,
        rating: Double?,
        authorTitle: String,
        authorSubtitle: String?,
        avatarUrl: URL?
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.rating = rating
        self.authorTitle = authorTitle
        self.authorSubtitle = authorSubtitle
        self.avatarUrl = avatarUrl
    }
}


extension Review {
    public static let examples: [Review] = [
        Review(
            id: "1",
            title: "Great course!",
            content: "I really enjoyed this course. It was very informative and well structured.",
            rating: 5,
            authorTitle: "John Doe",
            authorSubtitle: "United States",
            avatarUrl: URL(string: "https://example.com/avatar1.png")
        ),
        Review(
            id: "2",
            title: "Could be better",
            content: "The course was good but I think it could be improved in some areas.",
            rating: 3,
            authorTitle: "Jane Smith",
            authorSubtitle: "Canada",
            avatarUrl: URL(string: "https://example.com/avatar2.png")
        )
    ]
}
