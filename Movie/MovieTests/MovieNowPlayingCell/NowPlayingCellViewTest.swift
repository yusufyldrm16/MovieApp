//  NowPlayingCellViewTest.swift
//  MovieTests
//  Created by Yusuf Muhammet Yıldırım on 5/4/22.

@testable import Movie

final class NowPlayingCellViewTest: NowPlayingCellProtocol {
    var invokeSetTitle = false
    var invokeSetImage = false
    
    func setTitle(_ text: String) {
        invokeSetTitle = true
    }
    
    func setImage(_ urlString: String) {
        invokeSetImage = true
    }
}
