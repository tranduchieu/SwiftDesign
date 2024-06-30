//
//  ReviewCarousel.swift
//
//
//  Created by Hieu Tran on 30/06/2024.
//

import SwiftUI

public struct ReviewCarousel: View {
    @State private var expandedStates: [Review.ID: Bool] = [:]
    
    let reviews: [Review]
    
    public init(reviews: [Review]) {
        self.reviews = reviews
    }
    
    public var body: some View {
        if !reviews.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Text("Top Reviews")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 10) {
                        ForEach(reviews) { review in
                            ReviewCard(
                                review: review,
                                contentLineLimit: 5,
                                isExpanded: Binding(
                                    get: { expandedStates[review.id] ?? false },
                                    set: { expandedStates[review.id] = $0 }
                                )
                            )
                            .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(.horizontal, 20, for: .scrollContent)
            }
        }
    }
}

#Preview {
    ReviewCarousel(reviews: Review.examples)
}
