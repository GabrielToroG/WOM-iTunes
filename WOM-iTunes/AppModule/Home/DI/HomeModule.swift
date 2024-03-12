//
//  HomeModule.swift
//  WOM-iTunes
//
//  Created by Gabriel Alonso Toro Guzmán on 12-03-24.
//

import Swinject

final class HomeModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }
    
    func inject() {
        injectData()
        injectDomain()
        injectPresentation()
    }
}

private extension HomeModule {
    func injectData() {
        container.register(HomeRemoteDataSource.self) { resolver in
            HomeRemoteDataSourceImpl(manager: resolver.resolve(ServiceLayer.self)!)
        }
        container.register(HomeDataSource.self) { resolver in
            HomeRepository(
                remote: resolver.resolve(HomeRemoteDataSource.self)!,
                mapper: resolver.resolve(HomeDataMapper.self)!)
        }
        container.register(HomeDataMapper.self) { resolver in
            HomeDataMapperImpl()
        }
    }

    func injectDomain() {
        container.register(GetItunesListUseCase.self) { resolver in
            GetItunesListUseCase(
                repository: resolver.resolve(HomeDataSource.self)!,
                mapper: resolver.resolve(HomeDomainMapper.self)!)
        }
        container.register(HomeDomainMapper.self) { _ in
            HomeDomainMapperImpl()
        }
    }

    func injectPresentation() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(getItunesListUseCase: resolver.resolve(GetItunesListUseCase.self)!)
        }
        container.register(HomeCoordinator.self) { resolver in
            HomeCoordinator(container: self.container)
        }
        container.register(HomeViewController.self) { resolver in
            HomeViewController(
                resolver.resolve(HomeViewModel.self)!,
                resolver.resolve(HomeCoordinator.self)!,
                resolver.resolve(NotificationCenterWrapper.self)!
            )
        }
    }
}
