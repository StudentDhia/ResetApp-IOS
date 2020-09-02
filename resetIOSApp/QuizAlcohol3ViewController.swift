//
//  QuizAlcohol3ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 14/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit

class QuizAlcohol3ViewController: UIViewController {
    
    var score: Int = 0
    var details: QuizAlcohol4ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueA1Q3" {
            
            self.details = segue.destination as? QuizAlcohol4ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "SegueA2Q3" {
            
            self.details = segue.destination as? QuizAlcohol4ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "SegueA3Q3" {
            
            self.details = segue.destination as? QuizAlcohol4ViewController
            self.details?.score = score + 3
            
        }
        
        if segue.identifier == "SegueA4Q3" {
            
            self.details = segue.destination as? QuizAlcohol4ViewController
            self.details?.score = score + 4
            
        }
        
        if segue.identifier == "SegueA5Q3" {
            
            self.details = segue.destination as? QuizAlcohol4ViewController
            self.details?.score = score + 5
            
        }
        
    }


}
