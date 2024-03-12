//
//  HomeDataMapper.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol HomeDataMapper {
    func dataToDomain(_ value: ApiiTunesResponse) -> DomainiTunesResponse
    func domainToData(_ value: iTunesListQueryParams) -> ApiiTunesListQueryParams
}
