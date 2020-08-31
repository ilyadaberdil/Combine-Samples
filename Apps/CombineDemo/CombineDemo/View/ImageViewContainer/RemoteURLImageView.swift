//
//  ImageViewContainer.swift
//  CombineDemo
//
//  Created by berdil karaçam on 8.11.2019.
//  Copyright © 2019 berdil karaçam. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum RenderingType {
    case large
    case thumbnail
}

struct RemoteURLImageView: View {
    @ObservedObject var remoteImageURL: RemoteImageURL
    var renderingType: RenderingType
    
    init(imageUrl: String, renderingType: RenderingType) {
        remoteImageURL = RemoteImageURL(imageURL: imageUrl)
        self.renderingType = renderingType
    }

    var body: some View {
        switch renderingType {
        case .large:
            return AnyView(largeImage)
        case .thumbnail:
            return AnyView(thumbnailImage)
        }
    }

}

extension RemoteURLImageView {
    var thumbnailImage: some View {
        return Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage(systemName: "video.slash.fill") ?? UIImage())
        .resizable()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.black, lineWidth: 1.0))
        .frame(width: 55, height: 55)
    }
    
    var largeImage: some View {
        Image(uiImage: UIImage(data: remoteImageURL.data) ?? UIImage(systemName: "video.slash.fill") ?? UIImage())
        .resizable()
    }
}
