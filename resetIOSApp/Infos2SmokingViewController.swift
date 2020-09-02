//
//  Infos2SmokingViewController.swift
//  ProjectRESET
//
//  Created by Xeon on 12/6/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class Infos2SmokingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                //right view controller
                //self.navigationController?.pushViewController(Infos2SmokingViewController(), animated: true)
                let secondViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "Infos1SmokingViewController")
                self.navigationController?.pushViewController(secondViewController2!, animated: true)
                
            case UISwipeGestureRecognizerDirection.left:
                //left view controller
                //let newViewController = Infos2SmokingViewController()
                //self.navigationController?.pushViewController(newViewController, animated: true)
                
                let secondViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "Infos3SmokingViewController")
                self.navigationController?.pushViewController(secondViewController2!, animated: true)
                
            default:
                break
            }
        }
    }
    
}
