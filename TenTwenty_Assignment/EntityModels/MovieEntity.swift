//
//  MovieEntity.swift
//  TenTwenty_Assignment
//
//  Created by Haroon Shoukat on 30/10/2021.
//

import Foundation

class MovieEntity: NSObject {
    var page: Int = 0
    var result: [MoviesResultEntity] = []
    var total_pages: Int = 0
    var total_results: Int = 0
 
}

class MoviesResultEntity: NSObject {
    
    var adult: Bool = false
    var backdrop_path: String = ""
    var genre_ids: [Int] = []
    var id: Int = 0
    var original_language: String = ""
    var original_title: String = ""
    var overview: String = ""
    var popularity: Float = 0.0
    var poster_path: String = ""
    var release_date: String = ""
    var title: String = ""
    var video: Bool = false
    var vote_average: Float = 0.0
    var vote_count: Int = 0
}

