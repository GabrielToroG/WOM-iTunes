//
//  iTunesListQueryParams.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

struct iTunesListQueryParams: Equatable {
    let term: String
    let country: String
    let media: String
    let limit: String
}
