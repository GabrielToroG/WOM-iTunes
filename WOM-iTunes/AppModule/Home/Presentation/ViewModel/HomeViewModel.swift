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

    @Published private(set) var goTo: HomeCoordinator.GoToScene?
    @Published private(set) var uniqueMusics: [UiSongInformation] = []

    let getItunesListUseCase: GetItunesListUseCase

    init(getItunesListUseCase: GetItunesListUseCase) {
        self.getItunesListUseCase = getItunesListUseCase
    }
}

extension HomeViewModel {
    func onViewWillAppear() {
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
            self.isLoading = true
            switch result {
            case .success(let data):
                self.musicsUS = data.results
                self.getCLItunesList()
            case .error(let error):
                self.isLoading = false
                self.onError(error)
            case .unauthorized(_):
                self.isLoading = false
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
                self.isLoading = false
                self.onError(error)
            case .unauthorized(_):
                self.isLoading = false
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
            self.isLoading = false
            switch result {
            case .success(let data):
                self.musicsSE = data.results
                self.setUniqueMusics()
            case .error(let error):
                self.onError(error)
            case .unauthorized(_):
                print("")
            }
        }
    }

    private func setUniqueMusics() {
        let songs = musicsUS + musicsCL + musicsSE
        var uniqueTrackNamesSet = Set<String>()
        var uniqueSongsArray = [UiSongInformation]()

        for song in songs {
            if !uniqueTrackNamesSet.contains(song.trackName) {
                uniqueTrackNamesSet.insert(song.trackName)
                uniqueSongsArray.append(song)
            }
        }
        uniqueMusics = uniqueSongsArray
    }
}

extension HomeViewModel {
    func goToSongDetail(index: Int) {
        let args = SongDetailArgs(information: uniqueMusics[index])
        self.goTo = .songDetail(args)
    }
}
