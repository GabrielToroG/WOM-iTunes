//
//  WishlistViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class WishlistViewModel: BaseViewModel {

    private(set) var songs: [UiSongInformation] = []
    private let favoriteProductsManager: FavoriteProductsManager

    @Published private(set) var refresh: Bool = false

    init(_ favoriteProductsManager: FavoriteProductsManager) {
        self.favoriteProductsManager = favoriteProductsManager
    }
}

extension WishlistViewModel {
    func onViewWillAppear() {
        songs = favoriteProductsManager.getAll()
        refresh = true
    }
}

extension WishlistViewModel {
    func removeWishlist(index: Int) {
        favoriteProductsManager.remove(withID: songs[index].trackId)
        songs = favoriteProductsManager.getAll()
        refresh = true
    }
}
