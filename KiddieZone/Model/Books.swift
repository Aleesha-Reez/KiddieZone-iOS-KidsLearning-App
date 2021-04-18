//
//  Books.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/11/21.
//

import Foundation

class Books{
    
   
    var id : String = ""
    var title : String = ""
    var authors : String = ""
    var desc : String = ""
    var imurl : String = ""
    var url : String = ""
    
    init(id: String, title:  String, authors: String, imurl: String, url: String, desc: String ) {
        self.id = id
        self.title = title
        self.authors = authors
        self.imurl = imurl
        self.url = url
        self.desc = desc
        
    }
}

