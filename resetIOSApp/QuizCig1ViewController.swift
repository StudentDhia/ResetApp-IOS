//
//  QuizCig1ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/14/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit
import CoreData

class QuizCig1ViewController: UIViewController {
    
    @IBOutlet weak var Add1Q1: UIButton!
    @IBOutlet weak var Add2Q1: UIButton!
    @IBOutlet weak var Add3Q1: UIButton!
    
    var score = 0
    var details: QuizCig2ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ajout1(_ sender: Any) {
        
        score = score + 3
    }
    
    @IBAction func ajout1Q1(_ sender: Any) {
        
        score = score + 2
    }
    
    @IBAction func ajout2Q1(_ sender: Any) {
        
        score = score + 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueC1Q1" {
            
            self.details = segue.destination as? QuizCig2ViewController
            self.details?.score = score + 2
            
        }
        
        if segue.identifier == "segueC2Q1" {
            
            self.details = segue.destination as? QuizCig2ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "segueC3Q1" {
            
            self.details = segue.destination as? QuizCig2ViewController
            self.details?.score = score
            
        }
    }
    
}
