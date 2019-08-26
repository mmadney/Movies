//
//  ViewController.swift
//  Instabug test
//
//  Created by Mohamed on 8/1/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

struct jsondata : Decodable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [results]
}
struct results : Decodable {
    let title : String
    let poster_path : String
    let overview : String
    let release_date : String
}

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, addMovieDelegate {
   
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var TableView: UITableView!
    
    let url : String = "http://api.themoviedb.org/3/discover/movie?api_key=acea91d2bff1c53e6604e4985b6989e2&page=1"
    let imageurl : String = "https://image.tmdb.org/t/p/w500"
    let dispatchGroup = DispatchGroup()
    var movies : [Movie] = []
    var myMovies : [Movie] = [] 
    let sectionName : [String] = ["My Movies" , "All Movies"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityView.center = self.view.center
         getMovieData()
        dispatchGroup.notify(queue: .main) {
            self.activityView.stopAnimating()
            self.TableView.reloadData()
        }

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = sectionName[section]
        return label
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return movies.count
        }
        else
        {
            return myMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //let movieRow = movies[indexPath.row]
        let movieRow = indexPath.section == 0 ? myMovies[indexPath.row] : movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        cell.setMovie(movie: movieRow)
        return cell
        
    }
    
    func getMovieData() {
        activityView.startAnimating()
        dispatchGroup.enter()
        let url = URL(string: self.url)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else {return}
            do {
                let moviesdata = try JSONDecoder().decode(jsondata.self, from: data)
                for result in moviesdata.results {
                    let imagepath = self.imageurl + result.poster_path
                    let addmovie = Movie(title: result.title, overview: result.overview, relaseDate: result.release_date, movieImage: imagepath )
                    self.movies.append(addmovie)
                }
                self.dispatchGroup.leave()
            } catch let jsonErr {
                print("Error in serilzation jason",jsonErr)
            }
            
        }.resume()
    }
    
    func addMovieCell(movie: Movie) {
        myMovies.append(movie)
        TableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "sendDataFowrad" {
            let destvc = segue.destination as! MovieViewController
            destvc.delegate = self
        }
        
    }
    
}

