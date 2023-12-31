//
//  NetworkWorker+SessionProvider.swift
//  CellcomHomeTask
//
//  Created by Евгений Кулиничев on 19.11.2023.
//

import CellcomHometaskModels
import CellcomHometaskProtocols

extension NetworkWorker: SessionProvider {
    func generateSession(token: RequestToken, completion: @escaping (Result<Session, MovieFetchingError>) -> Void) -> CancelableDataLoadingTask? {
        let urlPath = createUrlWithApiKey(Paths.createSession)
        guard let url = urlPath.url else { return nil }
        return post(url: url, object: token, completion: completion)
    }
}

extension NetworkWorker.Paths {
    static let createSession = "https://api.themoviedb.org/3/authentication/session/new"
}

