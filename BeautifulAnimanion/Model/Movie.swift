//
//  Movie.swift
//  BeautifulAnimanion
//
//  Created by evilb on 02.04.2022.
//

import SwiftUI

// MARK: Movie Data Model and Sample Movie Data
struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
    Movie(movieTitle: "Mad Max", artwork: "Movie1"),
    Movie(movieTitle: "Alita Battle Angel", artwork: "Movie2"),
    Movie(movieTitle: "Star Wars", artwork: "Movie3"),
    Movie(movieTitle: "Blade Runner 2049", artwork: "Movie4"),
    Movie(movieTitle: "Joker", artwork: "Movie5"),
    Movie(movieTitle: "Warcraft", artwork: "Movie6"),
    Movie(movieTitle: "Scott Piligrim vs the World", artwork: "Movie7")
]
