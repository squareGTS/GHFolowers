//
//  PersistanceManager.swift
//  GHFolowers
//
//  Created by Maxim Bekmetov on 14.10.2022.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistanceManager {

    static private let defaults = UserDefaults.standard

    enum Keys {
        static let favorites = "favorites"
    }

    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping (GFError?) -> Void) {
        retriveFavorites{ result in

            switch result {
            case .success(let favorites):
                var retriveFavorites = favorites

                switch actionType {
                case .add:
                    guard !retriveFavorites.contains(favorite) else {
                            completed(.alreadyInFavorites)
                            return
                }
                    retriveFavorites.append(favorite)

                case .remove:
                    retriveFavorites.removeAll{ $0.login == favorite.login }
                }

                completed(save(favorities: retriveFavorites))

            case .failure(let error):
                completed(error)
            }

        }

    }

    static func retriveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }

        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }

    static func save(favorities: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let ecncodedFavorites = try encoder.encode(favorities)
            defaults.set(ecncodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
