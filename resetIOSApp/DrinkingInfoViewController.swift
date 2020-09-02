//
//  DrinkingInfoViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 12/01/2018.
//  Copyright © 2018 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire
import UICircularProgressRing

class DrinkingInfoViewController: UIViewController {

    var infoS1: String!
    var infoS2: String!
    
    @IBOutlet weak var motivationText: UILabel!
    @IBOutlet weak var kumaImage: UIImageView!
    
    @IBOutlet weak var heartBar: UICircularProgressRingView!
    @IBOutlet weak var heartBar3: UICircularProgressRingView!
    
    @IBOutlet weak var daysLife: UILabel!
    
    @IBOutlet weak var lungsButton: UIButton!
    
    @IBOutlet weak var dashboard: UIButton!
    
    let pics : [UIImage] = [UIImage(named: "monokuma")!,UIImage(named: "monokuma2")!,UIImage(named: "monokuma3")!]

    @IBAction func dashboard(_ sender: Any) {
        
        self.view.window!.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // You can set the animationStyle like this
        heartBar.animationStyle = kCAMediaTimingFunctionLinear
        heartBar.setProgress(value: 21, animationDuration: 5, completion: nil)
        heartBar3.animationStyle = kCAMediaTimingFunctionLinear

        
        let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]
        let parameters = [
            "drinkNumber": infoS1,
            "drinkPrice": infoS2,
            ] as [String : Any]
        
        print(parameters)
        let url = ViewController.ServerURL+"drinking/quiz"
        Alamofire.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default,headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print("done")
                
            case .failure(let error):
                print(error)
                print("try again")
            }
        }
        
        
        
        if ViewController.user.drink_score < 4{
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                self.motivationText.text = "Not drinking eh ? Good job"
            }
            
        }else if ViewController.user.drink_score < 6 && ViewController.user.drink_score > 3 {
            
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                self.motivationText.text = "Pls don't drink. that's not cool"
                self.kumaImage.image = self.pics[1]
            }
            
        }else{
            
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                
                self.motivationText.text = "Well well, Drinking to death eh ?"
                self.kumaImage.image = self.pics[2]
            }
            
        }
        
        
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
