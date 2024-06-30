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
    @Binding var isExpanded: Bool
    
    public init(review: Review, contentLineLimit: Int? = nil, isExpanded: Binding<Bool>) {
        self.review = review
        self.contentLineLimit = contentLineLimit
        self._isExpanded = isExpanded
    }
    
    public var body: some View {
        ReviewContent(review: review, contentLineLimit: contentLineLimit)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onTapGesture {
                print("Tapped review id: \(review.id)")
                isExpanded.toggle()
            }
            .sheet(isPresented: $isExpanded) {
                ScrollView {
                    ReviewContent(review: review, contentLineLimit: nil)
                        .padding()
                        .padding(.top, 20)
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
            if let contentLineLimit = contentLineLimit {
                Text(review.content)
                    .font(.subheadline)
                    .lineLimit(contentLineLimit, reservesSpace: true)
            } else {
                Text(review.content)
                    .font(.subheadline)
                    .lineLimit(contentLineLimit)
            }

        }
    }
}

//#Preview {
//    ReviewCard(review: Review.examples[0])
//}
