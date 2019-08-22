//
//  Movie.swift
//  Instabug test
//
//  Created by Mohamed on 8/4/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    var title : String = ""
    var overview : String = ""
    var relaseDate : String = ""
    var movieImage : String = ""
    var uimovieimage : UIImageView? = nil
    
    init(title: String ,overview: String,relaseDate: String,movieImage:String) {
        self.relaseDate = relaseDate
        self.overview = overview
        self.title = title
        self.movieImage = movieImage
    }
    
    init(title: String ,overview: String,relaseDate: String,movieImage:UIImageView) {
        self.relaseDate = relaseDate
        self.overview = overview
        self.title = title
        self.uimovieimage = movieImage
    }
    

}
