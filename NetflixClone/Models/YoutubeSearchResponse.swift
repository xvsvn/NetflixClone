//
//  YoutubeSearchResponse.swift
//  NetflixClone
//
//  Created by Xasan Xasanov on 10/05/22.
//

import Foundation


struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
