//
//  RatingView.swift
//  Bookworm
//
//  Created by Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    var maximumRating = 5
    
   @State private var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {

            ForEach(1 ..< maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                }
            }
        }
    }
    
    
    func image(for number: Int) -> Image {
        if number > rating {
            
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

