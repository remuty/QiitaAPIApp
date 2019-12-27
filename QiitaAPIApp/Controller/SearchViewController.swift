//
//  SearchViewController.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/12/03.
//  Copyright © 2019 remuty. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    var url = String()
    fileprivate var articles: [Article] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
         
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
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
         performSegue(withIdentifier: "search", sender: nil)
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "search" {
             let nextVC = segue.destination as! ArticleViewController
             nextVC.articleUrl = self.url
         }
     }

    //検索
    @IBAction func searchButton(_ sender: Any) {
        Qiita.fetchArticleSearch(keyword: textField.text!,completion: { (articles) in
             self.articles = articles
             DispatchQueue.main.async {
                 self.tableView.reloadData()
             }
        })
    }
    
    //タッチでキーボードを閉じる
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       view.endEditing(true)
   }
    
    //リターン
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        Qiita.fetchArticleSearch(keyword: textField.text!,completion: { (articles) in
             self.articles = articles
             DispatchQueue.main.async {
                 self.tableView.reloadData()
             }
        })
        return true
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
