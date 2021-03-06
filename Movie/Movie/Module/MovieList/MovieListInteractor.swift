//  MovieListInteractor.swift
//  Movie
//  Created by Yusuf Muhammet Yıldırım on 5/4/22.

//MARK: - PROTOCOLS
protocol MovieListInteractorProtocol: AnyObject {
    func fetchMovieNowPlaying()
    func fetchMovieUpcoming()
    func fetchSearchMovie(query: String)
}

protocol MovieListInteractorOutputProtocol: AnyObject {
    func fetchMovieNowPlayingOutput(result: MovieSourceResult)
    func fetchMovieUpcomingOutput(result: MovieSourceResult)
    func fetchSearchMovieOutput(result: MovieSourceResult)
}

typealias MovieSourceResult = Result<MovieSourceResponse, Error>
fileprivate var movieService: MovieServiceProtocol = MovieService()

//MARK: - CLASS
final class MovieListInteractor {
    var output: MovieListInteractorOutputProtocol?
}

//MARK: - EXTENSIONS
extension MovieListInteractor: MovieListInteractorProtocol {
    func fetchSearchMovie(query: String) {
        movieService.fetchSearchMovie(query: query) { [weak self] result in
            guard let self = self else { return }
            self.output?.fetchSearchMovieOutput(result: result)
        }
    }
    
    func fetchMovieNowPlaying() {
        movieService.fetchMovieNowPlaying { [weak self] result in
            guard let self = self else { return }
            self.output?.fetchMovieNowPlayingOutput(result: result)
        }
    }
    
    func fetchMovieUpcoming() {
        movieService.fetchMovieUpcoming { [weak self] result in
            guard let self = self else { return }
            self.output?.fetchMovieUpcomingOutput(result: result)
        }
    }
}
