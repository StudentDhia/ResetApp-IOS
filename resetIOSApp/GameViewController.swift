//
//  GameViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 14/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var cigArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score : \(score)"
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(GameViewController.increaseScore))

        img1.addGestureRecognizer(recognizer1)
        img2.addGestureRecognizer(recognizer2)
        img3.addGestureRecognizer(recognizer3)
        img4.addGestureRecognizer(recognizer4)
        img5.addGestureRecognizer(recognizer5)
        img6.addGestureRecognizer(recognizer6)
        img7.addGestureRecognizer(recognizer7)
        img8.addGestureRecognizer(recognizer8)
        img9.addGestureRecognizer(recognizer9)
        
        img1.isUserInteractionEnabled = true
        img2.isUserInteractionEnabled = true
        img3.isUserInteractionEnabled = true
        img4.isUserInteractionEnabled = true
        img5.isUserInteractionEnabled = true
        img6.isUserInteractionEnabled = true
        img7.isUserInteractionEnabled = true
        img8.isUserInteractionEnabled = true
        img9.isUserInteractionEnabled = true
        
        counter = 30
        timerLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(GameViewController.hideCig), userInfo: nil, repeats: true)
        
        cigArray.append(img1)
        cigArray.append(img2)
        cigArray.append(img3)
        cigArray.append(img4)
        cigArray.append(img5)
        cigArray.append(img6)
        cigArray.append(img7)
        cigArray.append(img8)
        cigArray.append(img9)
        
        hideCig()
        
        // Do any additional setup after loading the view.
    }
    
    func increaseScore() {
        score += 1
        scoreLabel.text = "Score : \(score)"
    }

    func countDown(){
        counter = counter - 1
        timerLabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            let alert = UIAlertController(title: "time", message: "Your Time Is Up", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
            
        }

    }
    
    func hideCig(){
        for cig in cigArray {
            cig.isHidden = true
        }
        let rondomNumber = Int(arc4random_uniform(UInt32(cigArray.count - 1)))
        cigArray[rondomNumber].isHidden = false
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
