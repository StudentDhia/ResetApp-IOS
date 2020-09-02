//
//  SmokingInfosViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 11/01/2018.
//  Copyright © 2018 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftySound
import UICircularProgressRing

class SmokingInfosViewController: UIViewController {
    
    var infoS1: String! = "0"
    var infoS2: String! = "0"

    @IBOutlet weak var motivationText: UILabel!
    @IBOutlet weak var kumaImage: UIImageView!
    
    @IBOutlet weak var heartBar: UICircularProgressRingView!
    @IBOutlet weak var heartBar3: UICircularProgressRingView!
    
    @IBOutlet weak var daysLife: UILabel!
    
    @IBOutlet weak var lungsButton: UIButton!
    
    @IBAction func dashboard(_ sender: Any) {
        self.view.window!.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let pics : [UIImage] = [UIImage(named: "monokuma")!,UIImage(named: "monokuma2")!,UIImage(named: "monokuma3")!]
        
        let score: Int = ViewController.user.drink_score

        
        // Do any additional setup after loading the view.
        
        let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]
        let parameters = [
            "cigaretteNumber": infoS1,
            "cigarettePrice": infoS2,
            ] as [String : Any]

        print(parameters)
        let url = ViewController.ServerURL+"smoking/quiz"
        Alamofire.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default,headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print("done")
                
            case .failure(let error):
                print(error)
                print("try again")
            }
        }
        
        
        
        if score < 4{
            
            motivationText.text = "Ooooooh well done. Keep on the good job"
        }else if score < 6 && score > 3 {
            
            motivationText.text = "We have a long way to go huh. Stop smoking now"
            kumaImage.image = pics[1]
        }else{
            
            motivationText.text = "Enough smoking. NOW."
            kumaImage.image = pics[2]
            
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                self.motivationText.text = "Well well, Drinking to death eh ?"
                self.kumaImage.image = pics[2]
            }
            
        }



        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        // You can set the animationStyle like this
        heartBar.animationStyle = kCAMediaTimingFunctionLinear
        heartBar.setProgress(value: 21, animationDuration: 5, completion: nil)
        heartBar3.animationStyle = kCAMediaTimingFunctionLinear
        
        
        let animation = CABasicAnimation(keyPath: "position")
        
        if(Int((heartBar?.value)!) > 20){
            lungsButton.imageView?.image = #imageLiteral(resourceName: "lungs2-1")
            animation.duration = 0.15
        }else if(Int((heartBar?.value)!) > 30){
            lungsButton.imageView?.image = #imageLiteral(resourceName: "lungs3")
            animation.duration = 0.07
        }else{
            lungsButton.imageView?.image = #imageLiteral(resourceName: "lungs1")
            animation.duration = 0.2
        }
        
        animation.repeatCount = 9999
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: lungsButton.center.x - 10, y: lungsButton.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: lungsButton.center.x + 10, y: lungsButton.center.y))
        lungsButton.layer.add(animation, forKey: "position")
    }

    
    
}
