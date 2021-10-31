//
//  ViewController.swift
//  TenTwenty_Assignment
//
//  Created by Haroon Shoukat on 29/10/2021.
//

import UIKit
import Alamofire
import ObjectMapper
import SDWebImage

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var movieTableView: UITableView!
    
    //MARK:- Private API
    private var movieList: [MoviesResultEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    // do all initial things here like delegate, register cells, set and get etc
    private func setup(){
        self.title = "Movie Catalog"
        Common.setApiKey("299fadf332a4d336793554d57d0688eb")
        sendRequestForGetMoviesList()
        self.movieTableView?.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
    }
    
    
    //MARK: - Network cals
    private func sendRequestForGetMoviesList(){
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=299fadf332a4d336793554d57d0688eb&language=en-US&page=3"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseString { (response) in
            switch response.result {
            case let .success(result):
                do{
                    let response: MovieResponse = try Mapper<MovieResponse>().map(JSONString: response.result.get())!
                    self.ConvertResponseToEntity(response: response)
                    print("success\(response)")
                    self.movieTableView.reloadData()
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
    
    //MARK: - Method
    
    private func ConvertResponseToEntity(response: MovieResponse){
        
        for item in response.result {
            let movie: MoviesResultEntity = MoviesResultEntity()
            movie.adult = item.adult
            movie.backdrop_path = item.backdrop_path
            movie.genre_ids = item.genre_ids
            movie.id = item.id
            movie.original_language = item.original_language
            movie.original_title = item.original_title
            movie.overview = item.overview
            movie.popularity = item.popularity
            movie.poster_path = item.poster_path
            movie.release_date = item.release_date
            movie.title = item.title
            movie.video = item.video
            movie.vote_count = item.vote_count
            movie.vote_average = item.vote_average
            self.movieList.append(movie)
        }
    }
    
    private func moveOnMovieDetail(indexPath: IndexPath){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        vc?.movieObject = self.movieList[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}

//MARK:- TableView Delgate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       moveOnMovieDetail(indexPath: indexPath)
    }
}

//MARK:- TableView DataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as! MovieTableViewCell
        let movieItem = self.movieList[indexPath.row]
        cell.movieTitle.text = movieItem.original_title
//        cell.movieImage.sd_setImage(with: URL(string: movieItem.poster_path))

        return cell
    }
    
    
}

