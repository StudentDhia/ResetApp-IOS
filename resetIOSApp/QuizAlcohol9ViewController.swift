//
//  QuizAlcohol9ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 14/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit

class QuizAlcohol9ViewController: UIViewController {
    
    var score: Int = 0
    var details: QuizAlcohol10ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueA1Q9" {
            
            self.details = segue.destination as? QuizAlcohol10ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "SegueA2Q9" {
            
            self.details = segue.destination as? QuizAlcohol10ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "SegueA3Q9" {
            
            self.details = segue.destination as? QuizAlcohol10ViewController
            self.details?.score = score + 3
            
        }
        
    }

}
