//
//  NetworkWorker+SessionUpdater.swift
//  CellcomHomeTask
//
//  Created by Евгений Кулиничев on 19.11.2023.
//

import CellcomHometaskProtocols

extension NetworkWorker: SessionUpdater {
    public func updateSessionId(_ sessionId: String) {
        Config.sessionId = sessionId
    }
}


