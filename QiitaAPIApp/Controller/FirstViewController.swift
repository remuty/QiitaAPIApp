//
//  FirstViewController.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/11/29.
//  Copyright © 2019 remuty. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tagName = String()
    var url = String()
    
    fileprivate var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.object(forKey: "tag") != nil{
            tagName = UserDefaults.standard.object(forKey: "tag") as! String
        }else{
            tagName = "Swift"
        }
        self.navigationController?.navigationBar.topItem?.title = "\(tagName)の最新の投稿"
        Qiita.fetchArticleWithTag(tagName: self.tagName,completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //記事の数
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! TableViewCell
        cell.articleTitleLabel.text = articles[indexPath.row].title
        cell.userNameLabel.text = articles[indexPath.row].user.id
        let likesCount = articles[indexPath.row].likes_count
        cell.likesCountLabel.text = "\(likesCount)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //選択した時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        url = articles[indexPath.row].url
        // 別の画面に遷移
        performSegue(withIdentifier: "article", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "article" {
            let nextVC = segue.destination as! ArticleViewController
            nextVC.articleUrl = self.url
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
