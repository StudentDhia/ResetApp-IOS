//
//  QuizAlcohol1ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/22/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizAlcohol1ViewController: UIViewController {
    
    @IBOutlet weak var reponse1: UIButton!
    @IBOutlet weak var reponse2: UIButton!
    @IBOutlet weak var reponse3: UIButton!
    @IBOutlet weak var reponse4: UIButton!
    @IBOutlet weak var reponse5: UIButton!
    
    var details: QuizAlcohol2ViewController?
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueA1Q1" {
            
            self.details = segue.destination as? QuizAlcohol2ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "SegueA2Q1" {
            
            self.details = segue.destination as? QuizAlcohol2ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "SegueA3Q1" {
            
            self.details = segue.destination as? QuizAlcohol2ViewController
            self.details?.score = score + 3
            
        }
        
        if segue.identifier == "SegueA4Q1" {
            
            self.details = segue.destination as? QuizAlcohol2ViewController
            self.details?.score = score + 4
            
        }
        
        if segue.identifier == "SegueA5Q1" {
            
            self.details = segue.destination as? QuizAlcohol2ViewController
            self.details?.score = score + 5
            
        }
    
    }
}
