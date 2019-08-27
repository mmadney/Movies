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
    
    init(title: String ,overview: String,relaseDate: String) {
        self.relaseDate = relaseDate
        self.overview = overview
        self.title = title
    }
}
