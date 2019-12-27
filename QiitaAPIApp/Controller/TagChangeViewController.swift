//
//  TagChangeViewController.swift
//  QiitaAPIApp
//
//  Created by remuty on 2019/11/30.
//  Copyright © 2019 remuty. All rights reserved.
//

import UIKit

class TagChangeViewController: UIViewController {

    @IBOutlet weak var tagTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "back", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstVC = segue.destination as? FirstViewController
        firstVC?.tagName = tagTextField.text!
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
