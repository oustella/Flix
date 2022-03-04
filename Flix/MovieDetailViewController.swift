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
    var trailer_ep = [[String:Any]]()

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
        
        // request trailer endpoint
        let movieID = movie["id"] as! Int32  // without the int casting the url will have optional() surrounding the number
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 // The end point returns an array of trailers
                 self.trailer_ep = dataDictionary["results"] as! [[String:Any]]  //casting
             }
        }
        task.resume()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get the trailerKey from the trailer endpoint
        // if the trailer end point returns no trailer then don't segque
        if self.trailer_ep.isEmpty {
            print("No trailer")
        // else try to get a trailer key associated with a video clip whose name contains "trailer"
        } else {
            var tempTrailerKey: String?
            for trailer in self.trailer_ep{
                let trailerName = trailer["name"] as! String
                if trailerName.lowercased().contains("trailer"){
                    tempTrailerKey = trailer["key"] as? String
                    break
                }
            }
            // default trailer key is the first trailer if there is no trailer with 'trailer' in the name
            let trailerKey = tempTrailerKey ?? self.trailer_ep[0]["key"] as! String
            let trailVC = segue.destination as! TrailerViewController
            trailVC.trailerKey = trailerKey
        }
        
    }

}
