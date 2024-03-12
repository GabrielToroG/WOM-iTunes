//
//  FavoriteProductsManager.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

class FavoriteProductsManager {
    static let shared = FavoriteProductsManager()

    private var favoriteProducts: [UiSongInformation] = []

    private init() {}

    func exists(withID trackId: Int) -> Bool {
         return favoriteProducts.contains { $0.trackId == trackId }
     }

    func add(_ product: UiSongInformation) {
        favoriteProducts.append(product)
    }

    func remove(withID id: Int) {
        favoriteProducts.removeAll { $0.trackId == id }
    }

    func getAll() -> [UiSongInformation] {
        return favoriteProducts
    }
}
