//
//  InstafilterView.swift
//  Instafilter
//
//  Created by Konrad Sitek on 13/01/2024.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct InstafilterView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    
    
    @State private var showingImagePicker = false
    
    @State private var inputImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var showingFilterSheet = false
    
    @State private var processedImage: UIImage?
    @State private var changeFilterTitle = ""
    
    @State private var showingEmptyImageAlert = false
    
    let context = CIContext()
    
    
    var body: some View {
        let intensivity = Binding<Double> (
            get: {
                self.filterIntensity
        },
            set : {
                self.filterIntensity = $0
                self.applyProcessing()
        }
        )
        
        let radius = Binding<Double> (
            get: {
                self.filterRadius
        },
            set: {
                self.filterRadius = $0
                self.applyProcessing()
        }
        )
        
        let scale = Binding<Double> (
            get: {
                self.filterScale
        },
            set: {
                self.filterScale = $0
                self.applyProcessing()
        }
        )
        
        return VStack {
            ZStack {
                Rectangle()
                    .fill(Color.pink)
                
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .onTapGesture {
                self.showingImagePicker = true
            }
            
            HStack {
                Text("Intensity")
                Slider(value: intensivity)
            }
            
            HStack {
                Button( "Filter's Name:  \(changeFilterTitle)") {
                    self.showingFilterSheet = true
                }
                }
            HStack {
                    Text("Radius")
                    Slider(value: radius)
                }
                
            HStack {
                Text("Scale")
                Slider(value: scale)
            }
                
                Spacer()
                
                Button("Save") {
                    guard let processedImage = self.processedImage else {
                        self.showingEmptyImageAlert = true
                        return }
                    
                    let imageSaver = InstafilterImageSaver()
                    imageSaver.writeToPhotoAlbum(image: processedImage)
                }
            
        }
        .padding([.horizontal, .bottom])
        .navigationBarTitle("Instafilter View")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            InstafilterImagePicker(image: self.$inputImage)
        }
        .actionSheet(isPresented: $showingFilterSheet) {
            ActionSheet(title: Text("Select a filter"), buttons: [
                .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()) },
                .default(Text("Edges")) { self.setFilter(CIFilter.edges()) },
                .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()) },
                .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()) },
                .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()) },
                .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()) },
                .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
                .cancel()
            ])
        }
        .alert(isPresented: $showingEmptyImageAlert) { () -> Alert in
            Alert(title: Text("You have not selected image"), dismissButton: .default(Text("OK")))
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        //image = Image(uiImage: inputImage)
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        self.changeFilterTitle = currentFilter.name
        applyProcessing()
    }
    
    func  applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey) }
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        self.changeFilterTitle = filter.name
        loadImage()
    }
}
