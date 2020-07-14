//
//  Article.swift
//  NewsApp
//
//  Created by Rebecca Banks on 08/06/2020.
//  Copyright © 2020 Rebecca Banks. All rights reserved.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
