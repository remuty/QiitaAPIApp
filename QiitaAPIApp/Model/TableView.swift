//
//  TableView.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/12/03.
//  Copyright © 2019 remuty. All rights reserved.
//

import Foundation
import UIKit

class TableView:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
           super.viewDidLoad()
        tableView.delegate = self
         tableView.dataSource = self
         
         tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
         tableView.rowHeight = UITableView.automaticDimension
         //可変
         tableView.estimatedRowHeight = 80
        Qiita.fetchArticleSearch(keyword: textField.text!,completion: { (articles) in
             self.articles = articles
             DispatchQueue.main.async {
                 self.tableView.reloadData()
             }
         })
       }
}
