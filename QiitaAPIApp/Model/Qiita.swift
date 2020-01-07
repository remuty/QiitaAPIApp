//
//  Qiita.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/12/03.
//  Copyright © 2019 remuty. All rights reserved.
//

import Foundation

struct Qiita {
    
    //タグをもとに記事情報を取得
    static func fetchArticleWithTag(tagName: String,completion: @escaping ([Article]) -> Swift.Void) {
        
        
        let url = "https://qiita.com/api/v2/tags/\(tagName)/items"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    //全ての記事の中から検索
    static func fetchArticleSearch(keyword: String,completion: @escaping ([Article]) -> Swift.Void) {
        
        
        let url = "https://qiita.com/api/v2/items"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),URLQueryItem(name: "query", value: "\(keyword)")
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
