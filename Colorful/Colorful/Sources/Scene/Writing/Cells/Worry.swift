//
//  Worry.swift
//  Colorful
//
//  Created by 박주연 on 2020/12/14.
//

import Foundation

struct Worry {
    var title : String
    var content : String
    var heart : Int
    var qa: Int
    
    init(title:String, content: String, heart: Int, qa: Int){
        self.title = title
        self.content = content
        self.heart = heart
        self.qa = qa
    }
}


