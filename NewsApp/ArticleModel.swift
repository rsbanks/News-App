//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Rebecca Banks on 08/06/2020.
//  Copyright © 2020 Rebecca Banks. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
    
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Create a string URL
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a9b2c3cb3e234705956ace667110ccea"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it isn't nil
        guard url != nil else {
            print("Could't create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there are no erros and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the data
                let decoder = JSONDecoder()
                
                do {
                    // Parse the JSON in article service
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view vontroller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                }
                catch {
                    
                    print("Error parsing the JSON")
                } // End Do - Catch
                
            } // End if
            
        } // End Data Task
        
        // Start the data task
        dataTask.resume()
        
    }
}


