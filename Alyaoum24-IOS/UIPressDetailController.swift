//
//  UIPressDetailController.swift
//  Alyaoum24-IOS
//
//  Created by AKRAM on 17/08/2016.
//  Copyright © 2016 AKRAM. All rights reserved.
//

import UIKit

class UIPressDetailController :UIViewController{
    
    var posts: RealmPost!
    
    @IBOutlet weak var PTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        PTitle.text = posts._content!
    }
    
}