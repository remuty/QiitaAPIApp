//
//  ArticleViewController.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/12/02.
//  Copyright © 2019 remuty. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController,WKNavigationDelegate {

    let webView = WKWebView()
    var articleUrl = String()
    
    @IBOutlet weak var toolBar: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        view.addSubview(webView)
        
        //ロードするもの
        webView.navigationDelegate = self
        let url = URL(string: "\(articleUrl)")
        let request = URLRequest(url: url!)
        webView.load(request)
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
