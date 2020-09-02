//
//  QuizCig4ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/21/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizCig4ViewController: UIViewController {
    
    
    var details: QuizCig5ViewController?
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SCORE =  \(score)")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueC1Q4" {
            
            self.details = segue.destination as? QuizCig5ViewController
            self.details?.score = score + 3
            
        }
        
        if segue.identifier == "segueC2Q4" {
            
            self.details = segue.destination as? QuizCig5ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "segueC3Q4" {
            
            self.details = segue.destination as? QuizCig5ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "segueC4Q4" {
            
            self.details = segue.destination as? QuizCig5ViewController
            self.details?.score = score
            
        }
        
    }
    
}
