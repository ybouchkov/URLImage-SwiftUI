//
//  ImageLoader.swift
//  URLImage-SwiftUI
//
//  Created by Yani Buchkov on 29.10.21.
//

import Foundation

/// ImageLoader
/// It is responsible for downloading the image in pure data
class ImageLoader: ObservableObject {
    // MARK: - Properties
    @Published
    var downloadedData: Data? // can be optional if there is no data on given 'url'
    
    // MARK: - LoaderMethod
    /// Method: downloadImage
    /// - Parameters:
    /// - url - A given URL for the image in a pure string format
    func downloadImage(url: String) {
        // Unwrapping the url for the image
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in // ignore the response, actually we do not need it
            // Unwrapping data, if only error is nil
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async { // mandatory on main thread
                self.downloadedData = data
            }
            
        }.resume()
    }
    
}
