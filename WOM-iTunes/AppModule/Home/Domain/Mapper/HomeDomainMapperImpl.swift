//
//  HomeDomainMapperImpl.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class HomeDomainMapperImpl: HomeDomainMapper {
    func dataToDomain(_ value: DomainiTunesResponse) -> UiiTunesResponse {
        .init(
            resultCount: value.resultCount,
            results: value.results.map(dataToDomain(_:))
        )
    }

    private func dataToDomain(_ value: DomainSongInformation) -> UiSongInformation {
        .init(
            artistName: value.artistName,
            trackName: value.trackName,
            artworkUrl30: value.artworkUrl30,
            artworkUrl60: value.artworkUrl60,
            artworkUrl100: value.artworkUrl100
        )
    }
}
