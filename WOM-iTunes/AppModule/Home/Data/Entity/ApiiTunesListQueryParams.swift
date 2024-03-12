//
//  ApiiTunesListQueryParams.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

struct ApiiTunesListQueryParams: Encodable {
    let term: String
    let country: String
    let media: String
    let limit: String
}
