//
//  SongDetailViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class SongDetailViewModel: BaseViewModel {

    private let favoriteProductsManager: FavoriteProductsManager

    @Published private(set) var args: SongDetailArgs
    @Published private(set) var isFavorite: Bool = false

    init(
        _ favoriteProductsManager: FavoriteProductsManager,
        _ args: SongDetailArgs
    ) {
        self.favoriteProductsManager = favoriteProductsManager
        self.args = args
    }
}

extension SongDetailViewModel {
    func onViewWillAppear() {
        let song = args.information
        isFavorite = FavoriteProductsManager.shared.exists(withID: song.trackId)
    }
}

extension SongDetailViewModel {
    func addRemoveFavorites() {
        let song = args.information
        if favoriteProductsManager.exists(withID: song.trackId) {
            favoriteProductsManager.remove(withID: song.trackId)
            isFavorite = false
        } else {
            favoriteProductsManager.add(song)
            isFavorite = true
        }
    }
}
