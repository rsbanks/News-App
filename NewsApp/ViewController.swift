//
//  ViewController.swift
//  NewsApp
//
//  Created by Rebecca Banks on 08/06/2020.
//  Copyright © 2020 Rebecca Banks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view controller as the data soruce and the delegate of the tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
        
        
    }
    
    // Gets called every time a segue happens
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Detect the index path of the article the user selected
        let indexPath = tableView.indexPathForSelectedRow
        guard indexPath != nil else {
            // The user hasnt selected anything
            return
        }
        // Get the article that the user tapped on
        let article = articles[indexPath!.row]
        
        // Get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        // Pass the article to the detail view controller
        detailVC.articleUrl = article.url!
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article that the table view is asking about
        let article = articles[indexPath.row]
        
        // Customise it
        cell.displayArticle(article)
        
        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // User has just selected a row, trigger the segue to go to detail
        performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
    
}

extension ViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocol Methods
    func articlesRetrieved(_ articles: [Article]) {
        
        // Set the articles property of the View controller to the articles pass back from the model
        self.articles = articles
        
        // Refresh the tableview
        tableView.reloadData()
        
    }


}

