//
//  ApiSongInformation.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

struct ApiSongInformation: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl30: String
    let artworkUrl60: String
    let artworkUrl100: String
}