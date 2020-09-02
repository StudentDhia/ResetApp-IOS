//
//  QuizCig6ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/22/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizCig6ViewController: UIViewController {
    
    var details: QuizScoreViewController?
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
        
        if segue.identifier == "segueC1Q6" {
            
            self.details = segue.destination as? QuizScoreViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "segueC2Q6" {
            
            self.details = segue.destination as? QuizScoreViewController
            self.details?.score = score
            
        }
        
    }
    
}
