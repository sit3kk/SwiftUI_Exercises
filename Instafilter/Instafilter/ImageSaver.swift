//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Konrad Sitek on 13/01/2024.
//
import Foundation
import SwiftUI

class InstafilterImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self,nil, nil)
    }
}
