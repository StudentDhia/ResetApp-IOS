//
//  HomeViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 23/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire
import UserNotifications

class SmokingViewController: UIViewController {

    @IBOutlet weak var SmokingView: UIView!
    @IBOutlet weak var SmokingStatbtn: UIButton!
    @IBOutlet weak var SmokingQuizbtn: UIButton!
    @IBOutlet weak var SmokingMoneySavedbtn: UIButton!
    @IBOutlet weak var SmokingMoneySaved: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !ViewController.user.smoker{
            SmokingMoneySavedbtn.isHidden = true
            SmokingMoneySaved.isHidden = true
            SmokingQuizbtn.isHidden = true
            SmokingStatbtn.isHidden = true
        }else {
           getSmokingMoneySaved() 
        }
        
        SmokingView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        SmokingMoneySaved.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
        
        UIView.animate(withDuration: 2.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            
        }, completion: nil)
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getSmokingMoneySaved() {
        
        /*let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]*/
        let url = "http://41.226.11.243:10080/reset/webservices/SmokingSavedMoney.php?"+ViewController.user.token
        Alamofire.request(url, method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                
                let dict = response.result.value as! NSNumber
                print(dict)
                
                let savedMoney = dict as! Int
                self.SmokingMoneySaved.text = savedMoney.description + " $"
            case .failure(let error):
                print(error)
                print("try again")
            }
            
            
        }


}
    
 /*   func getDrinkingMoneySaved() {
        
        let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]
        let url = ViewController.ServerURL+"drinking/savedMoney"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody,headers: headers).responseJSON {
            response in
            switch response.result {
            case .success:
                
                let dict = response.result.value as! Dictionary<String,AnyObject>
                
                
                let savedMoney = dict["savedMoney"] as! Float
                self.DrinkingMoneySaved.text = "Money Saved:" + savedMoney.description
            case .failure(let error):
                print(error)
                print("try again")
            }
 
            
        }
 
        
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] , completionHandler: {(granted,error) in
            
            if granted {
                print("Notification access granted")
            }else {
                print("")
            }
        })
        scheduleNotification(time: 11, completion: {
            success in
            if success {
                print("Successfully scheduled notification")
            }
        })
    }
    
    func scheduleNotification(time: TimeInterval,completion: @escaping (_ Success: Bool)->()){
        let notif = UNMutableNotificationContent()
        
        notif.title = "Quiz Alert"
        notif.subtitle = "You have a New Quiz"
        notif.body = "You still have a quiz waiting for response"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error ??  "")
                completion(false)
            }else {
                completion(true)
            }
        })

    }

}
