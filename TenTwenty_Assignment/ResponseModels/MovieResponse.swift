//
//  MovieResponse.swift
//  TenTwenty_Assignment
//
//  Created by Haroon Shoukat on 30/10/2021.
//

import Foundation
import ObjectMapper

class MovieResponse: NSObject, Mappable {
    var page: Int = 0
    var result: [MoviesResult] = []
    var total_pages: Int = 0
    var total_results: Int = 0
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        result <- map["results"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
    }
}

class MoviesResult: NSObject, Mappable {
    
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
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        genre_ids <- map["genre_ids"]
        id <- map["id"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
}
