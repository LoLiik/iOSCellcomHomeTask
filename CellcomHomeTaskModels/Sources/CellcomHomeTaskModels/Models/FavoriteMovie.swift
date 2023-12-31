//
//  FavoriteMovie.swift
//  CellcomHomeTask
//
//  Created by Евгений Кулиничев on 19.11.2023.
//

public struct FavoriteMovie: Encodable {
    public let id: Int
    public let isFavorite: Bool
    public let mediaType: String
    
    public init(id: Int, isFavorite: Bool, mediaType: String = "movie") {
        self.id = id
        self.isFavorite = isFavorite
        self.mediaType = mediaType
    }
}
