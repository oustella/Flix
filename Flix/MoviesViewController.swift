//
//  MoviesViewController.swift
//  Flix
//
//  Created by OSL on 2/19/22.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]()  // creating an array of dictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        tableView.delegate = self
//        tableView.rowHeight = 160
        
        // Download movies and store to movie dictionary
        // Get the array of movies
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 // Store the movies in a property to use elsewhere
                 self.movies = dataDictionary["results"] as! [[String:Any]]  //casting
                 // Reload your table view data
                 self.tableView.reloadData()

             }
        }
        task.resume()
    }
    
        // function can be in any order
        // these two are created by adding the UITableView to class
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell  //dequeueReusableCell use recycled cells that are off screen
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String  //casting: define a var's type
        let synopsis = movie["overview"] as! String
        let voteAvg = round(movie["vote_average"] as! Double * 100) / 100.0
        let voteCount = "(\(movie["vote_count"] ?? "0") votes)"
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        cell.ratingLabel.text = String(voteAvg)
        cell.ratingLabel.textColor = voteAvg < 5.0 ? UIColor.systemRed : (voteAvg > 8.0 ? UIColor.systemGreen : UIColor.systemOrange)
        cell.voteCountLabel.text = voteCount
        // set poster image
        let baseUrl = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        cell.posterView.af.setImage(withURL: posterUrl)
        
        return cell
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
        // Pass it to the MovieDetailVC
        let detailVC = segue.destination as! MovieDetailViewController
        detailVC.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}

