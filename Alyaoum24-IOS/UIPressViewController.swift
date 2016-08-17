//
//  UIPressViewController.swift
//  Alyaoum24-IOS
//
//  Created by AKRAM on 16/08/2016.
//  Copyright © 2016 AKRAM. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class UIPressViewController: UITableViewController {
    
    var posts = [RealmPost]()
    
    var arrayTitle: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView = UITableView(frame: view.frame)
       tableView.delegate = self
       tableView.dataSource = self
       
   

       self.didLoadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    func didLoadData(){
        
        Alamofire.request(.GET, "https://www.alyaoum24.com/mobileapi/get_posts/?count=50").responseJSON {
            response in
            switch response.result {
            case .Success(let data):
                let json = JSON(data)
                let data = json["posts"]
                for (key, subJson) in data {

                
                    
                    let thumbnail = subJson["thumbnail"]["url"].string
                    let posts1 = RealmPost(title: subJson["title"].string!,image: thumbnail!,content: subJson["content_raw"].string!)

                    self.posts += [posts1]
                    
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        self.tableView.reloadData()
                        
                    })

                    
//
                }
                
         
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
     
        

           }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    private struct storyboard {
        static let cellReuseIdentifier = "cell1"
        static let segueIdentifier = "detailPress"
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(storyboard.cellReuseIdentifier, forIndexPath: indexPath) as! UIPressCellViewController

        let post = posts[indexPath.row]
      
        cell.titleUI.text = post._title
       // cell.UImage.image = UIImage(named: post._url!)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == storyboard.segueIdentifier{
            if let indexPath = tableView.indexPathForSelectedRow{
                let post = posts[indexPath.row]
                let postDetail = segue.destinationViewController as! UIPressDetailController
                postDetail.posts = post
                
            }
            
            
        }
    }
    

    
    
    
    

}