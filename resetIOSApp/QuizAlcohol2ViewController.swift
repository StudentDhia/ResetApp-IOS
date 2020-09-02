//
//  QuizAlcohol2ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/22/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizAlcohol2ViewController: UIViewController {
    
    var score: Int = 0
    var details: QuizAlcohol3ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueA1Q2" {
            
            self.details = segue.destination as? QuizAlcohol3ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "SegueA2Q2" {
            
            self.details = segue.destination as? QuizAlcohol3ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "SegueA3Q2" {
            
            self.details = segue.destination as? QuizAlcohol3ViewController
            self.details?.score = score + 3
            
        }
        
        if segue.identifier == "SegueA4Q2" {
            
            self.details = segue.destination as? QuizAlcohol3ViewController
            self.details?.score = score + 4
            
        }
        
        if segue.identifier == "SegueA5Q2" {
            
            self.details = segue.destination as? QuizAlcohol3ViewController
            self.details?.score = score + 5
            
        }
        
    }
}
