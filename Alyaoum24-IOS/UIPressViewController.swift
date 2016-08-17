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

                    var obj = RealmPost()

                    if let bTitle = subJson["title"].string{
                        obj._title = subJson["title"].string!
                    
                        print("JSON HERE : "+obj._title!)
                        
                    }
                    
                }
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
            }
        }
        let posts1 = RealmPost(title: "ABAC")
        self.posts += [posts1]

        dispatch_async(dispatch_get_main_queue(), {
            // Update your UI here
            self.tableView.reloadData()
           
        })
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("COUNT : ",posts.count)
        return posts.count
    }
    
    private struct storyboard {
        static let cellReuseIdentifier = "cell1"
        static let segueIdentifier = "postDetail"
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(storyboard.cellReuseIdentifier, forIndexPath: indexPath) as! UIPressCellViewController

        let post = posts[indexPath.row]
      
        cell.titleUI.text = post._title
              
        
        return cell
    }
    
    
    
    

}