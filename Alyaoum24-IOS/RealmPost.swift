//
//  RealmPost.swift
//  Alyaoum24-IOS
//
//  Created by AKRAM on 16/08/2016.
//  Copyright © 2016 AKRAM. All rights reserved.
//

import Foundation


class RealmPost {
    

    dynamic var _id:String?
    dynamic var _title:String?
    private dynamic var _content:String?
    private dynamic var _category:String?
    private dynamic var _created_at:String?
    
    private var _date:String?
    private var _url:String?
    private var _url_thumb:String?
    private var _type:String?
    
    init(){
        
    }
    
    init(title:String){
        self._title = title
    }
   

//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
}
