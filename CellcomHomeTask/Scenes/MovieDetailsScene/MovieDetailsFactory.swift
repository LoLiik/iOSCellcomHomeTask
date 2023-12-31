//
//  MovieDetailsFactory.swift
//  CellcomHomeTask
//
//  Created by Евгений Кулиничев on 27.11.2023.
//

import CellcomHometaskNetwork
import CellcomHometaskModels
import UIKit

protocol MovieDetailsFactoryProtocol: AnyObject {
    func buildMovieDetails(with movie: Movie, completion: @escaping (Bool) -> Void) -> UIViewController
}

class MovieDetailsFactory: MovieDetailsFactoryProtocol {
    func buildMovieDetails(with movie: Movie, completion: @escaping (Bool) -> Void) -> UIViewController {
        let coordinator = MovieDetailsCoordinator()
        let networkWorker = NetworkWorker()
        let authWorker = AuthWorkerFactory.build(userAuthPermissionRequestWorker: coordinator, sessionUpdater: networkWorker)
        let authNetworkDecorator = AuthenticationNetworkDecorator(decoratee: networkWorker, authWorker: authWorker)
        
        let accountDetailsProviderWorker = AccountDetailsProviderWorkerFactory.build(accountUpdater: networkWorker)
        let accountDetailsAndAuthNetworkDecorator = AccountDetailsProviderNetworkDecorator(decoratee: authNetworkDecorator, accountDetailsProvider: accountDetailsProviderWorker)
        
        let errorAlertFactory = ErrorAlertFactory()
        let router = MovieDetailsRouter(coordinator: coordinator, errorAlertFactory: errorAlertFactory)
        
        let viewModel = MovieDetailsViewModel(
            movie: movie,
            movieUpdater: accountDetailsAndAuthNetworkDecorator,
            highResImageProvider: networkWorker,
            router: router,
            updateCompletion: completion
        )
        
        let viewController = MovieDetailsViewController(viewModel: viewModel)
        coordinator.viewController = viewController
        
        return viewController
    }
}
