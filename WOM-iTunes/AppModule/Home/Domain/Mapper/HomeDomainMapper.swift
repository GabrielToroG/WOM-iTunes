//
//  HomeDomainMapper.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

protocol HomeDomainMapper {
    func domainToPresentation(_ value: DomainiTunesResponse) -> UiiTunesResponse
}
