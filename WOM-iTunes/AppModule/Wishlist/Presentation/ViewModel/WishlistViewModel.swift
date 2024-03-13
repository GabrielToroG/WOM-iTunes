//
//  WishlistViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class WishlistViewModel: BaseViewModel {

    private(set) var songs: [UiSongInformation] = []

    @Published private(set) var refresh: Bool = false

}

extension WishlistViewModel {
    func onViewWillAppear() {
        songs = FavoriteProductsManager.shared.getAll()
        refresh = true
    }
}

extension WishlistViewModel {
    func removeWishlist(index: Int) {
        FavoriteProductsManager.shared.remove(withID: songs[index].trackId)
        songs = FavoriteProductsManager.shared.getAll()
        refresh = true
    }
}
