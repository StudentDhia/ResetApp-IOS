//
//  QuizCig2ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/14/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit
import CoreData

class QuizCig2ViewController: UIViewController {
    
    
    
    @IBOutlet weak var ajout1Q2: UIButton!
    @IBOutlet weak var ajout2Q2: UIButton!
    
    var details: QuizCig3ViewController?
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
    
    
    @IBAction func ajout1Quiz2(_ sender: Any) {
        
        score = score + 1
        
    }
    
    @IBAction func ajout2Quiz2(_ sender: Any) {
        
        score = score + 0
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueC1Q2" {
            
            self.details = segue.destination as? QuizCig3ViewController
            self.details?.score = score + 1
            
        }
        
        if segue.identifier == "segueC2Q2" {
            
            self.details = segue.destination as? QuizCig3ViewController
            self.details?.score = score
            
        }
        
    }
    
    
    
}
