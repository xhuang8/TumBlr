//
//  PhotoDetailsViewController.swift
//  Tumblr~Feed
//
//  Created by XiaoQian Huang on 9/14/18.
//  Copyright © 2018 XiaoQian Huang. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    
    
    @IBOutlet weak var backDropImageView: UIImageView!
    
    var post: [String: Any]?
    
    //var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        fetchPhoto()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl) {
        fetchPhoto()
    }
    
    func fetchPhoto(){
        if let post = post {
            
            if let photos = post["photos"] as? [[String: Any]] {
                // 1.
                let photo = photos[0]
                // 2.
                let originalSize = photo["original_size"] as! [String: Any]
                // 3.
                let urlString = originalSize["url"] as! String
                // 4.
                let url = URL(string: urlString)
                //cell.photoImageView.af_setImage(withURL: url!)
                backDropImageView.af_setImage(withURL: url!)
                
            }
            
            // backDropImageView.af_setImage(withURL: url)
        }
        // backDropImageView.af_setImage(withURL: url)
        //self.refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
