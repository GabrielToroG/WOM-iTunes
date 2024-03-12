//
//  SongDetailViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class SongDetailViewModel: BaseViewModel {

    @Published private(set) var args: SongDetailArgs
    @Published private(set) var isFavorite: Bool = false

    init(args: SongDetailArgs) {
        self.args = args
    }
}

extension SongDetailViewModel {
    func onViewDidLoad() {
        let song = args.information
        isFavorite = FavoriteProductsManager.shared.exists(withID: song.trackId)
    }
}

extension SongDetailViewModel {
    func addRemoveFavorites() {
        let song = args.information
        if FavoriteProductsManager.shared.exists(withID: song.trackId) {
            FavoriteProductsManager.shared.remove(withID: song.trackId)
            isFavorite = false
        } else {
            FavoriteProductsManager.shared.add(song)
            isFavorite = true
        }
    }
}
