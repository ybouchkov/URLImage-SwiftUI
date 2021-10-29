//
//  URLImage.swift
//  URLImage-SwiftUI
//
//  Created by Yani Buchkov on 29.10.21.
//

import SwiftUI

struct URLImage: View {
    // MARK: - Properties
    @ObservedObject
    var imageLoader = ImageLoader()
    
    fileprivate let url: String
    fileprivate let placeholder: String
    
    // MARK: - Init
    init(url:  String, placeholder: String = "placeholder") { // default value is empty for placeholder
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: url) // calling method directly here
    }
    
    var body: some View {
        if let data = imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!) // guarantee data is not nil, if-let
                    .resizable()
                    .aspectRatio(contentMode: .fit)
        } else {
            return Image("placeholder") // put placeholder here
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
