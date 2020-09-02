//
//  QuizScoreViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/22/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizScoreViewController: UIViewController {
    
    var score: Int!
    
    @IBOutlet weak var scoreText: UILabel!
    
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
        
        if(score==1 || score==2){
            scoreText.text = "Low dependance"
        }else if score==3 || score==4{
            scoreText.text = "Low to moderate dependace"
        }else if score==5 || score==6 && score == 7{
            scoreText.text = "Moderate dependance"
        }else{
            scoreText.text = "High dependance"
        }
        
        let preferences = UserDefaults.standard
        
        let currentLevel = "QuizOK"
        let currentLevelKey = "currentLevel"
        preferences.set(currentLevel, forKey: currentLevelKey)
        
        preferences.synchronize()
        
    }
    
}
