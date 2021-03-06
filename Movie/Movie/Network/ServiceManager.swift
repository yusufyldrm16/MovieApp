// ServiceManager.swift
//  Movie
//  Created by Yusuf Muhammet Yıldırım on 4/25/22.


protocol MovieServiceProtocol {
    func fetchMovieNowPlaying(completion: @escaping (MovieSourceResult) -> ())
    func fetchMovieUpcoming(completion: @escaping (MovieSourceResult) -> ())
    func fetchMovieDetail(id: Int, completion: @escaping(MovieDetailResult) -> ())
    func fetchSimilarMovies(id: Int, completion: @escaping(MovieSourceResult) -> ())
    func fetchSearchMovie(query: String, comletion: @escaping(MovieSourceResult) -> ())
} 

struct MovieService: MovieServiceProtocol {
    func fetchMovieNowPlaying(completion: @escaping (MovieSourceResult) -> ()) {
        MovieNetworkManager.shared.request(Router.nowPlaying, completion: completion)
    }

    func fetchMovieUpcoming(completion: @escaping (MovieSourceResult) -> ()) {
        MovieNetworkManager.shared.request(Router.upcoming, completion: completion)
    }

    func fetchMovieDetail(id: Int, completion: @escaping(MovieDetailResult) -> ()) {
        MovieNetworkManager.shared.request(Router.movie(id: id), completion: completion)
    }

    func fetchSimilarMovies(id: Int, completion: @escaping (MovieSourceResult) -> ()) {
        MovieNetworkManager.shared.request(Router.similarMovies(id: id), completion: completion)
    }

    func fetchSearchMovie(query: String, comletion: @escaping (MovieSourceResult) -> ()) {
        MovieNetworkManager.shared.request(Router.searchMovie(query: query), completion: comletion)
    }
}
