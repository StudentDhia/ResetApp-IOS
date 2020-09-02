//
//  DailyQuizS2ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 11/01/2018.
//  Copyright © 2018 Walid Helaoui. All rights reserved.
//

import UIKit

class DailyQuizS2ViewController: UIViewController {
    
    var info1: String!
    var reponses: SmokingInfosViewController?
    @IBOutlet weak var reponse2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "daily2Segue" {
            
            self.reponses = segue.destination as? SmokingInfosViewController
            self.reponses?.infoS1 = info1
            self.reponses?.infoS2 = (reponse2.text)
        }
    }
    
    

}
