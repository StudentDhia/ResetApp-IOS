//
//  QuizCig3ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/21/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizCig3ViewController: UIViewController {
    
    
    @IBOutlet weak var ajout1Q3: UIButton!
    @IBOutlet weak var ajout2Q3: UIButton!
    
    
    var details: QuizCig4ViewController?
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        print("SCORE =  \(score)")
        
    }
    
    @IBAction func ajout1Quiz3(_ sender: Any) {
        
        score = score + 1
    }
    
    @IBAction func ajout2Quiz3(_ sender: Any) {
        
        score = score + 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueC1Q3" {
            
            self.details = segue.destination as? QuizCig4ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "segueC2Q3" {
            
            self.details = segue.destination as? QuizCig4ViewController
            self.details?.score = score
            
        }
        
    }
    
}
