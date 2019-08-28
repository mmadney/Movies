//
//  MovieViewController.swift
//  Instabug test
//
//  Created by Mohamed on 8/20/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

protocol addMovieDelegate {
    func addMovieCell(movie : importedMovie)
}
class MovieViewController: UIViewController , UINavigationControllerDelegate , UIImagePickerControllerDelegate  {
    
    var delegate : addMovieDelegate?
    
    @IBOutlet weak var Uploadimage: UIImageView!
    @IBOutlet weak var titleTexet: UITextField!
    @IBOutlet weak var overviewTexet: UITextView!
    @IBOutlet weak var date: UITextField!
    @IBAction func Add(_ sender: Any) {
        let movie = importedMovie(title: titleTexet.text!, overview: overviewTexet.text!, relaseDate: date.text!, movieImage: Uploadimage.image!)
        delegate?.addMovieCell(movie: movie)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Import(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image , animated: true)
        {
            //after is compltesd
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            Uploadimage.image = image
        }
        else
        {
            print("err message")
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
