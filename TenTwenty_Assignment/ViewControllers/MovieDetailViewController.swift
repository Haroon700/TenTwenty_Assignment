//
//  MovieDetailViewController.swift
//  TenTwenty_Assignment
//
//  Created by Haroon Shoukat on 30/10/2021.
//

import Foundation
import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var movieImageView: UITableView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOverView: UITextView!


    //MARK:- Public API
    public var movieObject: MoviesResultEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    // do all initial things here like delegate, register cells, set and get etc
    private func setup(){
        sendRequestForGetMoviesDetail()
        self.title = "Movie Detail"
        self.movieTitle.text = self.movieObject?.original_title
        self.movieType.text = self.movieObject?.original_language
        self.movieOverView.text = self.movieObject?.overview
//        self.movieImageView.text = self.movieObject?.original_title
        self.movieReleaseDate.text = self.movieObject?.release_date

    }
    
    //MARK: - Network cals
    private func sendRequestForGetMoviesDetail(){
        let url = " https://api.themoviedb.org/3/movie/\(movieObject?.id)?api_key=299fadf332a4d336793554d57d0688eb"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString { (response) in
            switch response.result {
            case let .success(result):
                do{
//                    let response: MovieResponse = try Mapper<MovieResponse>().map(JSONString: response.result.get())!
//                    self.ConvertResponseToEntity(response: response)
//                    print("success\(response)")
//                    self.movieTableView.reloadData()
                    
                    }
                catch{
                }
            case .failure(_):
                do{
                    print("failure")
//                    failure(true)
                }
            }
            
        }
    }
}
