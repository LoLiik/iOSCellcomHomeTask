//
//  NetworkWorker+AccountDetailsProvider.swift
//  CellcomHomeTask
//
//  Created by Евгений Кулиничев on 19.11.2023.
//

import CellcomHometaskModels
import CellcomHometaskProtocols

extension NetworkWorker: AccountDetailsProvider {
    public func fetchAccountDetails(completion: @escaping (Result<Account, MovieFetchingError>) -> Void) -> CancelableDataLoadingTask? {
        guard let sessionId = Config.sessionId else { return nil }
        let urlPath = createUrlWithApiKey(Paths.accountDetails).addParameter(parameterName: "session_id", value: sessionId)
        guard let url = urlPath.url else { return nil }
        return fetch(url: url, completion: completion)
    }
}

extension NetworkWorker.Paths {
    static var accountDetails: String { "https://api.themoviedb.org/3/account" }
}
