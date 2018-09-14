//
//  DetailViewController.swift
//  Flix1
//
//  Created by user143116 on 9/13/18.
//  Copyright © 2018 MSU. All rights reserved.
//

import UIKit

enum Moviekeys {
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
    
    
}
class DetailViewController: UIViewController {

    
    @IBOutlet weak var BackDropImageview: UIImageView!
    
    @IBOutlet weak var PosterImageView: UIImageView!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var OverviewLabel: UILabel!
    
    @IBOutlet weak var ReleaseDateLabel: UILabel!
    
    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie { TitleLabel.text = movie[Moviekeys.title] as? String
            ReleaseDateLabel.text = movie["release_date"] as? String
            OverviewLabel.text = movie["overview"] as? String
            
            let backdropPathString = movie[Moviekeys.backdropPath] as! String
            
            let posterPathString = movie[Moviekeys.posterPath] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            BackDropImageview.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + posterPathString)!
            PosterImageView.af_setImage(withURL: posterPathURL)
            
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
