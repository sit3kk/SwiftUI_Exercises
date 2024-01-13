//
//  CustomBinding.swift
//  Instafilter
//
//  Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI

struct CustomBinding: View {
    @State private var blurAmount: CGFloat = 0 {
           didSet {
               print("New value is \(blurAmount)")
           }
       }
       
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)

            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }}
