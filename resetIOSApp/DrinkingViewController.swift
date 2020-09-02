//
//  SmokingViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 07/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire

class DrinkingViewController: UIViewController {

    @IBOutlet weak var DrinkingView: UIView!
    @IBOutlet weak var savedMoney: UILabel!
    @IBOutlet weak var savedMoneyBtn: UIButton!
    @IBOutlet weak var quizBtn: UIButton!
    @IBOutlet weak var statisticsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDrinkingMoneySaved()
      
        
        DrinkingView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        savedMoney.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            
        }, completion: nil)
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
    
    func getDrinkingMoneySaved() {
        
        /*let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]*/
        let url = ViewController.ServerURL+"DrinkingSavedMoney.php?id="+ViewController.user.token
        Alamofire.request(url, method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                
                let dict = response.result.value as! NSNumber
                print(dict)
                
                let savedMoney = dict as! Int
                self.savedMoney.text = savedMoney.description + " $"
            case .failure(let error):
                print(error)
                print("try again")
            }
            
            
        }
        
        
    }


}
