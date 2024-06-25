//
//  ReviewCard.swift
//
//
//  Created by Hieu Tran on 24/06/2024.
//

import SwiftUI

public struct ReviewCard: View {
    let review: Review
    let contentLineLimit: Int?
    
    public init(review: Review, contentLineLimit: Int? = nil) {
        self.review = review
        self.contentLineLimit = contentLineLimit
    }
    
    @State private var isExpanded = false
    @State private var detent: PresentationDetent = .large
    
    public var body: some View {
        ReviewContent(review: review, contentLineLimit: contentLineLimit)
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onTapGesture {
            isExpanded.toggle()
        }
        .sheet(isPresented: $isExpanded) {
            ScrollView {
                VStack(spacing: 12){
                    Text("Review")
                        .font(.title2)
                        .fontWeight(.bold)
                    ReviewContent(review: review, contentLineLimit: nil)
                }
                .padding()
            }
            .presentationDetents([.medium, .large])
 
        }
    
    }

}

struct ReviewContent: View {
    let review: Review
    let contentLineLimit: Int?
    
    public init(review: Review, contentLineLimit: Int? = nil) {
        self.review = review
        self.contentLineLimit = contentLineLimit
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let rating = review.rating {
                StarRating(
                    rating: .constant(rating),
                    maxRating: 5,
                    color: .yellow,
                    bgColor: .gray
                )
                .frame(height: 16)
            }
            if let title = review.title {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(3)
            }
            
            Text(review.content)
                .font(.subheadline)
                .lineLimit(contentLineLimit)
            
            HStack {
                if let avatarUrl = review.avatarUrl {
                    AsyncThumbnailView(asyncThumbnail: .init(
                        imageUrl: avatarUrl,
                        aspectRatio: 1
                    ))
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading) {
                    Text(review.authorTitle)
                        .font(.caption)
                        .fontWeight(.bold)
                    if let authorSubtitle = review.authorSubtitle {
                        Text(authorSubtitle)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewCard(review: Review.examples[0])
}
