//
//  QuizAlcohol7ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 14/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit

class QuizAlcohol7ViewController: UIViewController {
    
    var score: Int = 0
    var details: QuizAlcohol8ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueA1Q7" {
            
            self.details = segue.destination as? QuizAlcohol8ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "SegueA2Q7" {
            
            self.details = segue.destination as? QuizAlcohol8ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "SegueA3Q7" {
            
            self.details = segue.destination as? QuizAlcohol8ViewController
            self.details?.score = score + 3
            
        }
        
        if segue.identifier == "SegueA4Q7" {
            
            self.details = segue.destination as? QuizAlcohol8ViewController
            self.details?.score = score + 4
            
        }
        
        if segue.identifier == "SegueA5Q7" {
            
            self.details = segue.destination as? QuizAlcohol8ViewController
            self.details?.score = score + 5
            
        }
        
    }
}
