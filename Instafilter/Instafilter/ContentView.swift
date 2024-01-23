//
//  ContentView.swift
//  Instafilter
//
//  Created by Konrad Sitek on 21/01/2024.
//


import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var showingFilters = false

    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5

    @State private var isIntensitySliderEnabled = false
    @State private var isRadiusSliderEnabled = false
    @State private var isScaleSliderEnabled = false

    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview

    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .disabled(!isIntensitySliderEnabled)
                        .onChange(of: filterIntensity, applyProcessing)
                }

                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius, in: 0...200)
                        .disabled(!isRadiusSliderEnabled)
                        .onChange(of: filterRadius, applyProcessing)
                }

                HStack {
                    Text("Scale")
                    Slider(value: $filterScale, in: 0...10)
                        .disabled(!isScaleSliderEnabled)
                        .onChange(of: filterScale, applyProcessing)
                }

                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled(selectedItem == nil)

                    Spacer()

                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Bloom") { setFilter(CIFilter.bloom()) }
                Button("Color Invert") { setFilter(CIFilter.colorInvert()) }
                Button("Twirl Distortion") { setFilter(CIFilter.twirlDistortion()) }
                Button("Cancel", role: .cancel) { }
            }
        }
    }

    func changeFilter() {
        showingFilters = true
    }

    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }

    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale, forKey: kCIInputScaleKey) }

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }

    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        let inputKeys = filter.inputKeys

        isIntensitySliderEnabled = inputKeys.contains(kCIInputIntensityKey)
        isRadiusSliderEnabled = inputKeys.contains(kCIInputRadiusKey)
        isScaleSliderEnabled = inputKeys.contains(kCIInputScaleKey)

        loadImage()

        filterCount += 1
        if filterCount >= 20 {
            requestReview()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
