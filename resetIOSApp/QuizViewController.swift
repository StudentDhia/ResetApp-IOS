//
//  ViewController.swift
//  RESETProject
//
//  Created by Xeon on 11/14/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var timer: Timer!
    var countdown: Int = 0
    var countdown2: Int = 0
    
    @IBOutlet weak var bienvenue: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.countdown = 5
        self.countdown2 = 5
        
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(QuizViewController.updateCountdown), userInfo: nil, repeats: true)
        
        self.timer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(QuizViewController.updateCountdown2), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCountdown() {
        
        bienvenue.text = "Let's have a quiz here"
        avatar.image = UIImage(named: "monokuma2")
        
        self.countdown -= 1
        
        if self.countdown == 0 {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    func updateCountdown2() {
        
        self.countdown2 -= 1
        
        if self.countdown2 == 0 {
            self.timer.invalidate()
            self.timer = nil
        }
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ChoixView") as! ChoixViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
}


