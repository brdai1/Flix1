//
//  NowPlayingViewController.swift
//  Flix1
//
//  Created by user143116 on 9/9/18.
//  Copyright © 2018 MSU. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    var movies: [[String:Any]] = []
    var refreshcontrol:UIRefreshControl!
    
    override func viewDidLoad() {
        
        TableView.rowHeight = 210
        
        super.viewDidLoad()
        
        
        
        refreshcontrol = UIRefreshControl ()
        refreshcontrol.addTarget(self, action: #selector(NowPlayingViewController.didPulltoRefresh(_:)), for: .valueChanged)
        TableView.insertSubview(refreshcontrol, at: 0)
        TableView.dataSource = self
        
        fetchMovies()
        
    }
    
    @objc func didPulltoRefresh(_ refreshControl: UIRefreshControl) {
    fetchMovies()
    }
    func fetchMovies () {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=d3354dcd8f42eb5ad57315e1fac299ab")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.TableView.reloadData()
                self.refreshcontrol.endRefreshing()
            }
        }
        task.resume()
        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview = movie["overview"] as! String
        cell.title.text = title
        cell.overview.text = overview
        
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURLString + posterPathString)!
        cell.posterimage.af_setImage(withURL: posterURL)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = TableView.indexPath(for: cell) {
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
