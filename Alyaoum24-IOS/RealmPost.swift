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
     dynamic var _content:String?
     dynamic var _category:String?
     dynamic var _created_at:String?
    
     var _date:String?
     var _url:String?
     var _url_thumb:String?
     var _type:String?
    
    init(){
        
    }
    
    init(title:String,image:String,content:String){
        self._title = title
        self._url_thumb = image
        self._content = content
    }
   

//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
}
