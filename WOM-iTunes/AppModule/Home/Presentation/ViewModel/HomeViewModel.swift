//
//  HomeViewModel.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Foundation

final class HomeViewModel: BaseViewModel {

    private enum Constants {
        enum QueryParams {
            static let term: String = "love"
            static let media: String = "music"
            static let limit: String = "10"
        }
        static let countryCL: String = "cl"
        static let countryUS: String = "us"
        static let countrySE: String = "se"
    }

    private var musicsUS: [UiSongInformation] = []
    private var musicsCL: [UiSongInformation] = []
    private var musicsSE: [UiSongInformation] = []
    @Published private(set) var uniqueMusics: [UiSongInformation] = []

    let getItunesListUseCase: GetItunesListUseCase

    init(getItunesListUseCase: GetItunesListUseCase) {
        self.getItunesListUseCase = getItunesListUseCase
    }
}

extension HomeViewModel {
    func onViewDidLoad() {
        getUSItunesList()
    }
    private func getUSItunesList() {
        let usQueryParams = iTunesListQueryParams(
            term: Constants.QueryParams.term,
            country: Constants.countryUS,
            media: Constants.QueryParams.media,
            limit: Constants.QueryParams.limit
        )
    
        getItunesListUseCase.execute(usQueryParams) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.musicsUS = data.results
                self.getCLItunesList()
            case .error(let error):
                print("")
            case .unauthorized(let error):
                print("")
            }
        }
    }

    private func getCLItunesList() {
        let clQueryParams = iTunesListQueryParams(
            term: Constants.QueryParams.term,
            country: Constants.countryCL,
            media: Constants.QueryParams.media,
            limit: Constants.QueryParams.limit
        )
    
        getItunesListUseCase.execute(clQueryParams) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.musicsCL = data.results
                self.getSEItunesList()
            case .error(let error):
                print("")
            case .unauthorized(let error):
                print("")
            }
        }
    }

    private func getSEItunesList() {
        let seQueryParams = iTunesListQueryParams(
            term: Constants.QueryParams.term,
            country: Constants.countrySE,
            media: Constants.QueryParams.media,
            limit: Constants.QueryParams.limit
        )
    
        getItunesListUseCase.execute(seQueryParams) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.musicsSE = data.results
                self.setUniqueMusics()
            case .error(let error):
                print("")
            case .unauthorized(let error):
                print("")
            }
        }
    }

    private func setUniqueMusics() {
        uniqueMusics = musicsUS + musicsCL + musicsSE
    }
}
