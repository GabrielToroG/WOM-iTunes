//
//  HomeDataMapperImpl.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class HomeDataMapperImpl: HomeDataMapper {
    func dataToDomain(_ value: ApiiTunesResponse) -> DomainiTunesResponse {
        .init(
            resultCount: value.resultCount,
            results: value.results.map(dataToDomain(_:))
        )
    }

    private func dataToDomain(_ value: ApiSongInformation) -> DomainSongInformation {
        .init(
            artistName: value.artistName,
            trackName: value.trackName,
            artworkUrl30: value.artworkUrl30,
            artworkUrl60: value.artworkUrl60,
            artworkUrl100: value.artworkUrl100
        )
    }
}