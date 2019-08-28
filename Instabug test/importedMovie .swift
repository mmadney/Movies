//
//  importedMovie .swift
//  Instabug test
//
//  Created by Mohamed on 8/27/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import Foundation
import UIKit
class importedMovie: Movie
{
     var uimovieimage : UIImage? = nil
    
    init(title: String ,overview: String,relaseDate: String, movieImage:UIImage)
    {
        self.uimovieimage = movieImage
        super.init(title: title, overview: overview, relaseDate: relaseDate)
    }
}

