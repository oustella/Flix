//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by OSL on 2/26/22.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {

    var movie: [String:Any]!
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTitleLabel.text = movie["title"] as? String
        synopsisLabel.text = movie["overview"] as? String
        
        // set poster image
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        posterImage.af.setImage(withURL: posterUrl)
        backdropImage.af.setImage(withURL: backdropUrl)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
