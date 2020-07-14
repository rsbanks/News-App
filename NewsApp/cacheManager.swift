//
//  cacheManager.swift
//  NewsApp
//
//  Created by Rebecca Banks on 08/06/2020.
//  Copyright © 2020 Rebecca Banks. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        
        // Save the image data along with the url
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data or nil
        return imageDictionary[url]
    }
        
    
    
}
