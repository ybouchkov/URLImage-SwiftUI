//
//  ContentView.swift
//  URLImage-SwiftUI
//
//  Created by Yani Buchkov on 29.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        URLImage(url: "https://media.istockphoto.com/photos/cyber-technology-security-protection-monitoring-concept-advanced-picture-id1276687348?s=612x612")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
