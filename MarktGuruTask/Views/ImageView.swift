//
//  ImageView.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 06.05.25.
//

import SwiftUI

struct ImageView: View {
    let imageURL: String
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "photo").resizable()
        }
        .aspectRatio(contentMode: .fit)
        .cornerRadius(8)
    }
}

#Preview {
    ImageView(imageURL: "https://i.imgur.com/QkIa5tT.jpeg")
}
