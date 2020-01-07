//
//  SettingViewController.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/11/30.
//  Copyright © 2019 remuty. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var tagTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagTextField.delegate = self
    }
    
    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tagTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //検索するタグを変更
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if tagTextField.text != ""{
            UserDefaults.standard.set(tagTextField.text,forKey: "tag")
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
