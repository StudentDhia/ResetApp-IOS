//
//  QuizAlcohol8ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 14/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit

class QuizAlcohol8ViewController: UIViewController {
    
    var score: Int = 0
    var details: QuizAlcohol9ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueA1Q8" {
            
            self.details = segue.destination as? QuizAlcohol9ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "SegueA2Q8" {
            
            self.details = segue.destination as? QuizAlcohol9ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "SegueA3Q8" {
            
            self.details = segue.destination as? QuizAlcohol9ViewController
            self.details?.score = score + 3
            
        }
        
        if segue.identifier == "SegueA4Q8" {
            
            self.details = segue.destination as? QuizAlcohol9ViewController
            self.details?.score = score + 4
            
        }
        
        if segue.identifier == "SegueA5Q8" {
            
            self.details = segue.destination as? QuizAlcohol9ViewController
            self.details?.score = score + 5
            
        }
        
    }

}
