//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Rebecca Banks on 08/06/2020.
//  Copyright © 2020 Rebecca Banks. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Check that theres a url
        if articleUrl != nil {
            
            // Create the URL object
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                // Couldn't create the URL object
                return
            }
            // Create the URLRequest object
            let request = URLRequest(url: url!)
            
            // Show spinner and start it
            spinner.alpha = 1
            print("spinner start")
            spinner.startAnimating()
            
            // Load the url in the web view
            webView.load(request)
        }
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: WKNavigationDelegate {
    
    // Called when the content in the detail view finished loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // Stop the spinner and hide it
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
