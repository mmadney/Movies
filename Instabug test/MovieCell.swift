//
//  MovieCell.swift
//  Instabug test
//
//  Created by Mohamed on 8/5/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieDate: UILabel!
    @IBOutlet weak var MovieOverView: UITextView!
    @IBOutlet weak var MovieTitle: UILabel!
    
    func setMovie(movie : Movie)
    {
        if movie.movieImage != "" {
             MovieImage.image = getImage(imageUrl: movie.movieImage).image
        }
        else
        {
            MovieImage = movie.uimovieimage
        }
        MovieDate.text = movie.relaseDate
        MovieOverView.text = movie.overview
        MovieTitle.text = movie.title
    }
    
    func getImage(imageUrl : String) -> UIImageView {
        let url = URL(string: imageUrl)
        let image = UIImage(named: "")
        let imageview = UIImageView(image: image)
        imageview.kf.setImage(with: url)
        return imageview
    }
}
