//
//  DomainiTunesResponse.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

struct DomainiTunesResponse: Equatable {
    let resultCount: Int
    let results: [DomainSongInformation]
}

