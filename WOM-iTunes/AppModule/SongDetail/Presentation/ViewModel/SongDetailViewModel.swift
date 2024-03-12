//
//  SongDetailViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class SongDetailViewModel: BaseViewModel {
    @Published private(set) var args: SongDetailArgs
    
    init(args: SongDetailArgs) {
        self.args = args
    }
}
