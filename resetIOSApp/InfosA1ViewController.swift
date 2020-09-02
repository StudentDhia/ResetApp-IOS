//
//  InfosA1ViewController.swift
//  ProjectRESET
//
//  Created by Xeon on 1/10/18.
//  Copyright © 2018 Xeon. All rights reserved.
//

import UIKit

class InfosA1ViewController: UIViewController {
    
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
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                //right view controller
                //self.navigationController?.pushViewController(Infos2SmokingViewController(), animated: true)
                let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "InfosA2ViewController")
                self.navigationController?.pushViewController(secondViewController!, animated: true)
                
            case UISwipeGestureRecognizerDirection.left:
                //left view controller
                //let newViewController = Infos2SmokingViewController()
                //self.navigationController?.pushViewController(newViewController, animated: true)
                
                let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "InfosA2ViewController")
                self.navigationController?.pushViewController(secondViewController!, animated: true)
                
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
