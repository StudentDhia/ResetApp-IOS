//
//  DailyQuizA1ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 12/01/2018.
//  Copyright © 2018 Walid Helaoui. All rights reserved.
//

import UIKit

class DailyQuizA1ViewController: UIViewController {

    @IBOutlet weak var reponse1: UITextField!
    var reponses: DailyQuizA2ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "reponse1Segue" {
            
            self.reponses = segue.destination as? DailyQuizA2ViewController
            self.reponses?.info1 = (reponse1.text)
            
        }
    }

}
