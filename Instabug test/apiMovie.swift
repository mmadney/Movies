//
//  apiMovie.swift
//  Instabug test
//
//  Created by Mohamed on 8/27/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import Foundation
import UIKit
class apiMovie : Movie
{
    
    var movieImage : String = ""
    
    
    init(title: String ,overview: String,relaseDate: String,movieImage:String)
    {
        self.movieImage = movieImage
        super.init(title: title, overview: overview, relaseDate: relaseDate)
    }

}
