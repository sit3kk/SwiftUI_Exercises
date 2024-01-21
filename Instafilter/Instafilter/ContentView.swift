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
                        .disabled(selectedItem == nil)
                        .onChange(of: filterIntensity, applyProcessing)
                }

                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled(selectedItem == nil)

                    Spacer()

                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }


                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius)
                        .disabled(selectedItem == nil)
                        .onChange(of: filterRadius, applyProcessing)
                }

                HStack {
                    Text("Scale")
                    Slider(value: $filterScale)
                        .disabled(selectedItem == nil)
                        .onChange(of: filterScale, applyProcessing)
                }

            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize() )}
                Button("Edges") { setFilter(CIFilter.edges() )}
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur() )}
                Button("Pixellate") { setFilter(CIFilter.pixellate() )}
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone() )}
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask() )}
                Button("Vignette") { setFilter(CIFilter.vignette() )}

                //New
                Button("Color Invert") { setFilter(CIFilter.colorInvert()) }
                Button("Twirl Distortion") { setFilter(CIFilter.twirlDistortion()) }
                Button("Bloom") { setFilter(CIFilter.bloom() )} 


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

        //New
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 100, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputCenterKey) { currentFilter.setValue(CIVector(x: inputImage.extent.size.width / 2, y: inputImage.extent.size.height / 2), forKey: kCIInputCenterKey) }


        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }

    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()

        filterCount += 1

        if filterCount >= 20 {
            requestReview()
        }
    }
}

#Preview {
    ContentView()
}
